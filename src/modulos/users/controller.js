const TABLA = 'users'

module.exports = function(dbInyectada){

    let db = dbInyectada;

    if(!db){
        db = require('../../database/mysql.js')
    }
    
    function all() {
        return db.all(TABLA)
    }

    function detailUsers(){
        return db.detailUsers(TABLA)
    }

    function detailUsersId(id){
        return db.detailUsersId(TABLA, id)
    }

    function del(body){
        return db.del(TABLA, body)
    }

    function insert(body){
        return db.insert(TABLA, body)
    }

    return{
        all,
        detailUsers,
        detailUsersId,
        del,
        insert,
    }
}