const dataBase = require ('./clientDB.js');

const dataMapper = {

    async newProduct () {
        const query = "SELECT * FROM cafe ORDER BY reference DESC LIMIT 3";
        const result = await dataBase.query(query);
        return result.rows
    },

    async product () {
        const query = "SELECT * FROM cafe ORDER BY RANDOM() LIMIT 3";
        const result = await dataBase.query(query);
        return result.rows
    },

    async allProduct () {
        const query = "SELECT * FROM cafe";
        const result = await dataBase.query(query);
        return result.rows
    },

    async getAllProductBucket(id) {
        const result = await dataBase.query(`SELECT * FROM "cafe" WHERE id = ANY($1::int[])`, [id]) 
        return result.rows
    },

    async getTotalProductBucket(id) {
        const result = await dataBase.query(`SELECT SUM(prix_au_kilo) FROM cafe WHERE id = ANY($1::int[])`, [id])
        return result.rows[0]
    },

    async type () {
        const query = "SELECT caracteristique_principale  FROM cafe GROUP BY caracteristique_principale ";
        const result = await dataBase.query(query);
        return result.rows
    },

        async getProductById(id) {
        const result = await dataBase.query(`SELECT * FROM cafe WHERE "id"= $1`, [id]);
        return result.rows[0]
    },

    
    async getProductByCategory(category) {
        const result = await dataBase.query(`SELECT * FROM cafe WHERE "caracteristique_principale"= $1`, [category]);
        return result.rows
    },

    async insertUser(user, hashPassword) {
        const result = await dataBase.query
        (`INSERT INTO "user" ("firstname","lastname", "email","password") VALUES
        ($1, $2, $3, $4) RETURNING *`,[user.firstname, user.lastname, user.email, hashPassword]
        );
        return result.rows
    },

    async searchSameUsersMail(mail) {
        const result = await dataBase.query
        (`SELECT email FROM "user" WHERE email = $1`,[mail]);
        return result.rows[0] || null
    }
}



module.exports = dataMapper;