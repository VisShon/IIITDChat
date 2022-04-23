import './App.css';
import { Navigate } from "react-router-dom";
import { useEffect } from 'react';
import axios from 'axios';

function App() {

  // useEffect( () => {
  //   axios.get("/api/test", {
  //   })
  //   .then(res => {
  //       console.log('received something')
  //   })
  // }, [])

  if (!sessionStorage.getItem('user-token')) return <Navigate to='/login' />

  return (
    <>
    <div id="homeGrid">
      <div id="profileBar"></div>
      <div id='primaryWindow'>
        <div id='topNavBar'></div>
        <div id="topActionBar"></div>
      </div>
      <div id='secondaryWindow'></div>
    </div>
    </>
  );
}

export default App;
