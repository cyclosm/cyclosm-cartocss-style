const fs = require('fs');

exports.LocalConfig = function (localizer, project) {
    if (process.env.LOCALCONFIG_PATH) {
        var data = fs.readFileSync(process.env.LOCALCONFIG_PATH, 'utf-8');
        try {
            localizer.fromString(data);
            console.warn('[Local Config]', 'Patched config from', process.env.LOCALCONFIG_PATH);
        } catch (err) {
            console.error(err);
        }
    }

    var layers = process.env.ONLY_LAYER_ID.split(',');
    project.mml.Layer = project.mml.Layer.filter(function (l) {
        if (layers.indexOf(l.id) !== -1) {
            return true;
        }
        return false;
    });
};
