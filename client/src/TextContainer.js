import "./TextContainer.css";

export default function TextContainer({textData}){
    const date = new Date();
    if(textData.isPicture=="0"){
        return(
            <>
            <div className="textContainer">
                <div className="senderName">{textData.Name}</div>
                <div className="textBody">
                    {textData.Message_Body}
                </div>
                <div className="date">{"Sent: "+textData.dateTime.toDateString() + ' ' + textData.dateTime.toLocaleTimeString()}</div>    
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
                <div className="date">{"Sent: "+ textData.dateTime.toDateString() + ' ' + textData.dateTime.toLocaleTimeString()}</div>    
            </div>
            </>
        );
    }

}