import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Driver } from './Driver';
import { ResultTeam } from './ResultTeam';

@Entity()
export class Team {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  fullname!: string;

  @Column()
  team_chief!: string;

  @Column()
  champion!: number;

  @Column()
  name!: string;

  @OneToMany(()=> Driver, driver => driver.team)
  drivers!: Driver[];

  @OneToMany(()=>ResultTeam, r=> r.team)
  results!: ResultTeam[];
}
