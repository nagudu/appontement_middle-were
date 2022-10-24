// import moment from "moment";
import db from "../models";
import bcrypt from 'bcryptjs';
const User = db.user;

const agetQuery = (data, cb = (f) => f) => {
	let { name = "", phone_no = "", email = "", address = "", picture = "", user_id = null, phase_id = '', query_type = '', res = {} } = data;
	db.sequelize.query(`CALL  agent_request(:query_type,:name,:phone_no,:email,:address,:picture,:phase_id,:user_id)`, {
		replacements: {
			query_type, name, phone_no, email, address, picture, phase_id, user_id
		}
	})
		.then((results) => { cb({ success: true, results }) })
		.catch((error) => { cb({ success: false, error }) })
}

export const agents = (req, res) => {
	let { id = null, name = "", phone_no = "", email = "", address = "", picture = "", user_id = null, password = null, role = 'Agent', phase_ids = '' } = req.body;
	const { query_type = '', agent_id = null } = req.query
	console.log(req.body);
	if (query_type === 'create') {
		let newUser = {
			firstname: name,
			lastname: '',
			username: name,
			role,
			email,
			password,
		};
		bcrypt.genSalt(10, (error, salt) => {
			bcrypt.hash(newUser.password, salt, (err, hash) => {
				if (err) throw err;
				newUser.password = hash;
				User.create(newUser)
					.then(user => {
						user_id = user.id
						const phases = phase_ids.split(',').length ? phase_ids.split(',') : [phase_ids]
						phases.forEach((phase_id, idx) => {
							agetQuery({ query_type, name, phone_no, email, address, picture, phase_id, user_id, req, res }, cb => {
								if (cb.status && idx === (phases.length - 1)) {
									res.json(cb)
								} else {
									if (idx === (phases.length - 1)) {
										res.status(500).json(cb)
									} else {
										console.error(cb);
									}
								}
							})
						});
					})
			})
		})
	} else {
		agetQuery({ query_type, name, phone_no, email, address, picture, phase_ids, user_id: agent_id, req, res }, cb => {
			res.json(cb)
		})
	}
}

