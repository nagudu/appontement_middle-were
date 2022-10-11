import { getTenant, tenant,getTenantList } from "../controllers/tenant";

module.exports =(app) =>{
    app.post("/tenant", tenant)
    app.get("/getTenant", getTenant)
    app.get("/getTenantList", getTenantList)
}