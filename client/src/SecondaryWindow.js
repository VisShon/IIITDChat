import { useState } from "react";
import "./SecondaryWindow.css";

export default function SecondaryWindow({sectionSetter, section, item}){
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
                        <div id="itemName">Recipient Name</div>
                        <div id="itemInfo">Last Logged in</div>
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
                        <div id="itemName">Recipient Name</div>
                        <div id="itemInfo">Last Logged in</div>
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
        if(section==="blocked"){
            return(
                <>
                <div id="secondaryWindow">
                    <div id="itemDescBar">
                        <div id="itemName">Recipient Name</div>
                        <div id="itemInfo">Last Logged in</div>
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
    }
}