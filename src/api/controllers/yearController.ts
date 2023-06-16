import { Request, Response } from "express";


class YearController {
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
    static getDriver(req: Request, res: Response): Promise<void>{
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
    static getDHL(req: Request, res: Response): Promise<void>{
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
    static getRace(req: Request, res: Response): Promise<void>{
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

export default YearController