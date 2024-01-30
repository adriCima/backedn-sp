const TABLA = 'products'

module.exports = function(dbInyectada){

    let db = dbInyectada;

    if(!db){
        db = require('../../database/mysql.js')
    }
    
    function all() {
        return db.all(TABLA)
    }

    function detailProducts(){
        return db.detailProducts(TABLA)
    }

    function detailProductsId(id){
        return db.detailProductsId(TABLA, id)
    }

    function del(body){
        return db.del(TABLA, body)
    }

    function insert(body){
        return db.insert(TABLA, body)
    }

    return{
        all,
        detailProducts,
        detailProductsId,
        del,
        insert,
    }
}