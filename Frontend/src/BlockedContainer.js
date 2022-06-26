import "./BlockedContainer.css";

export default function BlockedContainer({name, status, setSelectedBlockedContact, selectedBlockedContact, ID}){
    if(ID==selectedBlockedContact){
        return(
            <>
            <div className="container darkContainer" onClick={() => {setSelectedBlockedContact(ID)}}>
                <div className="contactName">{name}</div>
                <div className="contactStatus">{status}</div>
            </div>
            </>
        );
    }
    else{
        return(
            <>
            <div className="container" onClick={() => {setSelectedBlockedContact(ID)}}>
                <div className="contactName">{name}</div>
                <div className="contactStatus">{status}</div>
            </div>
            </>
        );
    }
}