import db from "../models";

export const plaza_phases = (req, res) => {
    const { id = null, name = "", code = "", no_of_shops = "", plaza_id = '', rent_fee = 0, rent_start_date = null, rent_end_date = null, agent_id = null } = req.body;
    const { query_type } = req.query
    db.sequelize.query(`CALL plaza_phases(:query_type,:id,:name,:code,:no_of_shops,:rent_fee,:rent_start_date,:rent_end_date,:plaza_id,:agent_id)`, {
        replacements: {
            query_type, id, name, code, no_of_shops, plaza_id, rent_start_date, rent_end_date, rent_fee, agent_id
        }
    })
        .then((results) => {
            //     db.sequelize.query('SELECT LAST_INSERT_ID() AS phase_id')
            //         .then(resp => {
            //             console.log({ msg: 'last insert id', code: JSON.stringify(resp) })
            //             for (let i = 1; i <= no_of_shops; i++) {
            //                 db.sequelize.query(`INSERT INTO shops( name, rent_fee, code,rent_start_date, rent_end_date, phase_id)
            //      VALUES (:name, :rent_fee, :shop_code,:rent_start_date, :rent_end_date,:phase_id)`, {
            //                     replacements: {
            //                         name, rent_fee, shop_code: `${code} - ${i}`, rent_start_date, rent_end_date, phase_id: resp[0][0].phase_id
            //                     }
            //                 })
            //                     .then(() => console.log(`${code} - ${i}`))
            //                     .catch(error => console.error(error))
            //             }
            res.json({ success: true, results })
            //         })
        })
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })
        });
}
export const getPlazaPhase = (req, res) => {
    const { query_type = '', id = null, name = '', code = '', no_of_shops = null, rent_fee = null, rent_start_date = null, rent_end_date = null, plaza_id = null, agent_id = null } = req.query
    db.sequelize.query(`CALL plaza_phases(:query_type, :id, :name, :code, :no_of_shops, :rent_fee, :rent_start_date, :rent_end_date,:plaza_id, :agent_id)`, {
        replacements: {
            query_type, id, name, code, no_of_shops, rent_fee, rent_start_date, rent_end_date, plaza_id, agent_id
        }
    })
        .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })
        });
}
export const getPlazaPhaseList = (req, res) => {
    const { plaza_id } = req.query
    const sql = plaza_id ? `SELECT  * from plaza_phases WHERE plaza_id=${plaza_id}` : 'SELECT  * from plaza_phases'
    db.sequelize.query(sql)
        .then((results) => res.json({ success: true, results: results[0] }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })
        });
}