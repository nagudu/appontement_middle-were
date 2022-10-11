import db from "../models";

export const plaza = (req, res) => {
    const {
name ="", address ="", code ="", no_of_shop="",
    } = req.body;

    db.sequelize.query(`insert into plaza(name,address,code,no_of_shop)
    VALUE("${name}","${address}","${code}","${no_of_shop}")`)
    .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })});
        }
    export const getPlaza = (req, res) => {
        const {id} = req.query
        db.sequelize.query(`SELECT  * from plaza where id = ${id}`)
        .then((results) => res.json({ success: true, results: results[0]}))
            .catch((err) => {
                console.log(err)
                res.status(500).json({ err })});
    }
    export const getPlazaList = (req, res) => {
        
        db.sequelize.query(`SELECT  * from plaza`)
        .then((results) => res.json({ success: true, results: results[0] }))
            .catch((err) => {
                console.log(err)
                res.status(500).json({ err })});
    }
    // export const getPlazaPhaseList = (req, res) => {
    //     db.sequelize.query(`SELECT  * from plaza_phases`)
    //     .then((results) => res.json({ success: true, results: results[0] }))
    //         .catch((err) => {
    //             console.log(err)
    //             res.status(500).json({ err })});
    // }
