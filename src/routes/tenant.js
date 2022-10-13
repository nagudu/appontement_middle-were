import { getTenant, tenant,getTenantList,getTenantShops} from "../controllers/tenant";

module.exports =(app) =>{
    app.post("/tenant", tenant)
    app.get("/tenant", tenant)
    app.get("/getTenant", getTenant)
    app.get("/getTenantList", getTenantList)
    app.get("/get-tenant-shops", getTenantShops)
}