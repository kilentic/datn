function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

$(document).ready(function() {
  $(".carousel").carousel({
    interval: 6000,
    pause: "hover"
  });
  $("#srch-term").focusout(async function() {
    if ($(document).width() < 768) {
      $("#search-form").removeClass("search-focus", 500);
      await sleep(500);
      $(".site-name-header").removeClass("site-name-logo-hide", 500);
    }
  });
  $("#srch-term").focus(function() {
    if ($(document).width() < 768) {
      $(".site-name-header").addClass("site-name-logo-hide", 500);
      $("#search-form").addClass("search-focus", 500);
    }
  });
  $("#sidebarCollapse").on("click", function() {
    $("#sidebar").toggleClass("active");
    if ($("#sidebar").hasClass("active")) {
      $("#content").css("margin-left", "80px");
    } else {
      if ($(document).width() > 768) {
        $("#content").css("margin-left", "200px");
      } else {
        $("#content").css("margin-left", "0px");
      }
    }
  });
});
