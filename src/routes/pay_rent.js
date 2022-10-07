const {pay_rent} = require("../controllers/pay_rent")

module.exports = (app) => {
    app.post("/pay_rent",pay_rent)
}