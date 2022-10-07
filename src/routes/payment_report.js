const {payment_report, getRayment_report} = require("../controllers/payment_report")

module.exports = (app) => {
    app.post("/payment_report",payment_report)
    app.get("/getRayment_report",getRayment_report)
}