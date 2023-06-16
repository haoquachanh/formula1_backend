import { Request, Response } from 'express';
import { In, Not, getRepository } from 'typeorm';
import { Driver } from '../../database/entities/Driver';
import { driverSchema } from '../helper/joi_chema';

class DriverController {
  static async getByYear(req: Request, res: Response) {
    const { year } = req.params;
    const driverRepository = getRepository(Driver);

    try {
      const drivers = await driverRepository.find({ where: { fullname: year } });
      res.json(drivers);
    } catch (error) {
      res.status(500).json({ error: 'An error occurred' });
    }
  }

  static async getAll(req: Request, res: Response) {
    const { year } = req.params;
    const driverRepository = getRepository(Driver);

    try {
      const drivers = await driverRepository
        .find({
            where: {id: Not(In ([1,2,3]))}
        });
      res.status(200).json({
        err: 0,
        mess: "Got all users",
        data: drivers
      });
    } catch (error) {
      res.status(500).json({ error: 'An error occurred' });
    }
  }

  static async deleteAllDrivers() {
    try {
      const driverRepository = getRepository(Driver);
      const result = await driverRepository
        .createQueryBuilder()
        .delete()
        .from(Driver)
        .execute();
  
      console.log('Deleted drivers:', result.affected);
    } catch (error) {
      console.error('Error deleting drivers:', error);
    }
  }

  static async createNewDriver(req: Request, res: Response){
    try {
      let {country, point, champion, fullname, number,avt} = req.body
      const driverRepository = getRepository(Driver);
      const newDriver = new Driver();
      newDriver.country = country
      newDriver.point = point;
      newDriver.champion = champion 
      newDriver.fullname = fullname;
      newDriver.number = number 
      newDriver.avt = avt
  
      // Lưu tài xế vào cơ sở dữ liệu
      await driverRepository.save(newDriver);
      res.status(200).json({
        err:0,
        mes: "Driver created !"
      })
      // console.log('Created driver:', createdDriver);

    } catch (error) {
      console.error('Error creating driver: ', error);
    }
  }

  static updateOneDriver(req: Request, res: Response): Promise<void> {
    return new Promise<void>(async(resolve, reject) => {
      try {
          const { error, value } = driverSchema.validate(req.body);
          const id = Number(req.query?.id)

          const driverRepository = getRepository(Driver);
          const updater= await driverRepository
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
        reject(error);
      }

    });
  
  
  }


}

export default DriverController;
