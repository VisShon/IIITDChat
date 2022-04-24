
const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require('path');
const jwt = require('jsonwebtoken');
// const res = require("express/lib/response");

const app = express();
require('dotenv').config()
app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'static')));
app.use(bodyParser.urlencoded({extended: true}));

const db = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: process.env.KEY,
        database: 'iiitd_chat'
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
		db.query('SELECT * FROM users WHERE Roll_no = ? AND password = ?',
      [username, password],
      function(error, results, fields) {
        if (error) throw error;
          
          if (results.length === 1) {
            const user = results[0];
            const { Name } = user;
            const mytoken = jwt.sign({Name}, process.env.JWT_SECRET);
            
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

app.post('/api/getRecentChats', function(req, res) {
    let jasonFile = require(jasonFile)
    let decodedToken = checkAuthFromRequest(req, res);
    if(!decodedToken) {return}

    const{userID,username} = decodedToken;
    if(userID && username) {
      db.query('call iiitdChat.getRecents(?)',
      [username],
      function(err, result,fields) {
        if(err) throw err;
        console.log(result);
      });
    }
    else {
      response.send('Error 404');
      response.end();
    }
});


function checkAuthFromRequest(req, res) {
  const authHeader = req.get('Authorization');

  if (!authHeader && !authHeader.toLocaleLowerCase().startsWith('bearer ')) {
    res.status(401).json({message: "Missing or invalid token"});
    return null;
  }

  const token = authHeader.substring(7);
  const decodedToken = jwt.decode(token);

  if (!decodedToken) {
    res.status(401).json({message: "Bad token"});
    return null;
  }

  return decodedToken;
}

app.get("/api/test", (req, res)=>{
  return res.status(200).send("hello");
  res.json({
    working: "true"
  })
})
app.listen(PORT, () => {
    console.log(`Server listening on ${PORT}`);
});
