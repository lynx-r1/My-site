// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var fadeToUp = 1;
var fadeToDown = 0.8;
var fadeDuration = 500;

function fadeDown(obj) {
    $(obj).stop().fadeTo(fadeDuration, fadeToDown);
}

function fadeUp(obj) {
    $(obj).stop().fadeTo(fadeDuration, fadeToUp);
}

function fadeEffect(elem) {
    $(elem).hover(function() {
        fadeDown(this);
    }, function() {
        fadeUp(this);
    })
}

function twitter_profile() {
    var textColor = $("#nav_bar ul li a").css("color");
    var transparentColor = $("#nav_bar").css("background-color");
    var backgroundColor = $("body").css("background-color")

    new TWTR.Widget({
      version: 2,
      type: 'profile',
      rpp: 4,
      interval: 6000,
      width: 'auto',
      height: 300,
      theme: {
        shell: {
          background: transparentColor,
          color: '#111'
        },
        tweets: {
          background: backgroundColor,
          color: '#111',
          links: textColor
        }
      },
      features: {
        scrollbar: false,
        loop: false,
        live: false,
        hashtags: true,
        timestamp: true,
        avatars: false,
        behavior: 'all'
      }
    }).render().setUser('lynx_r1').start();
}

$(document).ready(function() {
    var textColor = $("#nav_bar ul li a").css("color");

    // fade effect for navigation
    $("#nav_bar li.nav_button a").not(".selected").hover(function() {
        fadeDown(this);
    }, function() {
        fadeUp(this);
    });

    $("#subnav_top li.subnav_button a").not(".selected").hover(function() {
        fadeDown(this);
    }, function() {
        fadeUp(this);
    });

    // fade effect for home page
    fadeEffect("#tags_home");
    fadeEffect("#post_notes_home");
    fadeEffect("#post_its_home");
    fadeEffect("#projects_home");
    fadeEffect(".posts_entry");
    fadeEffect(".projects_entry");

    // underline bottom menu items
    $("#subnav_bottom li.nav_button a").not(".selected").hover(function() {
        $(this).css("text-decoration", "underline");
    }, function() {
        $(this).css("text-decoration", "none");
    });

    // add glass effect
    $("#nav_bar").prepend("<div class='nav_bar_glass_effect'></div>");
    $("#nav_bar li.nav_button a").prepend("<div class='nav_button_glass_effect'></div>");
    $("#subnav_top li.subnav_button a").prepend("<div class='subnav_button_glass_effect'></div>");
    $("#footer").prepend("<div class='footer_glass_effect'></div>");

    // greeting message on instead top submenu
    $("li.nav_button.selected#home").each(function() {
        $("#subnav_top").html("<div style='text-align: center; line-height: 1.5em; font-size: 1em; " +
                "font-weight: bold; color:" + textColor + ";'>Добро пожаловать!</div>");
    });

    $("li.nav_button.selected#about_me").each(function() {
        $("#subnav_top").html("<div style='text-align: center; line-height: 1.5em; font-size: 1em; " +
                "font-weight: bold; color:" + textColor + ";'>Привет!</div>");
    });

    // drop up menu in bottom submenu
    $("#subnav_bottom ul.navigation li.nav_button").hover(function() {
        $(this).find("ul").hide().show("slow");
    }, function() {
        $(this).find("ul").hide("slow");
    });

    window.onload = function () {
        var map = new YMaps.Map(document.getElementById("ymapsID"));
        map.setCenter(new YMaps.GeoPoint(35.778928,52.446737, 35.778928,52.446736), 12);
        map.enableScrollZoom(true);
        map.addControl(new YMaps.Zoom());
        map.addControl(new YMaps.ToolBar());
        map.addControl(new YMaps.MiniMap());
        map.addControl(new YMaps.ScaleLine());
        map.addControl(new YMaps.TypeControl());
    };
});
