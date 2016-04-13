var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index');
});

/* GET Userlist page. */
router.get('/userlist', function(req, res) {
    var con = req.con;
    con.query('SELECT password, first_name, last_name, email FROM user',
      function(err, rows) {
        if(err) throw err;
        res.render('userlist', {
          "userlist" : rows
        });
      }
    );
});

/* GET New User page. */
router.get('/newuser', function(req, res) {
    res.render('newuser', { title: 'Add New User' });
});


router.post('/login', function(req, res) {

    // Set our internal DB variable
    var con = req.con;

    // Get our form values. These rely on the "name" attributes
    var useremail = req.body.useremail;
    var password = req.body.password;

    // Set our collection and submit to DB
    con.query('SELECT password FROM user WHERE email=\"'+ useremail +'\";',
      function(err, rows) {
        if(err) throw err;
        // And forward to success page
        console.log(rows);
        res.flash('message', 'Successfully! Enjoy your time in Goldren Chore!');
        res.redirect("/");
      }
    );
});

/* POST to Add User */
router.post('/signup', function(req, res) {

    // Set our internal DB variable
    var con = req.con;

    // Get our form values. These rely on the "name" attributes
    var useremail = req.body.useremail;
    var password = req.body.password;
    var fname = req.body.fname;
    var lname = req.body.lname;

    // Set our collection and submit to DB
    con.query('INSERT INTO users (last_name,first_name,password,email) VALUES (\"'+lname+'\",\"'+fname+'\",\"'+password+'\",\"'+useremail+'\");',
      function(err, rows) {
        if(err) throw err;
        // And forward to success page
        res.flash('message', 'Successfully! Enjoy your time in Goldren Chore!');
        res.redirect("/");
      }
    );
});

module.exports = router;
