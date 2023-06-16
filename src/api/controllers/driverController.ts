import { Request, Response, query } from 'express';
import { In, Not, getRepository, FindManyOptions, MoreThanOrEqual  } from 'typeorm';
import { Driver } from '../../database/entities/Driver';
import { driverSchema } from '../helper/joi_chema';
import Joi from 'joi';

class DriverController {
  static async getDrivers(req: Request, res: Response) {
    const driverRepository = getRepository(Driver);
    try {
      const { id, fullname, point, country, page, limit, sortBy, sortOrder } = req.query;
  
      // Tạo đối tượng query
      const query: FindManyOptions<Driver> = {
        where: { id: Not(In([1, 2, 3])) },
      };
  
      // Xử lý filter
      if (id) {
        query.where = { ...query.where, id: Number(id) };
      }
      if (fullname) {
        query.where = { ...query.where, fullname: fullname as string };
      }
      if (point) {
        query.where = { ...query.where, point: MoreThanOrEqual(Number(point)) };
      }
      if (country) {
        query.where = { ...query.where, country: country as string };
      }
  
      // Xử lý sort
      if (sortBy && sortOrder) {
        query.order = { [sortBy as string]: sortOrder as 'ASC' | 'DESC' };
      }
  
      // Xử lý paging
      const pageNumber = Number(page) || 1;
      const pageSize = Number(limit) || 5;
      query.skip = (pageNumber - 1) * pageSize;
      query.take = pageSize;
  
      // Query và kết quả
      const [drivers, totalCount] = await driverRepository.findAndCount(query);
  
      return res.status(200).json({
        err: 0,
        mess: `Got ${totalCount} drivers`,
        totalDrivers: totalCount,
        page: pageNumber,
        limit: pageSize,
        data: drivers,
      });
    } catch (error) {
      res.status(500).json({ error: 'An error occurred' });
    }
  }

  static createDriver(req: Request, res: Response): Promise<void> {
    return new Promise<void>(async(resolve, reject) => {
      try {
        const { error, value } = driverSchema.validate(req.body)
        if (error) throw error
    
        const driverRepository = getRepository(Driver)
        let inserter=await driverRepository
          .createQueryBuilder()
          .insert()
          .into(Driver)
          .values(value)
          .execute()
        let idCreated = inserter.generatedMaps[0].id

        res.status(201).json({
          err: 0,
          mes: 'Created driver!',
          id: idCreated
        });
      } catch (error) {
        res.status(400).json({
          err: 1,
          mes: 'Invalid request',
          error: "Error: "+ error
        });
      }
    })
  }

  static updateDriver(req: Request, res: Response): Promise<void> {
    return new Promise<void>(async(resolve, reject) => {
      try {
          const { error, value } = driverSchema.validate(req.body);
          if (error) throw error;
          const id = Number(req.query?.id)
          const driverRepository = getRepository(Driver);
          await driverRepository
            .createQueryBuilder()
            .update(Driver)
            .where("id = :id", {id: id })
            .set( value )
            .execute()
          
          res.status(200).json({
            err: 0,
            mes: "Updated driver!",
            // data: req.body,
            // id: id
          })
          // await driverRepository.save(updater)
          resolve()
      } catch (error) {
        res.status(500).json({ err: 1, mes: `Error ${error}` })
        reject(error);
      }

    });  
  }

  // static async deleteDrivers(req: Request, res: Response): Promise<void>{
  // return new Promise<void>(async(resolve, reject) =>{
  //   try {
  //     const {id, deleteAll} = req.query
  //     const driverRepository = getRepository(Driver);
      
  //     // Xóa các bản ghi liên quan trong bảng có khóa ngoại
  //     // await driverRepository.manager.transaction(async (entityManager) => {
  //       // const driver = await entityManager.findOne(Driver, id, { relations: ["teams", "resultsdhl", "resultDrivers", "resultRaces", "schedules"] });
  //       // const driver = await entityManager.findOneOrFail(Driver, id, { relations: ["teams", "resultsdhl", "resultDrivers", "resultRaces", "schedules"] });


  //       // if (driver) {
  //       //   if (driver.team) {
  //       //     await entityManager.remove(driver.team);
  //       //   }
  //       //   if (driver.resultsdhl) {
  //       //     await entityManager.remove(driver.resultsdhl);
  //       //   }
  //       //   if (driver.resultDrivers) {
  //       //     await entityManager.remove(driver.resultDrivers);
  //       //   }
  //       //   if (driver.resultRaces) {
  //       //     await entityManager.remove(driver.resultRaces);
  //       //   }
  //       //   if (driver.schedules) {
  //       //     await entityManager.remove(driver.schedules);
  //       //   }
  //       // }

  //       // Xóa driver chính
  //       // await entityManager.remove(driver);
  //       resolve()
  //     };

  //   } catch (error) {
  //     console.error('Error deleting driver:', error);
  //   }
  // })
}
export default DriverController;
