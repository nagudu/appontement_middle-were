import db from "../models";

export const plazas = (req, res) => {
	const {
		name = "", address = "", code = "", no_of_shop = "",
	} = req.body;

	db.sequelize.query(`insert into plazas(name,address,code,no_of_shop)
    VALUE("${name}","${address}","${code}","${no_of_shop}")`)
		.then((results) => res.json({ success: true, results }))
		.catch((err) => {
			console.log(err)
			res.status(500).json({ err })
		});
}
export const getPlaza = (req, res) => {
	const { plaza_id } = req.query
	db.sequelize.query(`SELECT  * from plazas where id = ${plaza_id}`)
		.then((results) => res.json({ success: true, results: results[0] }))
		.catch((err) => {
			console.log(err)
			res.status(500).json({ err })
		});
}
export const getPlazaList = (req, res) => {
	db.sequelize.query(`SELECT  * from plazas`)
		.then((results) => res.json({ success: true, results: results[0] }))
		.catch((err) => {
			console.log(err)
			res.status(500).json({ err })
		});
}