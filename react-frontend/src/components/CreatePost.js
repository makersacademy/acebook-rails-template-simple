import React, { useEffect, useState } from "react"
import '../App.css';
import './CreatePost.css';

const CreatePost = () => {

    const savePost = () => {
      const url = "http://localhost:3000/api/v1/posts";
      const requestOptions = {
        method: 'POST',
        headers: { 'Content-Type': 'application/json'},
        body: JSON.stringify({ message: `${document.querySelector(".post-body").value}` })
        };
      fetch(url, requestOptions)
        .then(response => response.json())
        .then(json => json.data)
    };
    
    return (
      <>
      <div class="post-form">
      <form>
        <label for="body">New Post</label>
        <textarea class="post-body" cols="50" rows="10" name="body" oninput="countCharacters(event)"></textarea>
        <button onClick={savePost} type="submit">Save</button>
      </form>
      </div>
      </>
    );
  };

export default CreatePost;
