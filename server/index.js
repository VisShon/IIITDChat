
const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require('path');
const jwt = require('jsonwebtoken');
const { response } = require("express");
// const res = require("express/lib/response");

const app = express();
require('dotenv').config()
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'static')));
app.use(bodyParser.urlencoded({extended: true}));

const db = mysql.createConnection(
    {
      host: 'deep.moe',
      user: 'iiitd-chat',
      password: process.env.REMOTE_KEY,
      database: 'iiitdchat'
    }
);

db.connect(err => {
  if  (err){
    console.error(err);
    console.error("Failed while connecting to database");
    process.exit();
  }
});

const PORT = process.env.PORT || 3001;

  // http://localhost:3001/auth
app.post('/auth', function(request, response) {
	let username = request.body.username;
	let password = request.body.password;

  console.log("Backend: handling /auth");

	if (username && password) {
		db.query('SELECT * FROM users WHERE Roll_no = ? AND Email_ID = ?',
      [username, password],
      function(error, results, fields) {
        if (error) throw error;
          if (results.length === 1) {
            const user = results[0];
            const {Name, Email_ID} = user;
            const mytoken = jwt.sign({Name, Email_ID}, process.env.JWT_SECRET);
            response.json(mytoken);
          } else {
            response.send('Incorrect Username and/or Password!');
          }			
          response.end();
      });
	} else {
		response.send('Please enter Username and Password!');
		response.end();
	}
});

app.get('/api/getRecentChats', function(req, res) {
    let decodedToken = checkAuthFromRequest(req, res);
    if(!decodedToken) return;

    const{Name, Email} = decodedToken;
    if(Name) {
      db.query('call iiitdchat.getRecents(?)',
      [Name],
      function(err, result,fields) {
        if(err) throw err;
        // console.log(result);
        res.json(result);
      });
    }
    else {
      res.send('Error 404');
      res.end();
    }
});

// Need userID for this
// app.post('/api/getLog', function(req, res) {
//   let decodedToken = checkAuthFromRequest(req, res);
//   if(!decodedToken) {return}
//   const{userID,username} = decodedToken;
//   if(userID && username) {
//     db.query('Select Name, Log from user where Email_ID = ?',
//     [usernID],
//     function(err, result,fields) {
//       if(err) throw err;
//       respond.send(result);
//     });
//   }
//   else {
//     response.send('Error 404');
//     response.end();
//   }
// });

//need the userID of both the users one in the decoded token and one in the request.
//if it is a group we need the group id for fething the messages.
//not handling the user messages only using the messages.
// app.post('/api/getMessages', function(req, res) {
//   let decodedToken = checkAuthFromRequest(req, res);
//   if(!decodedToken) {return}
//   const{userID,username} = decodedToken;
//   if(userID && username) {
//     let userID2 = req.body.userID2
//     if(identity) {
//       db.query('call iiitdchat.fetchC(?,?)',
//       [userID,userID2],
//       function(err, result,fields) {
//         if(err) throw err;
//         respond.send(result);
//       });
//     }
//     else{
//       let groupID = req.body.groupID
//       db.query('call iiitdchat.fetchg(?)',
//       [groupID],
//       function(err, result,fields) {
//         if(err) throw err;
//         respond.send(result);
//       });
//     }
//   }
//   else {
//     response.send('Error 404');
//     response.end();
//   }
// });

app.get("/api/getAllContacts", (req, res)=>{
  let decodedToken = checkAuthFromRequest(req, res);
  if(!decodedToken) {return}
  const{Name, Email} = decodedToken;

  //fetch contacts
})

app.get("/api/getBlockedList", (req, res)=>{
  let decodedToken = checkAuthFromRequest(req, res);
  if(!decodedToken) {return}
  const{Name, Email} = decodedToken;

  //fetch blockedlist
})

//need the message info for ending the messages.
// app.post('/api/getLog', function(req, res) {
//   let decodedToken = checkAuthFromRequest(req, res);
//   if(!decodedToken) {return}
//   const{Name, Email} = decodedToken;
//   if(Name && Email) {
//     db.query('Select Name, Log from user where Name = ?',
//     [username],
//     function(err, result,fields) {
//       if(err) throw err;
//       respond.send(result);
//     });
//   }
//   else {
//     response.send('Error 404');
//     response.end();
//   }
// });

app.get("/api/getProfileName", (req, res) => {
  let decodedToken = checkAuthFromRequest(req, res);
  if(!decodedToken) {return}
  const {Name, Email_ID} = decodedToken;
  console.log(decodedToken);

  if(Name && Email_ID) {
    res.json(Name);
  }
  else {
    res.send('Error 404');
    res.end();
  }
})

function checkAuthFromRequest(req, res) {
  const authHeader = req.get('Authorization');

  if (!(authHeader && authHeader.toLocaleLowerCase().startsWith('bearer '))) {
    res.status(401).json({message: "Missing or invalid token"});
    return null;
  }

  const token = authHeader.substring(7);

  if (!jwt.verify(token, process.env.JWT_SECRET)) {
    res.status(401).json({message: "Unauthorized"});
    return null;
  }

  return jwt.decode(token);
}

app.listen(PORT, () => {
    console.log(`Server listening on ${PORT}`);
});
