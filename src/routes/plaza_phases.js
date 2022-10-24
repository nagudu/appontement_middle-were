// import { getPlazaPhaseList } from "../controllers/plaza";
// import { getPlazaPhaseList, plaza } from "../controllers/plaza";
import { getPlazaPhase, plaza_phases, getPlazaPhaseList } from "../controllers/plaza_phases";

module.exports = (app) => {
    app.post("/plaza_phases", plaza_phases)
    app.get("/get_plaza_phases", getPlazaPhase)
    app.get("/get-plaza-phase-list", getPlazaPhaseList)
}