import { Prisma } from "@prisma/client";
import prisma from "../../DB/db.confing.js";
import bcrypt from 'bcryptjs'
export const register  = async(req,res)=>{
    try {
        const {name,email,password} = req.body;
        const fileInfo = req.file;
        const salt = bcrypt.genSaltSync(10)
        const hash_pas = bcrypt.hashSync(password,salt)
        const data = {name ,email,password,profilePath:req.file.path}
        const saveData = await prisma.admin.create({data})
        res.status(200).json({status:200,msg:'registered'})
    } catch (error) {
        console.log(error)
        res.status(500).json({status:500,msg:'Something went wrong',error})
    }
}

export const getPatient = async(req,res)=>{
    try {
        const all = await prisma.admin.findMany()
        res.status(200).json({status:200,all})
    } catch (error) {
        console.log(error)
        res.status(500).json({status:500,msg:'Something went wrong'})
    }
}