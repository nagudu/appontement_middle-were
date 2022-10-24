import { getPlaza, plazas, getPlazaList, } from "../controllers/plazas";

module.exports = (app) => {
    app.post("/plazas", plazas)
    app.get("/getPlaza", getPlaza)
    app.get("/get-plaza-list", getPlazaList)
}