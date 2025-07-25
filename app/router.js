import express from 'ultimate-express';
import { mainController } from './mainController.js';
import accountController from './accountController.js';
import { bucketContoller } from './bucketController.js';

export const router = express.Router();

router.post('/catalog', mainController.getCoffeeCategory);
router.get('/', mainController.homepage);
router.get('/catalog', mainController.catalog);
router.get('/catalog/:all', mainController.catalog);
router.get('/detail/:id', mainController.productD);
router.get('/catalog/:id', mainController.catalog);
router.get('/boutique', mainController.store);
router.get('/addToBucket/:id',bucketContoller.addToBucket);
router.get('/delToBucket/:id',bucketContoller.addToBucket);
router.get('/bucket', bucketContoller.showBucket);
router.get('/monCompte', mainController.accountPage);
router.post('/monCompte', accountController.loginUser);
router.post('/registerAccount', accountController.registerUser)




//module.exports = router;
