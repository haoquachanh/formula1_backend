import { Router } from "express"
import driver from './driver'
import team from './team'
import result from './result'

const routes = Router();

routes.use('/drivers',driver)
routes.use('/teams',team)
routes.use('/results',result)

// routes.use('/',)

export default routes