const TABLA = 'employed'

module.exports = function(dbInyectada){

    let db = dbInyectada;

    if(!db){
        db = require('../../database/mysql.js')
    }
    
    function all() {
        return db.all(TABLA)
    }

    function detailEmployed(){
        return db.detailEmployed(TABLA)
    }

    function detailEmployedId(id){
        return db.detailEmployedId(TABLA, id)
    }

    function del(body){
        return db.del(TABLA, body)
    }

    function insert(body){
        return db.insert(TABLA, body)
    }

    return{
        all,
        detailEmployed,
        detailEmployedId,
        del,
        insert,
    }
}