import db from "../models";

export const plaza_phases = (req, res) => {
    const {name ="", code ="", no_of_shops ="", plaza_id='', rent_fee=0,rent_start_date=null, rent_end_date=null } = req.body;
    db.sequelize.query(`insert into plaza_phases(name,code,no_of_shops,plaza_id,rent_start_date, rent_end_date)
    VALUES(:name,:code,:no_of_shops,:plaza_id,:rent_start_date,:rent_end_date)`,{
        replacements:{
            name,code,no_of_shops,plaza_id,rent_start_date,rent_end_date
        }
    })
    .then((results) =>{
        db.sequelize.query('SELECT LAST_INSERT_ID() AS phase_id')
        .then(resp=>{
            console.log({msg:'last insert id',code:JSON.stringify(resp)})
        for (let i =1; i< no_of_shops; i++ ){
            db.sequelize.query(`INSERT INTO shops_list( name, rent_fee, code,rent_start_date, rent_end_date, phase_id)
             VALUES (:name, :rent_fee, :shop_code,:rent_start_date, :rent_end_date,:phase_id)`,{
                replacements:{
                    name, rent_fee, shop_code:`${code} - ${i}`,rent_start_date, rent_end_date,phase_id:resp[0][0].phase_id
                }
             })
            .then(()=> console.log(`${code} - ${i}`))
            .catch(error=>console.error(error))
        }
        res.json({ success: true, results })
    } )
})
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })});
        }
        export const getPlazaPhase = (req, res) => {
            const {id} = req.query
            db.sequelize.query(`SELECT  * from plaza where id = ${id}`)
            .then((results) => res.json({ success: true, results: results[0]}))
                .catch((err) => {
                    console.log(err)
                    res.status(500).json({ err })});
        }
        export const getPlazaPhaseList = (req, res) => {
            db.sequelize.query(`SELECT  * from plaza_phases`)
            .then((results) => res.json({ success: true, results: results[0] }))
                .catch((err) => {
                    console.log(err)
                    res.status(500).json({ err })});
        }