import { body } from "express-validator";

export const vendorRegistrationValidations = [
    body('name')
    .notEmpty().withMessage('Name is required')
    .isLength({ min: 2 }).withMessage('Name must be at least 2 characters long')
    .matches(/^[a-zA-Z\s]+$/).withMessage('Name must contain only letters and spaces'),

    body('username').notEmpty().withMessage('Username is required')
        .matches(/^[a-zA-Z0-9_@.-]*$/).withMessage('Username can only contain letters, numbers, and the following special characters: _ @ . -'),

    body('password')
        .isLength({ min: 8 }).withMessage('Password must be at least 8 characters long')
        .matches(/[a-z]/).withMessage('Password must contain at least one lowercase letter')
        .matches(/[A-Z]/).withMessage('Password must contain at least one uppercase letter')
        .matches(/\d/).withMessage('Password must contain at least one number')
        .matches(/[!@#$%^&*()_+{}\[\]:;"'<>,.?~`-]/).withMessage('Password must contain at least one special character from the allowed set')
        .not().matches(/\s/).withMessage('Password must not contain whitespace characters'),

    body('email')
        .notEmpty().withMessage('Email is required')
        .isEmail().withMessage('Invalid email address'),

    body('profile').notEmpty('Profile Image is required'),

    body('mobileNo')
        .notEmpty().withMessage('Mobile Number is required')
        .isMobilePhone('en-IN').withMessage('Invalid Indian mobile number'),

    body('bankName').notEmpty().withMessage('Bank name is required'),

    body('accountNumber')
        .notEmpty().withMessage('Account number is required')
        .isLength({ min: 10, max: 20 }).withMessage('Account number must be between 10 and 20 digits'),


    body('accountType')
        .notEmpty().withMessage('Account type is required')
        .isIn(['Savings', 'Current']).withMessage('Account type must be Savings or Current'),


    body('accountHolder').notEmpty().withMessage('Account holder name is required'),

    body('facebook').isURL().withMessage('Invalid Facebook URL'),
    body('insta').isURL().withMessage('Invalid Instagram URL'),
    body('linkedIn').isURL().withMessage('Invalid LinkedIn URL'),

    body('street').notEmpty().withMessage('Street is required'),
    body('city').notEmpty().withMessage('City is required'),
    body('state').notEmpty().withMessage('State is required'),

    body('postalCode')
        .notEmpty().withMessage('Postal code is required')
        .matches(/^[1-9][0-9]{5}$/).withMessage('Invalid Indian postal code'),
]