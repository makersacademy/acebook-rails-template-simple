import React, { useEffect, useState } from "react"
import '../App.css';
import './Posts.css';
import CreatePost from './CreatePost';

const Posts = () => {
  const [posts, setData] = useState([]);

  useEffect(() => {
    const url = "http://localhost:3000/api/v1/posts";

    const fetchData = async () => {
      try {
        const response = await fetch(url);
        const json = await response.json();
        console.log(json.data);
        setData(json.data);
      } catch (error) {
        console.log("error", error);
      }
    };

    fetchData();
  }, []);

  return (
    <div class='all_posts'>
      {posts.reverse().map((post, index) => (
        <div class='posts'>
        <p class='post_message'>{post.message}</p>
        <br></br>
        <p class='post_created_at'>{'created at' + ' ' + post.created_at.slice(0,10) + ' ' + post.created_at.slice(11,16)}</p>
        </div>
      ))}
    </div>
  );
};

export default Posts;
