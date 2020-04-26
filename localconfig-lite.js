const fs = require('fs');

exports.LocalConfig = function (localizer, project) {
    project.mml.Stylesheet.push({
        id: "palette-lite.mss",
        data: fs.readFileSync("./palette-lite.mss", "utf-8"),
    });

    project.mml.Layer = project.mml.Layer.filter(function (l) {
        if (l.class) {
            if (l.class.match(/cyclosm-lite/)) {
                return true;
            }
        }
        return false;
    });

    project.mml.Layer.map(function (l) {
        if (l.Datasource.type == "postgis") {
            l.Datasource.table = "(SELECT 1 AS is_lite, * FROM " + l.Datasource.table + ") AS data";
        }
    });

    localizer.where("Layer").if({
        "Datasource.type": "postgis"
    }).then({
        "Datasource.password": "gis",
        "Datasource.user": "gis",
        "Datasource.host": "localhost"
    });

    localizer.where("Layer").if({
        "Datasource.dbname": "osm"
    }).then({
        "Datasource.dbname": "gis"
    });
};
