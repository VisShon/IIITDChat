import "./ChatContainer.css";

export default function ChatContainer({ name, lasttext, sentdate }){
    return(
        <>
        <div className="container">
            <div className="name">{name}</div>
            <div className="latestMsg">{lasttext}</div>
            <div className="date">{sentdate.toDateString() + ' ' + sentdate.toLocaleTimeString()}</div>    
        </div>
        </>
    );
}