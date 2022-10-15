import { agents} from "../controllers/agents";

module.exports =(app) =>{
    app.post("/agents", agents)
}