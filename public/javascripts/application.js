// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {
    $("li.nav_button").not(".selected").hover(function() {
        $(this).stop().fadeTo(500, 0.7);
    }, function() {
        $(this).stop().fadeTo(500, 1);
    });

    $("li.subnav_button").not(".selected").hover(function() {
        $(this).stop().fadeTo(500, 0.7);
    }, function() {
        $(this).stop().fadeTo(500, 1);
    });
});
