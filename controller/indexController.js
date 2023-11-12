const bcrypt = require("bcryptjs");
const fs = require('fs');
const readline = require('readline');

exports.get_index =  (req, res) => {
    const error = req.session.error;
    delete req.session.error;


    fs.readFile('./image/productImageLocation.txt', 
        function(err, data) {
            if(err) throw err; 
            var array = data.toString().split("/abc");
            res.render("index", {title: 'Home',err: error,data:array});
        }
    );

     

    
};

const readFileLines = filename =>
   fs.readFileSync(filename)
   .toString('UTF8')
   .split('/n');