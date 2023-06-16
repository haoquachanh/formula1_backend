import { Request, Response } from "express"

class TeamController {
    static getTeam(req: Request, res: Response): Promise<void>{
    return new Promise<void>((resolve, reject) =>{
        try {

            res.status(200).json({
                err:0,
                mes: ""
            })
            resolve()
        } catch (error) {
            res.status(500).json({
                err:0,
                mes: "Error: " + error
            })
            reject(error);
        }
    })
    }
    static updateTeam(req: Request, res: Response): Promise<void>{
    return new Promise<void>((resolve, reject) =>{
        try {

            res.status(200).json({
                err:0,
                mes: ""
            })
            resolve()
        } catch (error) {
            res.status(500).json({
                err:0,
                mes: "Error: " + error
            })
            reject(error);
        }
    })
    }
    static createTeam(req: Request, res: Response): Promise<void>{
    return new Promise<void>((resolve, reject) =>{
        try {

            res.status(200).json({
                err:0,
                mes: ""
            })
            resolve()
        } catch (error) {
            res.status(500).json({
                err:0,
                mes: "Error: " + error
            })
            reject(error);
        }
    })
    }
    static deleteTeam(req: Request, res: Response): Promise<void>{
    return new Promise<void>((resolve, reject) =>{
        try {

            res.status(200).json({
                err:0,
                mes: ""
            })
            resolve()
        } catch (error) {
            res.status(500).json({
                err:0,
                mes: "Error: " + error
            })
            reject(error);
        }
    })
    }

}

export default TeamController