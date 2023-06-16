import { Router } from "express"
import YearController from "../controllers/yearController";

const routes = Router();

routes.get('/team/:year', YearController.getTeam)
routes.get('/dhl/:year', YearController.getDHL)
routes.get('/race/:year', YearController.getRace)
routes.get('/driver/:year', YearController.getDriver)

export default routes