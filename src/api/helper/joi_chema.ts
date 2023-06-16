import Joi from "joi";

const driverSchema = Joi.object({
    country: Joi.string().required(),
    point: Joi.number().required(),
    fullname: Joi.string().required(),
    champion: Joi.number().required(),
    number: Joi.number().required(),
    avt: Joi.string().required(),
  });

const teamSchema = Joi.object({
    fullname: Joi.string().required(),
    champion: Joi.number().required(),
    name: Joi.string().required(),
    team_chief: Joi.string().required(),
});


export {
  driverSchema,
  teamSchema
}