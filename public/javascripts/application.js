// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $("#nav_bar li.nav_button a").not(".selected").hover(function() {
        $(this).stop().fadeTo(500, 0.7);
    }, function() {
        $(this).stop().fadeTo(500, 1);
    });

    $("#subnav_top li.subnav_button a").not(".selected").hover(function() {
        $(this).stop().fadeTo(500, 0.7);
    }, function() {
        $(this).stop().fadeTo(500, 1);
    });

    $("#subnav_bottom li.nav_button a").not(".selected").hover(function() {
        $(this).css("text-decoration", "underline");
    }, function() {
        $(this).css("text-decoration", "none");
    });

    $("#nav_bar").prepend("<div class='nav_bar_glass_effect'></div>");
    $("#nav_bar li.nav_button a").prepend("<div class='nav_button_glass_effect'></div>");
    $("#subnav_top li.subnav_button a").prepend("<div class='subnav_button_glass_effect'></div>");
    $("#footer").prepend("<div class='footer_glass_effect'></div>");

    $("#post_it_submit").click(function() {
        $("#post_saved").show("slow").delay(2000).hide("slow");
    });

    $("#post_event_submit").click(function() {
        $("#post_saved").show("slow").delay(2000).hide("slow");
    });

    $("li.nav_button.selected#home").each(function() {
        $("#subnav_top").html("<div style='text-align: center; line-height: 1.5em; font-size: 1em; font-weight: bold; color: green;'>" +
                "Welcome!</div>");
    });

    $("li.nav_button.selected#about_me").each(function() {
        $("#subnav_top").html("<div style='text-align: center; line-height: 1.5em; font-size: 1em; font-weight: bold; color: green;'>" +
                "Hi!</div>");
    });
});
