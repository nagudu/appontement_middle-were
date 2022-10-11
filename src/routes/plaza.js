import { getPlaza, plaza,getPlazaList,getPlazaPhaseList } from "../controllers/plaza";

module.exports =(app) =>{
    app.post("/plaza",plaza)
    app.get("/getPlaza", getPlaza)
    app.get("/get-plaza-list", getPlazaList)
}