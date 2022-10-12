import { managerRequest } from "../controllers/manager";

module.exports =(app) =>{
    app.post("/manager-request", managerRequest)
}