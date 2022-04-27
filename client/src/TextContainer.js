import "./TextContainer.css";

export default function TextContainer({textData}){
    const date = new Date();
    return(
        <>
        <div className="textContainer">
            <div className="senderName">{textData.Name}</div>
            <div className="textBody">
                {textData.Message_Body}
            </div>
            <div className="date">{textData.dateTime.toDateString() + ' ' + textData.dateTime.toLocaleTimeString()}</div>    
        </div>
        </>
    );
}