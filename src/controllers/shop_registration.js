import db from "../models"

export const shop_registration = (req, res) => {
    const {name, rent_fee, code, rent_start_date, rent_end_date,tenant_id, phase_id} = req.body;
    db.sequelize.query(`INSERT INTO shops_list( name, rent_fee, code, rent_start_date, rent_end_date,tenant_id, phase_id) 
    VALUES ( :name, :rent_fee, :code, :rent_start_date, :rent_end_date,  :tenant_id, :phase_id)`,{
        replacements:{
                    name, rent_fee, code, rent_start_date, rent_end_date,tenant_id, phase_id
                }
    })
        .then((results) => {
            // db.sequelize.query(`insert into report_history(custormer_id,month,shop_no,description,amount_paid,withdrawn)
            // values(
            // "${shop_no}","${rent_end_date}","${shop_no}","${amount_paid}","${withdrawn}"
            // )`,{
            //     replacements:{
            //         name, rent_fee, code, rent_start_date, rent_end_date,tenant_id, phase_id
            //     }
            // })  .then(()=>{

            //     console.log({ success: true, results });
            //   })
            //   .catch((err) => {
            //     console.log(err);
            //     res.status(500).json({ success: false, err });
            //   });
            res.json({ success: true, results: results })
        })
        .catch((err) => console.log(err))
}

export const getShopList = (req, res) => {
const {phase_id=0}=req.query
    db.sequelize.query(`SELECT * FROM shops_list`)
        .then((results) => res.json({ success: true, results: results[0] }))
        .catch((err) => console.log(err))
}

export const getPhaseShops = (req, res) => {
    const {phase_id=0}=req.query
        db.sequelize.query(`SELECT * FROM shop_tenants  WHERE phase_id=${phase_id}`)
            .then((results) => res.json({ success: true, results: results[0] }))
            .catch((err) => console.log(err))
    }
    
export const getShop_registration = (req, res) => {
    const { id } = req.query
    db.sequelize.query(`SELECT id, name,shop_no,quantity,member_of_pillars,rent_start_date,rent_end_date,rent_fee,amount_paid,shop_name FROM shop_registration WHERE id=${id}`)
        .then((results) => res.json({ success: true, results: results[0] }))
        .catch((err) => console.log(err))
}