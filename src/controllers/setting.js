import db from "../models";

export const setting = (req, res) => {
    const {
shop_name ="", shops_no ="", address ="", contact = ""
    } = req.body;

    db.sequelize.query(`insert into setting(shop_name,shops_no,address,contact)
    VALUE("${shop_name}","${shops_no}","${address}","${contact}")`)
    .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })});
}

export const getSetting = (req, res) => {
   

    db.sequelize.query(`SELECT * from setting`)
    .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })});
}