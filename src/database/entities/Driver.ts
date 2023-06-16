import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, OneToMany, ManyToMany, JoinTable } from 'typeorm';
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
  
  
  @ManyToOne(() => Team, team => team.drivers)
  team!: Team;

  @OneToMany(() => ResultDHL, resultDHL => resultDHL.driver)
  resultsdhl!: ResultDHL;

  @OneToMany(() => ResultDriver, c => c.driver)
  resultDrivers!: ResultDriver[];
  
  @OneToMany(() => ResultRace, c => c.driver)
  resultRaces!: ResultRace[];

  @ManyToMany(() => Schedule)
  @JoinTable()
  schedules!: Schedule[];

}
