// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .

function copyToClipboard(){
  // Get the link to be copied
  var short = document.getElementById("short");

  // Create temporary input as copying link text is not supported by execCommand
  // method
  var input = document.createElement("INPUT");
  input.setAttribute("type", "text");
  input.setAttribute("value", short.innerText);
  input.setAttribute("id", "temp_input");

  // Temporarly display the input under parent
  var parentDiv = document.getElementById("parent");
  parentDiv.insertBefore(input, short);

  //Copy the link to the clipboard
  input.select()
  document.execCommand("copy");

  //Delete the input as it's not needed anymore
  input.parentNode.removeChild(input)
}
