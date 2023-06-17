import { Router } from "express"
import ResultController from "../controllers/resultController";

const routes = Router();

routes.get('/team/:year', ResultController.getTeam)
routes.get('/dhl/:year', ResultController.getDHL)
routes.get('/race/:year', ResultController.getRace)
routes.get('/driver/:year', ResultController.getDriver)

export default routes