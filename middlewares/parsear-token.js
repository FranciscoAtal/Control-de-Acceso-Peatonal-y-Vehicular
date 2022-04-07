const jwt = require("jsonwebtoken")

const secretKey = process.env["JWT_SECRET"]

const guardia = (req, res, next) => {
    req.usuario ? next() : res.sendStatus(401)
}

const parsearToken = (req, res, next) => {
    res.ingresar = function (datos) {
        const token = jwt.sign(datos, secretKey, { expiresIn: '30m' });
        return this.cookie("token", token)
    }

    if ((token = req.cookies?.token)) {
        jwt.verify(token, secretKey, (err, decoded) => {
            if (!err)
                req.usuario = decoded
        })
    }

    next()
}

module.exports = {guardia, parsearToken}