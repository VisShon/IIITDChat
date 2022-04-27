import { useEffect, useState } from "react";
import "./SecondaryWindow.css";
import axios from "axios";
import { useParams } from "react-router";

export default function SecondaryWindow({sectionSetter, section, item}){
    const [log, setLog] = useState("Never");
    const [name, setName] = useState("Recipient Name");

    useEffect(() => {
        // sending data in URL param and catching it in backend using ':' 
        axios.get(`http://localhost:3001/api/getItemInfo/${item}`, {
            headers: { Authorization: `bearer ${sessionStorage['user-token']}`}
        }).then((res) => {
            const itemInfo = res.data.map(user => {
                return {
                    ...user,
                    Login: new Date(user.Log)
                }
            })
            setName(itemInfo[0].Name||itemInfo[0].GName);
            setLog(itemInfo[0].Login =="Invalid Date" || itemInfo[0].Log =="null"? "Null":itemInfo[0].Login.toDateString() + ' ' + itemInfo[0].Login.toLocaleTimeString());
            console.log("iteminfo=", itemInfo[0]);
            // setLog(itemInfo)
        }).catch(error => {
            console.error(error);
        });
    }
    ,[item]);

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
            console.log(name, log);
            return(
                <>
                <div id="secondaryWindow">
                    <div id="itemDescBar">
                        <div id="itemName">{name}</div>
                        <div id="itemInfo">{log=="Null"?"":"Last Online: "+log}</div>
                    </div>
                    <div id="chatWindow">Chats</div>
                    <div id="textBar">
                        <input type="text" id="textBox" placeholder="Enter a Message"></input>
                        <button id="msgSendBtn">Send</button>
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
                        <div id="itemName">Contact Name</div>
                        <div id="itemInfo">Status</div>
                    </div>
                    <div id="chatWindow">Contact Info</div>
                    <div id="textBar">
                        <input type="text" id="textBox" placeholder="Enter a Message"></input>
                        <button id="msgSendBtn">Send</button>
                    </div>
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
                    <div id="textBar">
                        <input type="text" id="textBox" placeholder="Enter a Message"></input>
                        <button id="msgSendBtn">Send</button>
                    </div>
                </div>
                </>
            );
        }
    }
}