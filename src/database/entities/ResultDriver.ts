import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Driver } from './Driver';

@Entity()
export class ResultDriver {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  driver!: string;

  @Column()
  pos!: number;

  @Column()
  point!: number;

  @Column()
  car!: string;

  @Column()
  year!: number;

  @ManyToOne(() => Driver, driver => driver.resultDrivers)
  driverData!: Driver;
}
