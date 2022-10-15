import moment from "moment";
import db from "../models";

export const tenant = (req, res) => {
	const { tenant_id=null, name = "", phone_no = "", email = "", address = "", picture = "", deposite = 0, rent_start_date = '', rent_end_date = '', shops = [] } = req.body;
	const {query_type=''} =  req.query
	console.log({ body: true, data: req.body })
	db.sequelize.query(`CALL  tenants(:query_type,:tenant_id,:name,:phone_no,:email,:address,:picture,:deposite)`, {
		replacements: {
			query_type, name, phone_no, email, address, picture, deposite,tenant_id
		}
	})
		.then((results) => {
			console.log({ success: true, results })
			if ((results && results.length) ||!query_type.includes('select') ) {
				shops.forEach((shop, idx) => {
					db.sequelize.query(`CALL  shop_allocation(:query_type,null,:tenant_id,:name,0,:shop_id,:year,'allocated',:description,:rent_start_date,:rent_end_date)`, {
						replacements: {
							query_type: 'create', tenant_id: tenant_id?tenant_id:results[0].tenant_id, name, shop_id: shop.shop_id, year: moment(rent_start_date).format('YYYY'),
							description: `allocated by ${name} on ${moment(rent_start_date).format('DD-MM-YYYY')}`,
							rent_start_date: moment(rent_start_date).format('YYYY-MM-DD'), rent_end_date: moment(rent_end_date).format('YYYY-MM-DD')
						}
					})
						.then(resp => idx === (shops.length - 1) ? res.json({ success: true, msg: 'Shop alloceted successifully' }) : console.log(resp))
						.catch(error => console.error(error))

				})
			}else{
				res.json({ success: true, results:results[0]})
			}
		})

		.catch((err) => {
			console.log(err)
			res.status(500).json({ err })
		});
}
export const getTenantList = (req, res) => {
	db.sequelize.query(`SELECT  * from tenants`)
		.then((results) => res.json({ success: true, results }))
		.catch((err) => {
			console.log(err)
			res.status(500).json({ err })
		});
}

export const getTenant = (req, res) => {
	const { id } = req.query
	db.sequelize.query(`SELECT  * from tenants where id=${id}`)
		.then((results) => res.json({ success: true, results }))
		.catch((err) => {
			console.log(err)
			res.status(500).json({ err })
		});
}

export const getTenantShops = (req, res) => {
	const { tenant_id=null, name = "", phone_no = "", email = "", address = "", picture = "", deposite = 0,query_type=''} =  req.query
	db.sequelize.query(`CALL  tenants(:query_type,:tenant_id,:name,:phone_no,:email,:address,:picture,:deposite)`, {
		replacements: {
			query_type, name, phone_no, email, address, picture, deposite,tenant_id
		}
	})
		.then((results) => {
			res.json({ success: true, results	 })
		})

}