import { upload } from "../config/multer";
import { agents } from "../controllers/agents";

module.exports = (app) => {
    app.post("/agents", upload.array('files'), agents)
}