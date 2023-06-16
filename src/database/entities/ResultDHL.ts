import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Driver } from './Driver';

@Entity()
export class ResultDHL {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  timeComplete!: string;

  @Column()
  country!: string;

  @Column()
  car!: string;

  @Column()
  year!: number;

  @ManyToOne(() => Driver, driver => driver.resultsdhl)
  driver!: Driver;
}
