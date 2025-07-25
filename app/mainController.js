import { dataMapper } from './dataMapper.js';

export const mainController = {

    homepage : async (req,res) => {
        try {
            const newsCoffees = await dataMapper.newProduct();
            res.render('./html/accueil', {newsCoffees});

        } catch (error) {
            console.error(error);
            res.status(500).render('./errors/500')
        }

    },

    catalog : async (req,res) => {
        const id = req.params.all;
        const bucketId = req.session.bookmark
        const types = await dataMapper.type();
        let coffees;

        try {
            if (!id) {
                coffees = await dataMapper.product();
                res.render('./html/catalog', {coffees, types, bucketId});
            } else {
                coffees = await dataMapper.allProducts();
                res.render('./html/catalog', {coffees, types, bucketId})
            } 

        } catch (error) {
            console.error(error);
            res.status(500).render('./errors/500')
        }
    },


    productD : async (req,res) => {
        const id = parseInt(req.params.id);

        try {
            const detailP = await dataMapper.getProductById(id);
            res.render('./html/detail', {detailP})
            
            
        } catch (error) {
            console.error(error)
            res.status(500).render('./errors/500');   
        }
    },

    getCoffeeCategory : async (req,res) => {
        const bucketId = req.session.bookmark
        const types = await dataMapper.type();
        const category = req.body.category;
        try {
        const getcoffee = await dataMapper.getProductByCategory(category); 
        res.render('./html/catFilter', {getcoffee, types, bucketId}); 
        } catch (error) {
            console.error(error).render(500)
        }
    },

    store :(req, res) => {
        res.render('./html/store')
    },

    accountPage:(req, res) => {
        res.render('./html/myAccount')
    }

}


// module.exports = mainController;