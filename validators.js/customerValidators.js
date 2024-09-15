import { body } from "express-validator";

export const customerRegistrationValidations = [
    body('name')
    .notEmpty().withMessage('Name is required')
    .isLength({ min: 2 }).withMessage('Name must be at least 2 characters long')
    .matches(/^[a-zA-Z\s]+$/).withMessage('Name must contain only letters and spaces'),

    body('email')
    .notEmpty().withMessage('Email is required')
    .isEmail().withMessage('Invalid email address'),

    body('mobileNo')
    .notEmpty().withMessage('Mobile number is required')
    .isMobilePhone('en-IN').withMessage('Invalid mobile number')

]