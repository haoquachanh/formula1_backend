import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany, ManyToMany, JoinTable, DeleteDateColumn} from 'typeorm';
import { Team } from './Team';
import { ResultDHL } from './ResultDHL';
import { ResultDriver } from './ResultDriver';
import { ResultRace } from './ResultRace';
import { Schedule } from './Schedule';

@Entity()
export class Driver {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  country!: string;
  
  @Column({ type: 'float' })
  point!: number;
  
  @Column()
  champion!: number;
  
  @Column()
  fullname!: string;
  
  @Column()
  number!: number;
  
  @Column()
  avt!: string;
  
  
  @ManyToOne(() => Team, team => team.drivers, {cascade : true})
  team!: Team;

  @OneToMany(() => ResultDHL, resultDHL => resultDHL.driver, {cascade : true, onDelete: "CASCADE"})
  resultsdhl!: ResultDHL[];

  @OneToMany(() => ResultDriver, c => c.driver, {cascade : true})
  resultDrivers!: ResultDriver[];
  
  @OneToMany(() => ResultRace, c => c.driver, {cascade : true})
  resultRaces!: ResultRace[];

  @ManyToMany(() => Schedule, {cascade : true})
  @JoinTable()
  schedules!: Schedule[];

  @DeleteDateColumn()
  deletedAt!: Date;

}
