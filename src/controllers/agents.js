// import moment from "moment";
import db from "../models";
import bcrypt from 'bcryptjs';
const User = db.user;

export const agents = (req, res) => {
	let { id = null, name = "", phone_no = "", email = "", address = "", picture = "", user_id = null, password = null, role = 'Agent', query_type = '' } = req.body;
	// console.log({ body: true, data: req.body })
	if (query_type === 'create') {
		let newUser = {
			firstname: name,
			lastname: '',
			username: name,
			role,
			email,
			password,
		};
		bcrypt.genSalt(10, (err, salt) => {
			bcrypt.hash(newUser.password, salt, (err, hash) => {
				if (err) throw err;
				newUser.password = hash;
				User.create(newUser)
					.then(user => {
						user_id = user.id
						db.sequelize.query(`CALL  agent_request(:query_type,:name,:phone_no,:email,:address,:picture,:user_id)`, {
							replacements: {
								query_type, name, phone_no, email, address, picture, user_id
							}
						})
							.then((results) => { console.log(results) })
							.catch((error) => { console.error(error) })

					})
			})
		})
	}
	db.sequelize.query(`CALL  agent_request(:query_type,:name,:phone_no,:email,:address,:picture,:user_id)`, {
		replacements: {
			query_type, name, phone_no, email, address, picture, user_id
		}
	})
		.then((results) => { console.log(results) })
		.catch((error) => { console.error(error) })
}

