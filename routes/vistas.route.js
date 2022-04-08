const { Router } = require("express");
const { obtenerDirecciones, buscarPorRut } = require("../database");

const secretKey = process.env["JWT_SECRET"]

const router = Router()

router.get("/", async (req, res) => {
    res.render("home",  req.query)
})

router.get("/iniciar-sesion", (req, res) => {
    res.render("login", req);
})

router.get('/registrarme', (req, res) => {
    res.render("registro", req.query);
})

router.get('/propietarios', async (req, res) => {
    res.render("creapropietarios", {rows: await obtenerDirecciones()});
})

router.get('/visitas', async (req, res) => {
    console.log(req.usuario);
    res.render("creavisitas", {rows: await obtenerDirecciones()});
})

router.get('/logout', async (req, res) => {
    res.clearCookie("token").redirect("/")
})

module.exports = router
