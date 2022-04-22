const express = require("express");
const mysql = require("mysql");
const bodyParser = require("body-parser");
const cors = require("cors");
const path = require('path');
const jwt = require('jsonwebtoken');
// const res = require("express/lib/response");

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'static')));
app.use(bodyParser.urlencoded({extended: true}));

const db = mysql.createConnection(
    {
        host: 'localhost',
        user: 'root',
        password: process.env.KEY,
        database: 'iiit_chat'
    }
);

const PORT = process.env.PORT || 3001;

  // http://localhost:3000/auth
app.post('/auth', function(request, response) {
	let username = request.body.username;
	let password = request.body.password;

  console.log("Backend: handling /auth");

	if (username && password) {
		db.query('SELECT * FROM users WHERE username = ? AND password = ?',
      [username, password],
      function(error, results, fields) {
        if (error) throw error;
        if (results.length === 1) {
          const user = results[0];
          const {userID, username} = user;
          const mytoken = jwt.sign({userID, username}, process.env.JWT_SECRET);

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
  console.log(req.headers)
  console.log(req.body);
  console.log(req.data);
  res.json({
    working: "true"
  })
})
app.listen(PORT, () => {
    console.log(`Server listening on ${PORT}`);
});
