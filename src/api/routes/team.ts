import { Router } from "express"
import TeamController from "../controllers/driverController";

const routes = Router();

routes.get('/', TeamController.getDrivers)
routes.post('/',TeamController.createDriver)
routes.put('/',TeamController.updateDriver)
routes.delete('/',TeamController.deleteDrivers)
// routes.use('/',)

export default routes