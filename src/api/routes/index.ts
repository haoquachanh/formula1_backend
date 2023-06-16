import { Router } from "express"
import driver from './driver'

const routes = Router();

routes.use('/drivers',driver)
// routes.use('/',)

export default routes