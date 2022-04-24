import { useState } from "react";
import "./SearchBar.css";

export default function SearchBar(props){
    const [target, setTarget] = useState(props.target);
    return(
        <>
        <div id="searchWrapper">
            <input className="inputBox" id="searchInputBox" placeholder={"Search for "+props.target}/>
        </div>
        </>
    );
}