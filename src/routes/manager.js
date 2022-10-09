import { getManager, manager } from "../controllers/manager";

module.exports =(app) =>{
    app.post("/manager", manager)
    app.get("/getManager", getManager)
}