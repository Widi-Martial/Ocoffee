const express = require('ultimate-express');
const router = express.Router();

const mainController = require('./app/mainController');
const bucketContoller = require('./app/bucketController');
const accountController = require('./app/accountController');


router.post('/catalog', mainController.getCoffeeCategory);
router.get('/', mainController.homepage);
router.get('/catalog', mainController.catalog);
router.get('/catalog/detail/:id', mainController.productD);
router.get('/catalog/:id', mainController.catalog);
router.get('/boutique', mainController.store);
router.get('/addToBucket/:id',bucketContoller.addToBucket);
router.get('/delToBucket/:id',bucketContoller.addToBucket);
router.get('/bucket', bucketContoller.showBucket);
router.get('/monCompte', mainController.accountPage);
router.post('/monCompte', accountController.loginUser);
router.post('/registerAccount', accountController.registerUser)




module.exports = router;
