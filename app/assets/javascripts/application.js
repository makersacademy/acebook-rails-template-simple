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


  // Show form warning if empty post is submitted

  console.log("application")

  let deleteFlashMessages = () => {
    let existingFlash = document.getElementById("flashmessage");
    if (existingFlash) {
      existingFlash.remove();
    }
  }

  let clearInput = () => {
    let textInput = document.querySelectorAll('input[type=text]');
    for (const text of textInput) {
      text.value = "";
    }
  }

  let deleteComment;

  let renderPost;

  let likePost;

  let unlikePost;

  let deletePost;

  let updatePost;

  let renderComment;

  let showFriendsPosts;

  let showAllPosts;

  let addFunctionality;

