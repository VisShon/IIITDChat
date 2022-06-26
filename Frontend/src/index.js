import React from 'react'; 
import ReactDOM from 'react-dom';

import {
  BrowserRouter,
  Routes,
  Route,
} from "react-router-dom";
import Login from './Login';

import './index.css';

import App from './App';

ReactDOM.render(
  <BrowserRouter>
    <Routes>
      <Route path="/" element={<App secttion="chats"/>} />
      <Route path="/login" element={<Login />} />
    </Routes>
  </BrowserRouter>,
  document.getElementById('root')
);

