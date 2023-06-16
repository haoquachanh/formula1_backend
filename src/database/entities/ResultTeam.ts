import { Entity, PrimaryGeneratedColumn, Column, ManyToOne } from 'typeorm';
import { Team } from './Team';

@Entity()
export class ResultTeam {
  @PrimaryGeneratedColumn()
  id!: number;

  @Column()
  pos!: number;

  @Column()
  point!: number;

  @Column()
  year!: number;

  @ManyToOne(()=> Team, team => team.results)
  team!: Team;
}
