import React from 'react';
import '../../App.css';
import '../../App.js';
import Posts from '../Posts';
import CreatePost from '../CreatePost';

function PostsPage() {
  const button = document.querySelector('#post_btn')
  console.log(button)
  return (
    <>
      <CreatePost />
      <Posts />
    </>
  );
}

export default PostsPage;