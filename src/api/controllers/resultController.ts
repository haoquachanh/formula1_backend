import { Request, Response } from "express";
import { FindManyOptions, In, MoreThanOrEqual, Not, getTreeRepository } from "typeorm";
import { Driver } from "../../database/entities/Driver";
import { ResultTeam } from "../../database/entities/ResultTeam";
import { ResultDriver } from "../../database/entities/ResultDriver";


class ResultController {
    static getTeam(req: Request, res: Response): Promise<void>{
        return new Promise<void>(async(resolve, reject) =>{
            try {
            const repository = getTreeRepository(ResultTeam);
            const year= req.params?.year;
            const { id, point, page, limit, sortBy, sortOrder } = req.query;
  
            // Tạo đối tượng query
            const query: FindManyOptions<ResultTeam> = {
              where: { id: Not(In([1, 2, 3])) },
            };
        
            // Xử lý filter
            if (year) {
              query.where = { ...query.where, year: Number(year) };
            }
            if (id) {
              query.where = { ...query.where, id: Number(id) };
            }
            if (point) {
              query.where = { ...query.where, point: MoreThanOrEqual(Number(point)) };
            }
        
            //thêm phần lọc theo tên team mà cái team là nó foreignkey chưa coi :<

            // Xử lý sort
            if (sortBy && sortOrder) {
              query.order = { [sortBy as string]: sortOrder as 'ASC' | 'DESC' };
            }
        
            // Xử lý paging
            const pageNumber = Number(page) || 1;
            const pageSize = Number(limit) || 10;
            query.skip = (pageNumber - 1) * pageSize;
            query.take = pageSize;
        
            // Query và kết quả
            const [data, totalCount] = await repository.findAndCount(query);



            res.status(200).json({
                err: 0,
                mess: `Got ${totalCount} results`,
                totalDrivers: totalCount,
                page: pageNumber,
                limit: pageSize,
                data: data,
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
        return new Promise<void>(async(resolve, reject) =>{
            try {
            const repository = getTreeRepository(ResultDriver);
            const year= req.params?.year;
            const { id, point, page, limit, sortBy, sortOrder } = req.query;
  
            // Tạo đối tượng query
            const query: FindManyOptions<ResultDriver> = {
              where: { id: Not(In([1, 2, 3])) },
            };
        
            // Xử lý filter
            if (year) {
              query.where = { ...query.where, year: Number(year) };
            }
            if (id) {
              query.where = { ...query.where, id: Number(id) };
            }
            if (point) {
              query.where = { ...query.where, point: MoreThanOrEqual(Number(point)) };
            }
        
            //thêm phần lọc theo tên team mà cái team là nó foreignkey chưa coi :<

            // Xử lý sort
            if (sortBy && sortOrder) {
              query.order = { [sortBy as string]: sortOrder as 'ASC' | 'DESC' };
            }
        
            // Xử lý paging
            const pageNumber = Number(page) || 1;
            const pageSize = Number(limit) || 10;
            query.skip = (pageNumber - 1) * pageSize;
            query.take = pageSize;
        
            // Query và kết quả
            const [data, totalCount] = await repository.findAndCount(query);



            res.status(200).json({
                err: 0,
                mess: `Got ${totalCount} results`,
                totalDrivers: totalCount,
                page: pageNumber,
                limit: pageSize,
                data: data,
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
    return new Promise<void>(async(resolve, reject) =>{
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
    return new Promise<void>(async(resolve, reject) =>{
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

export default ResultController