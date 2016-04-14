var express = require('express');
var router = express.Router();

/* GET users id. */
router.get('/:id', function(req, res) {
  var user_id = req.params.id;
  var fname = req.query.fname;
  console.log(user_id+fname);
  var con = req.con;
  con.query('SELECT s.ser_id,s.ser_name,s.ser_startingdate,s.ser_endingdate,s.ser_ava_startingtime,s.ser_ava_endingtime,s.hours_min,s.hours_max,s.ser_description,t.type,u.first_name,u.last_name,s.street_address,l.city,l.state,l.zip_code'+
	' FROM service AS s, type AS t, users AS u, location AS l'+
	' WHERE s.poster_id ='+user_id+' AND u.user_id='+user_id+' AND s.type_id=t.type_id AND s.loc_id=l.loc_id;',
	function(err, rows) {
		if(err) throw err;
		// console.log(rows);
		res.render('userhome', {fnname: fname, postedsers: rows, signees: "test3"});
	}

	);

  // res.render('userhome', {fnname: fname, postedser: "test2", signees: "test3"});
});

module.exports = router;
