import { dataMapper } from './dataMapper.js';

export const bucketContoller = {

    addToBucket : (req, res) => {
        const id = parseInt(req.params.id);
        
        if (!req.session.bookmark.includes(id)) {
            req.session.bookmark.push(id)
        } else {
            req.session.bookmark = req.session.bookmark.filter (idFav => idFav !== id);
            }
            res.redirect('back');
        },
  

    showBucket : async (req, res) => {
        const articlesId = req.session.bookmark
        const total = await dataMapper.getTotalProductBucket(articlesId);
        const articlesBucket = await dataMapper.getAllProductBucket(articlesId);
        res.render('./html/bucket', {articlesBucket, total})
    }
}


// module.exports = bucketContoller;