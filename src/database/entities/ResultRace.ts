import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Driver } from './Driver';

@Entity()
export class ResultRace {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  date!: string;

  @Column()
  car!: string;

  @Column()
  timeComplete!: string;

  @Column()
  country!: string;

  @Column()
  driver!: string;

  @Column()
  year!: number;

  @ManyToOne(() => Driver, driver => driver.resultRaces)
  driverData!: Driver;
}
