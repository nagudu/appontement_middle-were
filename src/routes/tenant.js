import { getTenant, tenant } from "../controllers/tenant";

module.exports =(app) =>{
    app.post("/tenant", tenant)
    app.get("/getTenant", getTenant)
}