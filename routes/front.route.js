const { Router } = require("express");
const { obtenerDirecciones } = require("../database");

const router = Router()


router.get("/", async (req, res) => {
    res.render("home", {rows: await obtenerDirecciones()})
})

router.get("/crea-visita", async (req, res) => {
    res.render("creavisita", {rows: await obtenerDirecciones()})
})

router.post("/crea-visita", async (req, res) => {
    console.log(req.body);
    res.redirect("/")
})

module.exports = router
