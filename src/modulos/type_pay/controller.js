const TABLA = 'type_pay'

module.exports = function(dbInyectada){

    let db = dbInyectada;

    if(!db){
        db = require('../../database/mysql.js')
    }
    
    function all() {
        return db.all(TABLA)
    }

     function unique(id){
        return db.unique(TABLA, id)
    }

    function del(body){
        return db.del(TABLA, body)
    }

    function insert(body){
        return db.insert(TABLA, body)
    }

    return{
        all,
        unique,
        del,
        insert,
    }
}