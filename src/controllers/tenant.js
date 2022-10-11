import db from "../models";

export const tenant = (req, res) => {
    const {
name ="", phone_no ="", email ="", address ="", picture = ""
    } = req.body;

    db.sequelize.query(`insert into tenant(name,phone_no,email,address,picture)
    VALUE("${name}","${phone_no}","${email}","${address}","${picture}")`)
    .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })});
}
export const getTenantList = (req, res) => {
    
    db.sequelize.query(`SELECT  * from tenant`)
    .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })});
}

export const getTenant = (req, res) => {
    const {id}=req.query
    db.sequelize.query(`SELECT  * from tenant where id=${id}`)
    .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })});
}
