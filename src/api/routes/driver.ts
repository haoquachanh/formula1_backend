import { Router } from "express"
import DriverController from "../controllers/driverController";

const routes = Router();

routes.get('/', DriverController.getDrivers)
routes.post('/',DriverController.createDriver)
routes.put('/',DriverController.updateDriver)
// routes.delete('/',DriverController.deleteDrivers)
// routes.use('/',)

export default routes