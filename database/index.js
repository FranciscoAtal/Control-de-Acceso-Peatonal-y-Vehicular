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

const listarVisitas = async () => {
    const res = await pool.query('SELECT * from visitas where estado = FALSE')
    return res.rows
}

const cambioEstado = (id, estado) => {
    return pool.query('UPDATE visitas set estado = $2 WHERE id = $1', [id, estado])
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
    const consulta = 'INSERT INTO visitas(rut, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, rut_usuario) values($1, $2, $3, $4, $5, $6, $7)'
    return pool.query(consulta, [rut, direccion_id, nombres, apellidos, sexo, opcion, nro_patente, rut_usuario])
}

const ingresarPropietario = ({rut, nombres, apellidos, sexo, email, nro_celular_principal, nro_celular_secundario, es_propietario}) => {
    const consulta = 'INSERT INTO propietarios(rut, nombres, apellidos, sexo, email, nro_celular_principal, nro_celular_secundario, es_propietario) values($1, $2, $3, $4, $5, $6, $7, $8)'
    return pool.query(consulta, [rut, nombres, apellidos, sexo, email, nro_celular_principal, nro_celular_secundario, es_propietario])
}

const ingresarDireccion = ({rut_propietario, nombre}) => {
    const consulta = 'INSERT INTO direcciones(rut_propietario, nombre) values($1, $2)'
    return pool.query(consulta, [rut_propietario, nombre])
}

module.exports = {migrar, probar, obtenerDirecciones, listarVisitas, cambioEstado, buscarPorRut, ingresarUsuario, ingresarVisita, ingresarPropietario, ingresarDireccion}