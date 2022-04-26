import "./PrimaryWindow.css";
import SearchBar from "./SearchBar";
import { useEffect, useState } from "react";
import axios from "axios";
import ChatContainer from "./ChatContainer";
import ContactContainer from "./ContactContainer";

export default function PrimaryWindow({sectionSetter, section, setItem, item}){
    const initialChat = [{
        Reciever_ID: "1234",
        Message_Body: "hello amongus sussy baka fortnite victry royal",
        Sending_Date_Time: new Date(),
        Name: "Madarchod Retard"
    }];
    const initialChat2 = initialChat.concat(initialChat).concat(initialChat).concat(initialChat);
    const [containers, setContainers] = useState(initialChat2.concat(initialChat2));

    useEffect(()=>{
        switch (section){
            case "chats":
                axios.get("http://localhost:3001/api/getRecentChats", {
                    headers: { Authorization: `bearer ${sessionStorage['user-token']}` }
                })
                .then((response) => {
                    const receivedChats = response.data[0].map(message => {
                        return {
                            ...message,
                            Sending_Date_Time: new Date(message.Sending_Date_Time)
                        }
                    });
                    const uniqueChatMap = {};
                    receivedChats.forEach(chat => uniqueChatMap[chat.Reciever_ID] = chat);
                    // console.log(12, uniqueChatMap, receivedChats)
                    setContainers(Object.values(uniqueChatMap));
                }).catch(error => {
                    console.error(error.response.data.message);
                })
            case "contacts":
                axios.get("http://localhost:3001/api/getAllContacts", {
                    headers: { Authorization: `bearer ${sessionStorage['user-token']}` }
                }).then((response => {
                    console.log(response);
                    // processing the backend data for user contacts
                })).catch(error => {
                    console.error(error.response.data.message);
                })
            case "blocked":
                axios.get("http://localhost:3001/api/getBlockedList", {
                    headers: { Authorization: `bearer ${sessionStorage['user-token']}` }
                }).then((response => {
                    // processing the backend data for user blockedlist
                    console.log(response);
                })).catch(error => {
                    console.error(error.response.data.message);
                })
        }
    }, [section]);


    function chatMapper(chat, index){
        return <ChatContainer key={index} name={chat.Name} sentdate={chat.Sending_Date_Time} lasttext={chat.Message_Body} setItem={setItem} ID={chat.Reciever_ID}/>;
    }
    function contactMapper(contact, index){
        // return contactcontainer mapped array
        return <ContactContainer key={index} name={contact.name} status={contact.status} />;
    }
    function blockedMapper(contact, index){
        // return blockedcontainer mapped array
        return <ContactContainer key={index} name={contact.name} status={contact.status} />;
    }
    function cards(section, containers){
        switch(section){
            case "chats":
                return containers.map(chatMapper);
            case "contacts":
                return containers.map(contactMapper);
            case "blocked":
                return containers.map(blockedMapper);
        }
    }

    return(
        <>
        <div id="primaryWindowWrapper">
            <div id="topNavBar">
                <button className={section=="chats"?"sectionButton whiteButton":"sectionButton"} id="chatsBtn" onClick={() => {sectionSetter("chats")}}>Chats</button>
                <button className={section=="contacts"?"sectionButton whiteButton":"sectionButton"}  id="contactsBtn" onClick={() => {sectionSetter("contacts")}}>Contacts</button>
                <button className={section=="blocked"?"sectionButton whiteButton":"sectionButton"}  id="blockedBtn" onClick={() => {sectionSetter("blocked")}}>Blocked</button>
            </div>

            <div id="primaryWindow">
                <SearchBar target={section} />

                <div id="cardsWrapper">
                    {
                        cards(section, containers)
                    }
                </div>
            </div>
        </div>
        </>
    );
}