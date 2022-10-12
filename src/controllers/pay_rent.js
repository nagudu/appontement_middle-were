import db from "../models";
export const pay_rent = (req, res) => {
    const {
        year = "", amount_paid = "", discription = "",
    } = req.body;
    db.sequelize.query(`insert into pay_rent(year,amount_paid,discription) 
    VALUES("${year}","${amount_paid}","${discription}")`)
        .then((results) => res.json({ sucsess: true, results: results }))
        .catch((err) => console.log(err))
}