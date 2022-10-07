import db from "../models";
export const payment_report = (req, res) => {
    const {
         name = "", shop_no = "", year = "", amount_paid = "", discription = "",
    } = req.body;
    const {custormer_id}=req.query
    db.sequelize.query(`insert into payment_report(customer_id,name,shop_no,year,amount_paid,discription) 
    VALUES("${custormer_id}","${name}","${shop_no}","${year}","${amount_paid}","${discription}")`)
        .then((results) => {
            db.sequelize.query(`insert into report_history(custormer_id,month,shop_no,description,amount_paid,withdrawn)
        values(
        "${custormer_id}","${year}","${shop_no}","${discription}","${amount_paid}","0"
        )`)  .then(()=>{

            console.log({ success: true, results });
          })
          .catch((err) => {
            console.log(err);
            res.status(500).json({ success: false, err });
          });
            res.json({ sucsess: true, results: results })})
        .catch((err) => console.log(err))
}

export const getRayment_report = (req, res) => {
    const {id
    } = req.query;
    db.sequelize.query(`SELECT id,customer_id,name,shop_no,year,amount_paid,discription FROM payment_report WHERE customer_id=${id}`)
        .then((results) => res.json({ sucsess: true, results: results }))
        .catch((err) => res.status(500).json(err))
}