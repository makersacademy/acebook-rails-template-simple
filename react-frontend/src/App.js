import React from 'react';
import Navbar from './components/Navbar';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom'
import './App.css';
import Home from './components/pages/Home';
import About from './components/pages/About';
import Products from './components/pages/Products';
import SignUp from './components/pages/SignUp';
import ErrorPage from './components/pages/ErrorPage';
import Posts from './components/pages/Posts';

function App() {
  return (
    <>
    <Router>
      <Navbar />
      <Routes>
          <Route path='/' element={<Home/>} />
        
          <Route path='/about' element={<About/>} />
         
          <Route path='/products' element={<Products/>} />
          {/* <Products /> */}
          <Route path='/sign-up' element={<SignUp/>} />
          <Route path="*" element={<ErrorPage/>} />
          <Route path='/posts' element={<Posts/>} />
          <Route path='/posts/new' element={<Posts/>} />
      </Routes>

    </Router>
    </>
  );
};

const CreatePost = () => {
  const url = "http://localhost:3000/api/v1/posts";
  const requestOptions = {
    method: 'POST',
    headers: { 'Content-Type': 'application/json'},
    body: JSON.stringify({ message: `${String(document.querySelector(".post-body").value)}` })
    };
  fetch(url, requestOptions)
    .then(response => response.json())
    .then(json => json.data)
};

export default App;