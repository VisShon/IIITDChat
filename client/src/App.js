import './App.css';
import { Navigate } from "react-router-dom";
import { useEffect } from 'react';
import axios from 'axios';

function App() {
  if (!sessionStorage.getItem('user-token')) return <Navigate to='/login' />

  // useEffect( () => {
  //   const getter = async () => {
  //     const payload = {
  //       user: "rada",
  //     }

  //     const res = await axios("http://localhost:3001/api/test", {
  //       data: { user: "rada" }
  //     })
  //     console.log(res);
  //   }
  //   getter()
  // })

  return (
    <>
    Home
    </>
  );
}

export default App;
