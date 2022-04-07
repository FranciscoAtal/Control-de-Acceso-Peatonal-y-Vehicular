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

const buscarPorRut = async (rut, password) => {
    const res = await pool.query('SELECT * from usuarios WHERE rut = $1 AND password = $2', [rut, password])
    return res.rows[0]
}

const ingresarUsuario = ({rut, nombre, password}) => {
    const consulta = 'INSERT INTO usuarios(rut, nombre, password) values($1, $2, $3)'
    return pool.query(consulta, [rut, nombre, password])
}

const ingresarVisita = ({rut, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, rut_usuario}) => {
    const consulta = 'INSERT INTO usuarios(rut, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, rut_usuario) values($1, $2, $3, $4, $5, $6, $7)'
    return pool.query(consulta, [rut, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, rut_usuario])
}
module.exports = {migrar, probar, obtenerDirecciones, buscarPorRut, ingresarUsuario, ingresarVisita}