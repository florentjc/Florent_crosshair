window.addEventListener("message", function(e) {
    const event = e.data;
    if (event.action == "scope") {
        ShowSniperScope(event.display);
    }
    if (event.action == "point") {
        ShowPoint(event.display);
    }
    if (event.action == "bigpoint") {
        ShowBigPoint(event.display);
    }
    if (event.action == "HideAll") {
        ShowSniperScope(false);
        ShowPoint(false);
        ShowBigPoint(false);
    }
})

var scope = false;
function ShowSniperScope(display) {
    if(scope == display) {
        return
    };
    scope = display;
    if(display) {
        $("#sniper-scope").css("display", "block");
        $("#sniper-scope").css("animation", "ShowCrosshair 0.25s linear");
    } else {
        $("#sniper-scope").css("animation", "HideCrosshair 0.25s linear");
        $("#sniper-scope").one("animationend", function(){
            $("#sniper-scope").css("display", "none");
        });
    }
}

var point = false;
function ShowPoint(display) {
    if(point == display) {
        return
    };
    point = display;
    if(display) {
        $("#point").css("display", "block");
        $("#point").css("animation", "ShowCrosshair 0.25s linear");
    } else {
        $("#point").css("animation", "HideCrosshair 0.25s linear");
        $("#point").one("animationend", function(){
            $("#point").css("display", "none");
        });
    }
}

var bigpoint = false;
function ShowBigPoint(display) {
    if(bigpoint == display) {
        return
    };
    bigpoint = display;
    if(display) {
        $("#big-point").css("display", "block");
        $("#big-point").css("animation", "ShowCrosshair 0.25s linear");
    } else {
        $("#big-point").css("animation", "HideCrosshair 0.25s linear");
        $("#big-point").one("animationend", function(){
            $("#big-point").css("display", "none");
        });
    }
}