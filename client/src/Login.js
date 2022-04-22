import React, { useState } from 'react';
import axios from 'axios';
import PropTypes from 'prop-types';
import './Login.css';
import { useNavigate } from "react-router-dom";


function loginUser(credentials) {
  return axios.post('http://localhost:3001/auth', credentials)
    .then(response => response.data);
}

function LoginPrompt({prompt}){
  return(
    <>
      <label id="loginPrompt">
        {prompt}
      </label>
    </>
  );
}

export default function Login() {
  const [username, setUserName] = useState();
  const [password, setPassword] = useState();
  const [prompt, setPrompt] = useState("");

  const navigate = useNavigate();

  const handleSubmit = async e => {
    e.preventDefault();

    console.log('waiting for auth')
    try {
      const token = await loginUser({
        username,
        password
      });
    
      console.log("auth complete")
      var prompt;
      if(token==='Incorrect Username and/or Password!'){
        prompt = "Incorrect Username and/or Password!";
        setPrompt(prompt);
        console.log(prompt);
      }
      else if (token==='Please enter Username and Password!'){
        prompt = "Please enter Username and Password!";
        setPrompt(prompt);
        console.log(prompt);
      }
      else{
        sessionStorage.setItem('user-token', token);
        navigate('/');
      }
    }
    catch (err){
      console.log(err.response.status)
    }
  }
  
  return(
    <div className="login-wrapper">
      <div id="loginHeading">Login</div>
      <form onSubmit={handleSubmit}>
        <label>
          <p >Username</p>
          <input className="formInput loginFormInput" type="text" placeholder='username' onChange={e => setUserName(e.target.value)}/>
        </label>
        <label>
          <p>Password</p>
          <input className="formInput loginFormInput" type="password" placeholder='password' onChange={e => setPassword(e.target.value)}/>
        </label>
        <div id='submitButtonWrapper'>
          <button id="submitBtn" type="submit" value="Login">Submit</button>
        </div>
        <LoginPrompt prompt={prompt} />
      </form>
    </div>
  )
}


