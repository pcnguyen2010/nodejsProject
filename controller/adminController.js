const bcrypt = require("bcryptjs");

exports.get_admin = (req, res) => {
    const error = req.session.error;
    delete req.session.error;
    const login = false;
    res.render("index", {title: 'false'});
};