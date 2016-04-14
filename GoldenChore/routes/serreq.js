var express = require('express');
var router = express.Router();

/* GET addnewrequest */
router.get('/user/:id', function(req, res) {
	var con = req.con;
	var user_id = req.params.id;
	var fname = req.query.fname;
	con.query('SELECT * FROM type;',
    	function(err, rows) {
    		// res.render('newreq', {types: rows, user_id: user_id, fname: fname, expressFlash: req.flash('message')});
    		res.render('newreq', {types: rows, user_id: user_id, fname: fname});
    	});
});

router.post('/postnew', function(req, res) {
	var con = req.con;

	var ser_name = req.body.ser_name;
    var ser_startingdate = req.body.ser_startingdate;
    var ser_endingdate = req.body.ser_endingdate;
    var ser_ava_startingtime = req.body.ser_ava_startingtime;
    var ser_ava_endingtime = req.body.ser_ava_endingtime;
    var hours_min = req.body.hours_min;
    var hours_max = req.body.hours_max;
    var ser_description = req.body.ser_description;
    var type_id = req.body.type_id;
    var street_address = req.body.street_address;
    var city = req.body.city;
    var state = req.body.state;
    var zip_code = req.body.zip_code;
    var poster_id = req.body.user_id;
    var fname = req.body.fname;

    con.query('SELECT loc_id FROM location WHERE city=\"'+city+'\" AND state=\"'+state+'\" AND zip_code=\"'+zip_code+'\";',
      function(err, rows) {
        if(err) throw err;
        // if the combination is in the database
        if(rows[0])
        { 
          var loc_id = rows[0].loc_id;

          con.query('INSERT INTO service (ser_name,ser_startingdate,ser_endingdate,ser_ava_startingtime,ser_ava_endingtime,hours_min,hours_max,ser_description,type_id,poster_id,street_address,loc_id) VALUES (' + 
          '\"'+ser_name+'\",\"'+ser_startingdate+'\",\"'+ser_endingdate+'\",\"'+ser_ava_startingtime+'\",\"'+ser_ava_endingtime+'\",\"'+hours_min+'\",\"'+hours_max+'\",\"'+ser_description+'\",\"'+type_id+'\",\"'+poster_id+'\",\"'+street_address+'\",\"'+loc_id+'\");',
            function(err) {
              if(err) throw err;
 			        req.flash('message', 'The request is posted successfully!');
			        res.redirect('/users/'+poster_id+'?fname='+fname);
        	});
        }

        // the combination is not in the database
        else {
          con.query('INSERT INTO location (city,state,zip_code) VALUES (' + 
          '\"'+city+'\",\"'+state+'\",\"'+zip_code+'\");',
            function(err) {
              if(err) throw err;
              con.query('SELECT loc_id FROM location WHERE city=\"'+city+'\" AND state=\"'+state+'\" AND zip_code=\"'+zip_code+'\";',
               	function(err, rows) {
                	if(err) throw err;
                    var loc_id = rows[0].loc_id;
                    con.query('INSERT INTO service (ser_name,ser_startingdate,ser_endingdate,ser_ava_startingtime,ser_ava_endingtime,hours_min,hours_max,ser_description,type_id,poster_id,street_address,loc_id) VALUES (' + 
          				'\"'+ser_name+'\",\"'+ser_startingdate+'\",\"'+ser_endingdate+'\",\"'+ser_ava_startingtime+'\",\"'+ser_ava_endingtime+'\",\"'+hours_min+'\",\"'+hours_max+'\",\"'+ser_description+'\",\"'+type_id+'\",\"'+poster_id+'\",\"'+street_address+'\",\"'+loc_id+'\");',
            			function(err) {
            				if(err) throw err;
            				req.flash('message', 'The request is posted successfully!');
							      res.redirect('/users/'+poster_id+'?fname='+fname);
            			});
                   
                });
            });
        }
            
      });
});


module.exports = router;