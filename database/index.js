require("dotenv").config()
const { Pool } = require("pg");
const fs = require("fs")
const path = require("path")


const pool = new Pool()

const migrar = () => {
    const data = fs.readFileSync(path.join(__dirname, "data.sql"), {encoding:"utf8"})

    pool.query(data)
    .then(()=>console.log('migracion completada!'))
    .catch(console.error)
    .finally(() => pool.end())
}

const obtenerDirecciones = () => {
    return pool.query("Select * from direcciones").then(res => res.rows)
}

const probar = () => {
    obtenerDirecciones()
    .then(rows => console.log(rows))
    .catch(console.error)
    .finally(() => pool.end())
}

module.exports = {migrar, probar, obtenerDirecciones}