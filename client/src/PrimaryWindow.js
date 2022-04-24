import "./PrimaryWindow.css";
import SearchBar from "./SearchBar";
import { useState } from "react";

export default function PrimaryWindow(){
    const [section, setSection] = useState("chats");
    const [chats, setChats] = useState([]);

    return(
        <>
        <div id="primaryWindowWrapper">
            <div id="topNavBar">
                <button className={section=="chats"?"sectionButton whiteButton":"sectionButton"} id="chatsBtn">Chats</button>
                <button className={section=="contacts"?"sectionButton whiteButton":"sectionButton"}  id="contactsBtn">Contacts</button>
                <button className={section=="blocked"?"sectionButton whiteButton":"sectionButton"}  id="blockedBtn">Blocked</button>
            </div>

            <div id="primaryWindow">
                <SearchBar target={section} />
                <tbody id="messagesWrapper">
                    {/* {
                        {chats.map(function (i, j , k) {
                            return <ObjectRow name={i} date={j} lasttext={k}/>;
                          })}
                    } */}
                </tbody>
            </div>
        </div>
        </>
    );
}