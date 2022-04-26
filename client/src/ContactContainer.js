import "./ContactContainer.css";

export default function ContactContainer({name, status}){
    return(
        <>
        <div className="container">
            <div className="contactName">{name}</div>
            <div className="contactStatus">{status}</div>
        </div>
        </>
    );
}