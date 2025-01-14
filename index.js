require('dotenv').config();
const express = require('express');
const session = require('express-session');
const bodyParser = require('body-parser');


const app = express();
const router = require('./app/router');


app.use(express.urlencoded({extended: true}))

app.set('view engine', 'ejs');
app.set('views', 'app/views');



app.use(session({
  secret: process.env.SECRET_SESSION,
  resave: false,
  saveUninitialized: true,
  cookie: {
    secure: false,
    maxAge: (24*60*60*1000) // ça fait 24h
  }
}));

app.use((req,res, next) => {
  req.session.bookmark = req.session.bookmark || [];
  app.locals.buketNb = req.session.bookmark.length;
  next();
});

app.use(express.static('public'));

app.use(router);

app.use((req, res) => {
    console.error("404", req.path);
    res.status(404).render("errors/404");
  });

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Listening at http://localhost:${PORT}`);
});