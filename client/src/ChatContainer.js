import "./ChatContainer.css";

export default function ChatContainer({ name, lasttext, sentdate, setItem, ID }){
    return(
        <>
        <div className="container" onClick={() => {setItem(ID)}}>
            <div className="name">{name}</div>
            <div className="latestMsg">{lasttext}</div>
            <div className="date">{sentdate.toDateString() + ' ' + sentdate.toLocaleTimeString()}</div>    
        </div>
        </>
    );
}