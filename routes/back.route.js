const { Router } = require("express");
const { buscarPorRut, ingresarUsuario, ingresarVisita, ingresarPropietario } = require("../database");
const jwt = require("jsonwebtoken")

const secretKey = process.env["JWT_SECRET"]

const router = Router()

router.post("/crea-visita", async (req, res) => {
    console.log(req.body);
    res.redirect("/")
})

router.post('/iniciar-sesion', async (req, res) => {
    const { rut, password } = req.body;
    const user = await buscarPorRut(rut, password);

    if (user) {
        res.ingresar(user).redirect("/iniciar-sesion")
    } else {
        res.redirect("/?error=1")
    }
});
// Post /Registrarme
router.post('/registrarme', async (req, res) => {
    console.log(req.body);
     ingresarUsuario(req.body)
     .then(() => res.redirect('/'))
     .catch((err) => {
         //res.send(err.detail)
        res.redirect("/registrarme?error=" + err.code)
         console.log(err);
     })
// Ingresar Direccion -- Debo Grabar la Nueva direccion o si existe ??
})

// Post /Registrarme
router.post('/creavisitas', async (req, res) => {
    console.log(req.body);
    req.body.rut_usuario = req.usuario.rut
    console.log(req.body);
     ingresarVisita(req.body)
     .then(() => res.redirect('/'))
     .catch((err) => {
        res.redirect("/registrarme?error=" + err.code)
         console.log(err);
     })
})

// Post /Registrarme
router.post('/creapropietarios', async (req, res) => {
    console.log(req.body);
     ingresarPropietario(req.body)
     .then(() => res.redirect('/'))
     .catch((err) => {
        res.redirect("/propietarios?error=" + err.code)
         console.log(err);
     })
})
module.exports = router
