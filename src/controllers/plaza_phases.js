import db from "../models";

export const plaza_phases = (req, res) => {
    const {
name ="", code ="", no_of_shops ="",
    } = req.body;

    db.sequelize.query(`insert into plaza_phases(name,code,no_of_shops)
    VALUE("${name}","${code}","${no_of_shops}")`)
    .then((results) => res.json({ success: true, results }))
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