const TABLA = 'auth'

module.exports = function(dbInyectada){

    let db = dbInyectada;

    if(!db){
        db = require('../../database/mysql.js')
    }
    
    function insert(data){

        const authData = {
            id: data.id,
        }

        if(data.username){
            authData.username = data.username
        }

        if(data.password){
            authData.password = data.password
        }

        return db.insert(TABLA, authData)
    }

    return{
        insert,
    }
}