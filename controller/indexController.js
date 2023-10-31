const bcrypt = require("bcryptjs");

exports.get_index = (req, res) => {
    const error = req.session.error;
    delete req.session.error;
    res.render("index", {title: 'Home',err: error});
};