function applyStyles() {
    $("input").attr("autocomplete", "off");
}

$(document).ready(function () {
    applyStyles();

    var manager = Sys.WebForms.PageRequestManager.getInstance();

    manager.add_endRequest(applyStyles);
});