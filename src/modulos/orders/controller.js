const TABLA = 'orders'

module.exports = function(dbInyectada){

    let db = dbInyectada;

    if(!db){
        db = require('../../database/mysql.js')
    }
     
    
    function detailOrdersAll(){
        return db.detailOrdersAll(TABLA) 
    }

    function countOrders(){
        return db.countOrders(TABLA)
    }

    function detailOrdersPendingDelivery(){
        return db.detailOrdersPendingDelivery(TABLA)
    }

    function detailOrdersStatus(id){
        return db.detailOrdersStatus(TABLA, id)
    }

    function detailOrdersStatusPay(id){
        return db.detailOrdersStatusPay(TABLA, id)
    }

    function detailOrdersId(id){
        return db.detailOrdersId(TABLA, id)
    }

    function del(body){
        return db.del(TABLA, body)
    }

    function insert(body){
        return db.insert(TABLA, body)
    }

    return{
        detailOrdersAll,
        detailOrdersPendingDelivery,
        detailOrdersStatus,
        detailOrdersStatusPay,
        detailOrdersId,
        del,
        insert,
        countOrders,
    }
}