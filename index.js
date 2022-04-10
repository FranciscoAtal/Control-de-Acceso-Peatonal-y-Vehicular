require("dotenv").config()
const cookieParser = require("cookie-parser")
const express = require("express")
const { engine } = require("express-handlebars")
const { parsearToken, guardia } = require("./middlewares/parsear-token")
const routes = require("./routes")

const port = process.env.PORT || 3000
const app = express()

app.engine('handlebars', engine({
    helpers: {
        sumarUno: (n) => +n + 1
    }
}))

//app.engine("handlebars", engine())
app.set("view engine", "handlebars")

app.use(express.static("assets"));
app.use(cookieParser())
app.use(express.urlencoded({ extended: true }))
app.use(parsearToken)
//app.use([], guardia)//

app.use((req, res, next) => {
    if (req.body.rut)
        req.body.rut = req.body.rut.split(".").join('').replace('-', '')

    next()
})

routes.load(app)
//app.use(front)

app.listen(port, () => {
    console.log(`escuchando en http://localhost:${port}`);
})