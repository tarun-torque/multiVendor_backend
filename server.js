import 'dotenv/config'
import express from 'express'
import cluster from 'cluster'
import numCPUs from 'os'
import cors from 'cors'
import process from 'process'
import ApiRoutes from './routes/api.js'
const ncpus = numCPUs.cpus().length
import path from 'path'
import { fileURLToPath } from 'url';
import { dirname } from 'path';

const __filename = fileURLToPath(import.meta.url);
const __dirname = dirname(__filename);




const app = express()
app.use(cors())

app.use('/uploads', express.static(path.join(__dirname, 'uploads')));
app.use(express.json())
app.use('/api/v1',ApiRoutes)


app.get('/',(req,res)=>{
    res.send(`hello process id ${process.pid}`)
})

app.listen(process.env.PORT,(req,res)=>{
    console.log('Server is listing on port 10000')
})

    