import db from "../models"

export const shop_registration = (req, res) => {
    const {
    name = "", phone = "", shop_no = "", quantity = "", member_of_pillars = "", rent_start_date = "", rent_end_date = "",  rent_fee = "",  amount_paid = "",  discription = "",
    } = req.body;
    db.sequelize.query(`insert into shop_registration(name,phone,shop_no,quantity,member_of_pillars,rent_start_date,rent_end_date,rent_fee,amount_paid,discription) 
    VALUES("${name}","${phone}","${shop_no}","${quantity}","${member_of_pillars}","${rent_start_date}","${rent_end_date}","${rent_fee}","${amount_paid}","${discription}")`)
    .then((results) => res.json({ sucsess: true, results: results }))
    .catch((err) => console.log(err))
}

export const getShopList = (req, res) => {

    db.sequelize.query(`SELECT id, name,phone,shop_no,quantity,member_of_pillars,rent_start_date,rent_end_date,rent_fee,amount_paid,discription FROM shop_registration`)
        .then((results) => res.json({ sucsess: true, results: results }))
        .catch((err) => console.log(err))
}

export const getShop_registration = (req, res) => {
    const {id} = req.query
    db.sequelize.query(`SELECT id, name,phone,shop_no,quantity,member_of_pillars,rent_start_date,rent_end_date,rent_fee,amount_paid,discription FROM shop_registration WHERE id=${id}`)
        .then((results) => res.json({ sucsess: true, results: results[0]}))
        .catch((err) => console.log(err))
}