import './App.css';
import { Navigate } from "react-router-dom";
import { useEffect, useState } from 'react';
import axios from 'axios';
import PrimaryWindow from './PrimaryWindow';
import SecondaryWindow from './SecondaryWindow';

function App(props) {

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
      <div id="profileBar">Profile Bar</div>
      <PrimaryWindow section={props.section}/>
      <SecondaryWindow />
    </div>
    </>
  );
}

export default App;
