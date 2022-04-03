const express = require("express")
const { engine } = require("express-handlebars")
const front = require("./routes/front.route.js")

const port = process.env.PORT || 3000
const app = express()

app.engine("handlebars", engine())
app.set("view engine", "handlebars")


app.use(express.static("assets"));
app.use(express.urlencoded({ extended: true }))

app.use(front)

app.listen(port, () => {
    console.log(`escuchando en http://localhost:${port}`);
})