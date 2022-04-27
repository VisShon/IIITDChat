import './App.css';
import { Navigate } from "react-router-dom";
import { useEffect, useState } from 'react';
import axios from 'axios';
import PrimaryWindow from './PrimaryWindow';
import SecondaryWindow from './SecondaryWindow';

function App(props) {
  const [profileName, setProfileName] = useState("Profile Name");
  const [section, setSection] = useState("chats");
  const [selectedItem, setSelectedItem] = useState("null");

  useEffect( () => {
    axios.get("http://localhost:3001/api/getProfileName", {
      headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
    })
    .then(res => {
        setProfileName(res.data);
    })
    .catch(error => {
        console.error(error.response.data.message);
    })
  }, [profileName])

  if (!sessionStorage.getItem('user-token')) return <Navigate to='/login' />

  return (
    <>
    <div id="homeGrid">
      <div id="profileBar">{profileName}</div>
      <PrimaryWindow sectionSetter={setSection} section={section} setItem={setSelectedItem} item={selectedItem}/>
      <SecondaryWindow sectionSetter={setSection} section={section} item={selectedItem}/>
    </div>
    </>
  );
}

export default App;
