const TABLA = 'order_detail'

module.exports = function(dbInyectada){

    let db = dbInyectada;

    if(!db){
        db = require('../../database/mysql.js')
    }
    
    function all() {
        return db.all(TABLA)
    }

    function detailOrderIdOrder(id){
        return db.detailOrderIdOrder(TABLA, id)
    }

    function del(body){
        return db.del(TABLA, body)
    }

    function insert(body){
        return db.insert(TABLA, body)
    }


    return{
        all,
        detailOrderIdOrder,        
        del,
        insert,
    }
}