exports.LocalConfig = function (localizer, project) {
    project.mml.Layer.map(function (l) {
        if (l.Datasource.type == "postgis") {
            l.Datasource.table = "(SELECT *, 0 AS is_lite FROM " + l.Datasource.table + ") AS data";
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
