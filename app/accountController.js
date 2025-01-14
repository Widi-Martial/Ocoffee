const dataMapper = require('./dataMapper.js');
const validator = require("email-validator");
const bcrypt = require('bcrypt');
const saltRounds = 10;


const accountController = {
    registerUser: async (req, res) => {
        const user = req.body;

    try {
        //Vérifier que tous les champs sont remplis
    if (!user.firstname || !user.lastname || !user.email || !user.passwordRegister || !user. passwordRegisterConfirm) {
        return res.status(422).render('./html/myAccount',{ errorMessage : "Tous les champs sont obligatoires"})
    };
    //Vérifier que le mot de passe et le password correspondent
    if (user.passwordRegister !== user.passwordRegisterConfirm){
        return res.status(422).render('./html/myAccount',{ errorMessage : "Le mot de passe et sa confirmation doivent être similaires"})
    }; 
    //Vérifier le format de l'adresse mail
    if (!validator.validate(user.email)){
        return res.status(422).render('./html/myAccount',{ errorMessage : "L'adresse mail n'est pas valide"})
    };
    //Vérifier que l'addresse mail n'existe pas déja en base
    const checkMail = await dataMapper.searchSameUsersMail(user.email);
    if (checkMail) {
        return res.status(422).render('./html/myAccount',{ errorMessage : "Adresse mail déja utilisée"}) 
    }
    //chiffrer le mot de passe
    const UserHashPassword = await bcrypt.hash(user.passwordRegisterConfirm, saltRounds)

    const userCreate = await dataMapper.insertUser(user, UserHashPassword);
    console.log(userCreate);
    res.redirect('/')   
    } catch (error) {
        console.error(error);
        res.status(500).render('./errors/500')  
    }},

    loginUser: (req, res) => {
        res.send("connexion ok")
    }
}

module.exports = accountController;