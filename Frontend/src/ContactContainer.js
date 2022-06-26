import "./ContactContainer.css";

export default function ContactContainer({name, status, setSelectedContact, selectedContact, setSelectedBlockedContact, selectedBlockedContact, ID}){
    if(ID==selectedContact){
        return(
            <>
            <div className="container darkContainer" onClick={() => {setSelectedContact(ID)}}>
                <div className="contactName">{name}</div>
                <div className="contactStatus">{status}</div>
            </div>
            </>
        );
    }
    else{
        return(
            <>
            <div className="container" onClick={() => {setSelectedContact(ID)}}>
                <div className="contactName">{name}</div>
                <div className="contactStatus">{status}</div>
            </div>
            </>
        );
    }
}