import './App.css';
import { Navigate } from "react-router-dom";
import { useEffect, useState } from 'react';
import axios from 'axios';
import PrimaryWindow from './PrimaryWindow';
import SecondaryWindow from './SecondaryWindow';
import { useNavigate } from 'react-router';

function App(props) {
  const [profileName, setProfileName] = useState("Profile Name");
  const [section, setSection] = useState("chats");
  const navigate = useNavigate()
  const [selectedItem, setSelectedItem] = useState("null");
  const [selectedContact, setSelectedContact] = useState("null");
  const [selectedBlockedContact, setSelectedBlockedContact] = useState("null");
  
  useEffect(() => {
    console.log("ud chala")
    if (!sessionStorage.getItem('user-token')) navigate('/login')
  }
  ,[ navigate ])

  useEffect( () => {
    console.log("hhun mein aaj")
    axios.get("http://localhost:3001/api/getProfileName", {
      headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
    })
    .then(res => {
      console.log("profileName  received: ",res)
      setProfileName(res.data);
    })
    .catch(error => {
        console.error(error.response.data.message);
    })
  }, [profileName])

  

  return (
    <>
    <div id="homeGrid">
      <button id="profileBar">{profileName}</button>
      <PrimaryWindow sectionSetter={setSection} section={section} setItem={setSelectedItem} item={selectedItem} selectedContact={selectedContact} setSelectedContact={setSelectedContact} selectedBlockedContact={selectedBlockedContact} setSelectedBlockedContact={setSelectedBlockedContact}/>
      <SecondaryWindow sectionSetter={setSection} section={section} item={selectedItem}  selectedContact={selectedContact} setSelectedContact={setSelectedContact} selectedBlockedContact={selectedBlockedContact} setSelectedBlockedContact={setSelectedBlockedContact}/>
    </div>
    </>
  );
}

export default App;
