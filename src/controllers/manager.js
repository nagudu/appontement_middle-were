import db from "../models";

export const managerRequest = (req, res) => {
    const {name ="", phone_no ="", email ="", address ="", picture = "" } = req.body;

    db.sequelize.query(`call manager_request(:query_type,:name,:phone_no,:email,:address,:picture)`,
    {
        replacements:{
            query_type,name,phone_no,email,address,picture
        }
    })
    .then((results) => res.json({ success: true, results }))
        .catch((err) => {
            console.log(err)
            res.status(500).json({ err })
        });
}
// export const getManager = (req, res) => {
    
//     db.sequelize.query(`SELECT  * from manager`)
//     .then((results) => res.json({ success: true, results }))
//         .catch((err) => {
//             console.log(err)
//             res.status(500).json({ err })});
// }
