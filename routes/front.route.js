const { Router } = require("express");
const { obtenerDirecciones } = require("../database");

const secretKey = process.env["JWT_SECRET"]

const router = Router()

router.get("/", async (req, res) => {
    res.render("home", {rows: await obtenerDirecciones()})
})

router.get("/iniciar-sesion", (req, res) => {
    res.render("login", req);
})

router.get("/crea-visita", async (req, res) => {
    res.render("creavisita", {rows: await obtenerDirecciones()})
})

router.post("/crea-visita", async (req, res) => {
    console.log(req.body);
    res.redirect("/")
})

router.post('/iniciar-sesion', async (req, res) => {
    const { rut, password } = req.body;
    const user = await db.buscar(rut, password);

    if (user) {
        const token = jwt.sign({ user }, secretKey, { expiresIn: '30m' });

        res.cookie("token", token).redirect("/crea-visita")
    } else {
        res.send("Usuario o contraseña incorrecta");
    }
});

module.exports = router
