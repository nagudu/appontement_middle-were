import db from "../models";
export const payment_report = (req, res) => {
    const {
        customer_id = "", name = "", shop_no = "", year = "", amount_paid = "", discription = "",
    } = req.body;
    db.sequelize.query(`insert into payment_report(customer_id,name,shop_no,year,amount_paid,discription) 
    VALUES("${customer_id}","${name}","${shop_no}","${year}","${amount_paid}","${discription}")`)
        .then((results) => res.json({ sucsess: true, results: results }))
        .catch((err) => console.log(err))
}

export const getRayment_report = (req, res) => {
    const {id
    } = req.query;
    db.sequelize.query(`SELECT id,customer_id,name,shop_no,year,amount_paid,discription FROM payment_report WHERE customer_id=${id}`)
        .then((results) => res.json({ sucsess: true, results: results }))
        .catch((err) => res.status(500).json(err))
}