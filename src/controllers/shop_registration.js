import db from "../models"

export const shop_registration = (req, res) => {
    const { name, rent_fee, code, rent_start_date, rent_end_date, tenant_id, phase_id } = req.body;
    db.sequelize.query(`INSERT INTO shops( name, rent_fee, code, rent_start_date, rent_end_date,tenant_id, phase_id) 
    VALUES ( :name, :rent_fee, :code, :rent_start_date, :rent_end_date,  :tenant_id, :phase_id)`, {
        replacements: {
            name, rent_fee, code, rent_start_date, rent_end_date, tenant_id, phase_id
        }
    })
        .then((results) => {
            res.json({ success: true, results: results })
        })
        .catch((err) => console.log(err))
}

export const getShopList = (req, res) => {
    // const {phase_id=0}=req.query
    db.sequelize.query(`SELECT * FROM shops`)
        .then((results) => res.json({ success: true, results: results[0] }))
        .catch((err) => console.log(err))
}

export const getPhaseShops = (req, res) => {
    const { phase_id = 0 } = req.query
    if (phase_id)
        db.sequelize.query(`SELECT * FROM shops  WHERE phase_id=${phase_id}`)
            .then((results) => res.json({ success: true, results: results[0] }))
            .catch((err) => console.log(err))
}

export const getShop_registration = (req, res) => {
    const { id } = req.query
    db.sequelize.query(`SELECT id, name,shop_no,quantity,member_of_pillars,rent_start_date,rent_end_date,rent_fee,amount_paid,shop_name FROM shop_registration WHERE id=${id}`)
        .then((results) => res.json({ success: true, results: results[0] }))
        .catch((err) => console.log(err))
}