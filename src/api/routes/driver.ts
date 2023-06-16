import { Router } from "express"
import DriverController from "../controllers/driverController";

const routes = Router();
routes.get('/', DriverController.getAll)
routes.post('/',DriverController.createNewDriver)

routes.put('/',DriverController.updateOneDriver)
routes.delete('/',DriverController.deleteAllDrivers)
// routes.use('/',)

export default routes