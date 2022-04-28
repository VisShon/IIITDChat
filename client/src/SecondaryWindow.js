import { useEffect, useRef, useState } from "react";
import "./SecondaryWindow.css";
import TextContainer from "./TextContainer.js"
import axios from "axios";
import { useParams } from "react-router";

export default function SecondaryWindow({sectionSetter, section, item, selectedContact, setSelectedContact, selectedBlockedContact, setSelectedBlockedContact}){
    const [log, setLog] = useState("Never");
    const [name, setName] = useState("Recipient Name");
    const [textList, setTextList] = useState([]);
    const [msgContent, setMsgContent] = useState("");
    const [imgToggle, setImgToggle] = useState("txt");
    const chatWindowRef = useRef();
    // const imgToggleRef = useRef();

    const [contactInfo, setContactInfo] = useState({Name: "Contact Name", status: "status"});
    const [blockedInfo, setBlockedInfo] = useState({Name: "Contact Name", status: "status"});

    function fetchData(item, selectedContact, selectedBlockedContact) {
        // sending data in URL param and catching it in backend using ':' 
        // get info on the selected chat
        console.log("Fetching data", new Date().toLocaleTimeString());
        switch (section){
            case "chats":
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
                break;

            case "contacts":
                // get info on the selected contact
                if(selectedContact!="null"){
                    axios.get(`http://localhost:3001/api/getContactInfo/${selectedContact}`, {
                        headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
                    }).then((res) => {
                        const itemInfo = res.data;
                        setContactInfo(itemInfo[0]);
                        console.log("iteminfo=", itemInfo[0]);
                    }).catch(error => {
                        console.error(error);
                    });
                }
                break;

            case "blocked":
                // get info on the selected blockedContact
                if(selectedBlockedContact!="null"){
                    axios.get(`http://localhost:3001/api/getBlockedInfo/${selectedBlockedContact}`, {
                        headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
                    }).then((res) => {
                        const itemInfo = res.data;
                        setBlockedInfo(itemInfo[0])
                        console.log("iteminfo=", itemInfo[0]);
                    }).catch(error => {
                        console.error(error);
                    });
                }

                break;
        }
    }

    function fetchMessages(item){
        // fetching all messages of the selected item
        axios.get(`http://localhost:3001/api/getMessages/${item}`, {
            headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
        }).then((res) => {
            console.log(res.data);
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


    // useEffect(() => {
    //     if(item!="null"){
    //         const interval = setInterval(() => {
    //             console.log("fetched message")

    //             fetchMessages(item);

    //         }, 5000);
    //         console.log(interval, 'interval');
    //     }
    // });

    useEffect(() => {
        fetchData(item, selectedContact, selectedBlockedContact);
    }, [item, selectedContact, selectedBlockedContact, section]);

    useEffect(() => {
        chatWindowRef && chatWindowRef.current && chatWindowRef.current.scrollTo(0, 9999999999999);
    });

    function toggleImg(){
        if(imgToggle==="txt"){
            setImgToggle("img");
        }
        else if(imgToggle==="img"){
            setImgToggle("txt");
        }
    }

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
            recieverID: item,
            isPicture: imgToggle
        }
        setMsgContent("");

        axios.post("http://localhost:3001/api/sendMessage", messageInfo, {
            headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
        }).then((res) => {
            // response
        }).catch((error) => {
            console.error(error);
        })

        fetchMessages(item);
    }

    function texts(textList){
        return textList.map((text, index) => {
            return <TextContainer key={index} textData={text}/>
        })
    }


    if(section==="chats"){
        if(item==="null"){
            return(
                <>
                <div id="secondaryWindow2">
                    Selected {section} will show up here
                </div>
                </>
            );
        }
        return(
            <>
            <div id="secondaryWindow">
                <div id="itemDescBar">
                    <div id="itemName">{name}</div>
                    <div id="itemInfo">{log=="Null"?"":"Last Online: "+log}</div>
                </div>
                <div ref={chatWindowRef} id="chatWindow">
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
                    <button id="imgToggleBtn" onClick={toggleImg}>{imgToggle}</button>
                    <button id="msgSendBtn" onClick={sendMsg}>Send</button>
                </div>
            </div>
            </>
        );
    }
    if(section==="contacts"){
        if(selectedContact==="null"){
            return(
                <>
                <div id="secondaryWindow2">
                    Selected {section} will show up here
                </div>
                </>
            );
        }
        return(
            <>
            <div id="secondaryWindow">
                <div id="contactDescBar">
                    <div id="itemName">{contactInfo.Name}</div>
                    <div id="itemInfo">{contactInfo.status}</div>
                </div>
                <div id="profileWindow">
                    Date of joining: {(new Date(contactInfo.Date_of_joining)).toDateString() + ' ' +  (new Date(contactInfo.Date_of_joining)).toLocaleTimeString()}<br/><br/>
                    Department: {contactInfo.Department}<br/><br/>
                    Email ID: {contactInfo.Email_ID}<br/><br/>
                    Last online: {(new Date(contactInfo.Log)).toDateString() + ' ' +  (new Date(contactInfo.Log)).toLocaleTimeString()}<br/><br/>
                    Contact No: {contactInfo.Phone_No}<br/><br/>
                    Roll No: {contactInfo.Roll_no}<br/><br/>
                </div>
            </div>
            </>
        );
    }
    if(section==="blocked"){
        if(selectedBlockedContact==="null"){
            return(
                <>
                <div id="secondaryWindow2">
                    Selected {section} will show up here
                </div>
                </>
            );
        }
        return(
            <>
            <div id="secondaryWindow">
                <div id="contactDescBar">
                    <div id="itemName">{blockedInfo.Name}</div>
                    <div id="itemInfo">{blockedInfo.status}</div>
                </div>
                <div id="profileWindow">
                    Date of joining: {(new Date(blockedInfo.Date_of_joining)).toDateString() + ' ' +  (new Date(blockedInfo.Date_of_joining)).toLocaleTimeString()}<br/><br/>
                    Department: {blockedInfo.Department}<br/><br/>
                    Email ID: {blockedInfo.Email_ID}<br/><br/>
                    Last online: {(new Date(blockedInfo.Log)).toDateString() + ' ' +  (new Date(blockedInfo.Log)).toLocaleTimeString()}<br/><br/>
                    Contact No: {blockedInfo.Phone_No}<br/><br/>
                    Roll No: {blockedInfo.Roll_no}<br/><br/>
                </div>
            </div>
            </>
        );
    }
}