import { useEffect, useState } from "react";
import "./SecondaryWindow.css";
import TextContainer from "./TextContainer.js"
import axios from "axios";
import { useParams } from "react-router";

export default function SecondaryWindow({sectionSetter, section, item, selectedContact, setSelectedContact, selectedBlockedContact, setSelectedBlockedContact}){
    const [log, setLog] = useState("Never");
    const [name, setName] = useState("Recipient Name");
    const [textList, setTextList] = useState([]);
    const [msgContent, setMsgContent] = useState("");

    const [contactName, setContactName] = useState("Contact Name");
    const [contactStatus, setContactStatus] = useState("status");

    const [blockedName, setBlockedName] = useState("Contact Name");
    const [blockedStatus, setBlockedStatus] = useState("status");

    useEffect(() => {
        // sending data in URL param and catching it in backend using ':' 
        // get info on the selected chat
        axios.get(`http://localhost:3001/api/getItemInfo/${item}`, {
            headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
        }).then((res) => {
            const itemInfo = res.data.map(user => {
                return {
                    ...user,
                    Login: new Date(user.Log)
                }
            })
            setName(itemInfo[0].Name || itemInfo[0].GName )
            setLog(itemInfo[0].Login =="Invalid Date" || itemInfo[0].Log =="null"? "Null":itemInfo[0].Login.toDateString() + ' ' + itemInfo[0].Login.toLocaleTimeString());
            console.log("iteminfo=", itemInfo[0]);
        }).catch(error => {
            console.error(error);
        });

        // get info on the selected contact
        axios.get(`http://localhost:3001/api/getContactInfo/${selectedContact}`, {
            headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
        }).then((res) => {
            const itemInfo = res.data;
            setContactName(itemInfo[0].Name)
            console.log("iteminfo=", itemInfo[0]);
        }).catch(error => {
            console.error(error);
        });

        // get info on the selected blockedContact
        axios.get(`http://localhost:3001/api/getBlockedInfo/${selectedBlockedContact}`, {
            headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
        }).then((res) => {
            const itemInfo = res.data;
            setBlockedName(itemInfo[0].Name)
            console.log("iteminfo=", itemInfo[0]);
        }).catch(error => {
            console.error(error);
        });

        if(item!="null"){
            // fetching all messages of the selected item
            axios.get(`http://localhost:3001/api/getMessages/${item}`, {
                headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
            }).then((res) => {
                const itemInfo = res.data.map(msg => {
                    return {
                        ...msg,
                        dateTime: new Date(msg.Sending_Date_Time)
                    }
                })
                setTextList(itemInfo);
                console.log("messages =", itemInfo);
            }).catch(error => {
                console.error(error);
            });
        }
    }
    ,[item]);

    function sendMsg(){
        const messageBody = msgContent;
        if(msgContent===""){
            return;
        }
        var date = new Date();
        date = date.getUTCFullYear() + '-' +
            ('00' + (date.getUTCMonth()+1)).slice(-2) + '-' +
            ('00' + date.getUTCDate()).slice(-2) + ' ' + 
            ('00' + date.getUTCHours()).slice(-2) + ':' + 
            ('00' + date.getUTCMinutes()).slice(-2) + ':' + 
            ('00' + date.getUTCSeconds()).slice(-2);
        const messageInfo ={
            messageBody: messageBody,
            sentDate: date,
            recieverID: item
        }
        setMsgContent("");

        axios.post("http://localhost:3001/api/sendMessage", messageInfo, {
            headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
        }).then((res) => {
            // response
        }).catch((error) => {
            console.error(error);
        })
    }

    function texts(textList){
        return textList.map((text, index) => {
            return <TextContainer key={index} textData={text}/>
        })
    }

    if(item==="null"){
        return(
            <>
            <div id="secondaryWindow2">
                Selected {section} will show up here
            </div>
            </>
        );
    }
    else{
        if(section==="chats"){
            return(
                <>
                <div id="secondaryWindow">
                    <div id="itemDescBar">
                        <div id="itemName">{name}</div>
                        <div id="itemInfo">{log=="Null"?"":"Last Online: "+log}</div>
                    </div>
                    <div id="chatWindow">
                        {
                            texts(textList)
                        }
                    </div>
                    <div id="textBar">
                        <input
                            type="text"
                            value={msgContent}
                            id="textBox"
                            placeholder="Enter a Message"
                            onChange={event => setMsgContent(event.target.value)}
                        >
                        </input>
                        <button id="msgSendBtn" onClick={sendMsg}>Send</button>
                    </div>
                </div>
                </>
            );
        }
        if(section==="contacts"){
            return(
                <>
                <div id="secondaryWindow">
                    <div id="itemDescBar">
                        <div id="itemName">{contactName}</div>
                        <div id="itemInfo">{contactStatus}</div>
                    </div>
                    <div id="chatWindow">Contact Info</div>
                </div>
                </>
            );
        }
        if(section==="blocked"){
            return(
                <>
                <div id="secondaryWindow">
                    <div id="itemDescBar">
                        <div id="itemName">Blocked contact Name</div>
                        <div id="itemInfo">status</div>
                    </div>
                    <div id="chatWindow">Blocked contact</div>
                </div>
                </>
            );
        }
    }
}