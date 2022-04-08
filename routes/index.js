const vistas = require("./vistas.route")
const back = require("./back.route")

exports.load = (app) =>{
    app.use(vistas)
    app.use(back)
}