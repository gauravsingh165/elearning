// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/assets/javascripts/application.js
$(document).on("turbolinks:load", function () {
    $("#course-filter-form").on("submit", function (e) {
      e.preventDefault();
  
      var form = $(this);
      var url = form.attr("action");
      var formData = form.serialize();
  
      $.get(url, formData, function (data) {
        $("#course-list").html(data);
      });
    });
  });
  