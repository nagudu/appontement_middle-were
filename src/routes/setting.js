import { getSetting, setting } from "../controllers/setting";

module.exports =(app) =>{
    app.post("/setting", setting)
    app.get("/getsetting", getSetting)
}