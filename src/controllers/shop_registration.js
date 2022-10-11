import db from "../models"

export const shop_registration = (req, res) => {
    const {
        name =  "", shop_name = "", shop_no = "", quantity = "", member_of_pillars = "", rent_start_date = "", rent_end_date = "", rent_fee = "", amount_paid  = "",withdrawn=0
    } = req.body;
    db.sequelize.query(`insert into shop_registration(name,shop_name,shop_no,quantity,member_of_pillars,rent_start_date,rent_end_date,rent_fee,amount_paid) 
    VALUES("${name}","${shop_name}","${shop_no}","${quantity}","${member_of_pillars}","${rent_start_date}","${rent_end_date}","${rent_fee}","${amount_paid}")`)
        .then((results) => {
            db.sequelize.query(`insert into report_history(custormer_id,month,shop_no,description,amount_paid,withdrawn)
            values(
            "${shop_no}","${rent_end_date}","${shop_no}","${amount_paid}","${withdrawn}"
            )`)  .then(()=>{

                console.log({ success: true, results });
              })
              .catch((err) => {
                console.log(err);
                res.status(500).json({ success: false, err });
              });
            res.json({ success: true, results: results })
        })
        .catch((err) => console.log(err))
}

export const getShopList = (req, res) => {

    db.sequelize.query(`SELECT * FROM shop_registration`)
        .then((results) => res.json({ success: true, results: results }))
        .catch((err) => console.log(err))
}

export const getShop_registration = (req, res) => {
    const { id } = req.query
    db.sequelize.query(`SELECT id, name,shop_no,quantity,member_of_pillars,rent_start_date,rent_end_date,rent_fee,amount_paid,shop_name FROM shop_registration WHERE id=${id}`)
        .then((results) => res.json({ success: true, results: results[0] }))
        .catch((err) => console.log(err))
}