import axios from "axios";
import "./TextContainer.css";

export default function TextContainer({textData}){

    function deleteMsg(){
        axios.post("http://localhost:3001/api/deleteMsg", {msgID: textData.Message_ID}, {
            headers: { Authorization: `bearer ${sessionStorage["user-token"]}`}
        })
        .then((res) =>{
            console.log(res.data);
        }).catch((error) => console.log(error));
    }

    const date = new Date();
    if(textData.isPicture=="0"){
        return(
            <>
            <div className="textContainer">
                <div className="senderName">{textData.Name}</div>
                <div className="textBody">
                    {textData.Message_Body}
                </div>
                <div className="dateAndDltWrapper">
                    <button className="deleteBtn" onClick={deleteMsg}>Delete</button>
                    <div className="date">{"Sent: "+textData.dateTime.toDateString() + ' ' + textData.dateTime.toLocaleTimeString()}</div>    
                </div>
                
            </div>
            </>
        );
    }
    else{
        return(
            <>
            <div className="textContainer">
                <div className="senderName">{textData.Name}</div>
                <div className="textBody">
                    <img src={textData.Message_Body} height="100px"/>
                </div>
                <div className="dateAndDltWrapper">
                    <button className="deleteBtn" onClick={deleteMsg}>Delete</button>
                    <div className="date">{"Sent: "+textData.dateTime.toDateString() + ' ' + textData.dateTime.toLocaleTimeString()}</div>    
                </div>        
            </div>
            </>
        );
    }

}