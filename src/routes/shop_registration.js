const {shop_registration, getShop_registration,getShopList} = require("../controllers/shop_registration")

module.exports = (app) => {
    app.post("/shop_registration",shop_registration)
    app.get("/get_shop_list",getShopList)
    app.get("/get_shop_registration",getShop_registration)
}
