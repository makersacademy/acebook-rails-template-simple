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
//= require_tree .
showAll = false

function showComments(id) {
  var div = document.querySelector(`#${id}`)
  var nodelist = div.getElementsByTagName("p")
  var showAll = div.getElementsByTagName("h6")[0]

  showAll.innerText = (showAll.innerText === "true" ? "false" : "true");

  for (i = 2; i < nodelist.length; i++) {
    if (showAll.innerText === "true") {
      nodelist[i].hidden = false
    } else {
      nodelist[i].hidden = true
    }
  }
}
  // if (showAll) {
  //   for (i = 2; i < nodelist.length; i++) {
  //     nodelist[i].hidden = true
  //   }
  //   showAll = false
  // } else {
  //   for (i = 2; i < nodelist.length; i++) {
  //     nodelist[i].hidden = false
  //   }
  //   showAll = true
  // }

	// if (document.querySelector(`#${id}`).hidden) {
	// 	document.querySelector(`#${id}`).hidden = false;
	// } else {
	// 	document.querySelector(`#${id}`).hidden = true;
	// }
