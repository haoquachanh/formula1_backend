import { Entity, PrimaryGeneratedColumn, Column, ManyToMany, JoinTable } from 'typeorm';
import { Driver } from './Driver';

@Entity()
export class Schedule {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  startdate!: string;

  @Column()
  enddate!: string;

  @Column()
  place!: string;

  @Column()
  year!: number;
  
  @ManyToMany(() => Driver)
  @JoinTable()
  drivers?: Driver[];
}
