const { Router } = require("express");
const { buscarPorRut, ingresarUsuario, ingresarVisita, ingresarPropietario, cambioEstado, eliminar, borrarPropietario } = require("../database");
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
// post /registrarme
router.post('/registrarme', async (req, res) => {
    console.log(req.body);
     ingresarUsuario(req.body)
     .then(() => res.redirect('/'))
     .catch((err) => {
         //res.send(err.detail)
        res.redirect("/registrarme?error=" + err.code)
         console.log(err);
     })
})

// post /creavisitas
router.post('/creavisitas', async (req, res) => {
    req.body.rut_usuario = req.usuario.rut
    console.log(req.body);
     ingresarVisita(req.body)
     .then(() => res.redirect('/iniciar-sesion'))
     .catch((err) => {
        res.redirect("/visitas?error=" + err.code)
         console.log(err);
     })
})

// post /creapropietarios
router.post('/creapropietarios', async (req, res) => {
    console.log(req.body);
     ingresarPropietario(req.body)
     .then(() => res.redirect('/iniciar-sesion'))
     .catch((err) => {
        res.redirect("/propietarios/crear?error=" + err.code)
         console.log(err);
     })     
})

router.put('/estado/:id/:estado', async (req, res) => {
    await cambioEstado(req.params)
    //.then(console.log) 
    .catch((err) => {
         console.log(err);
     })
    res.send("")
})

router.delete("/propietarios/:rut", (req, res) => {
    const {rut} = req.params
    console.log(rut);
    borrarPropietario(rut).then(() => {
        return eliminar(rut).then(() => res.send("eliminado"))
    }).catch(console.error)
})

module.exports = router
