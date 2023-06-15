import { Request, Response } from "express";
import { getRepository } from "typeorm";
import { User } from "../models/User";

export const getAllUsers = async (req: Request, res: Response) => {
  const userRepository = getRepository(User);
  const users = await userRepository.find();
  res.json(users);
};

export const createUser = async (req: Request, res: Response) => {
  const userRepository = getRepository(User);
  const newUser = userRepository.create(req.body);
  await userRepository.save(newUser);
  res.status(201).json(newUser);
};
