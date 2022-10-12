const {shop_registration, getShop_registration,getShopList,
    getPhaseShops} = require("../controllers/shop_registration")

module.exports = (app) => {
    app.post("/create_shop",shop_registration)
    app.get("/get_shop_list",getShopList)
    app.get("/get_shop_registration",getShop_registration)
    app.get("/get-phase-shops",getPhaseShops)
}
