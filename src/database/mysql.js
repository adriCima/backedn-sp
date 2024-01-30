const myslq = require(`mysql`);
const config = require(`../config.js`);

const dbconfig = {
    host: config.mysql.host,
    user: config.mysql.user,
    password : config.mysql.password,
    database : config.mysql.database
}

let conexion;

function connMysql(){
    conexion = myslq.createConnection(dbconfig);

    conexion.connect((err) => {
        if (err) {
            console.log(`[db error]`, err);
            setTimeout(connMysql, 200)
        } else {
            console.log(`DataBase Conected !!`);
        }
    });

    conexion.on(`error` , err => {
        console.log(`[db error]`, err);
        if (err.code === `PROTOCOL_CONNECTION_LOST`) {
            connMysql();
        } else {
            throw err;
        }
    })
}

connMysql();

// TABLAS GENÉRICAS PARA TABLAS SENCILLAS Y DE COFIGURACIÓN

// Genérico para mostrar tablas sencillas
function all(table) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT * FROM ${table}`, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// Genérico para mostrar un solo item 
function unique(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT * FROM  ${table}`+
        ` WHERE id = ${id}` , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// Genérico para insertar o actualizar datos a una tabla
function insert(table, data) {
    if(data && data.id == 0){
        return registrar(table, data);
    }else{
        return actualizar(table, data)
    }
}

// Funcion para registrar 
function registrar(table, data) {
    return new Promise (( resolve, reject) => {
        conexion.query(`INSERT INTO ${table} SET ?`, data,  (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// Funcion para actualizar 
function actualizar(table, data) {
    return new Promise (( resolve, reject) => {
        conexion.query(`UPDATE ${table} SET ? WHERE id = ?`, [data, data.id] , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// Genérico para eliminar datos de una tabla
function del(table, data) {
    return new Promise (( resolve, reject) => {
        conexion.query(`DELETE FROM ${table} WHERE id = ?`, data.id,  (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });  
}

// TABLA PRODUCTOS(products) join peso, categoria => se aumentará la lógica para mostrar también la subcategoria 
function detailProducts(table) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT products.id, products.sku, products.category, products.description,`+
        ` products.buy_price, products.sale_price, products.stock, products.min_stock,`+
        ` products.id_category,  products.id_subcategory, products.id_weight, products.image,`+
        ` category.category As des_category, weight.weight AS des_weight`+
        ` FROM ${table}`+
        ` INNER JOIN category ON products.id_category = category.id`+
        ` INNER JOIN weight ON products.id_weight = weight.id`+
        ` ORDER BY id DESC LIMIT 10`, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}


// TABLA PRODUCTOS por id (products) join peso, categoria => se aumentará la lógica para mostrar también la subcategoria 
function detailProductsId(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT products.id, products.sku, products.category, products.description,`+
        ` products.buy_price, products.sale_price, products.stock, products.min_stock,`+
        ` products.id_category,  products.id_subcategory, products.id_weight, products.image,`+
        ` category.category As des_category, weight.weight AS des_weight`+
        ` FROM ${table}`+
        ` INNER JOIN category ON products.id_category = category.id`+
        ` INNER JOIN weight ON products.id_weight = weight.id`+
        ` WHERE products.id = ${id}` , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// TABLA USUARIOS(users) join peso, type_user
function detailUsers(table) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT users.id, users.name, users.lastname, users.correo, type_users.type`+
        ` FROM ${table}` +
        ` INNER JOIN type_users ON users.id_type = type_users.id ORDER BY users.id DESC LIMIT 10`, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// TABLA USUARIOS por id(users) join peso, type_user
function detailUsersId(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT users.id, users.name, users.lastname, users.correo, type_users.type`+
        ` FROM ${table}` +
        ` INNER JOIN type_users ON users.id_type = type_users.id WHERE users.id = ${id}`, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// TABLA ORDENES(orders) join branch, status, status_pay  COMPLETAS => USO GENERAL
function detailOrdersAll(table) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT o.id_notaventa, o.id_customer, o.total_products, o.total_order, o.id_branch,`+
        ` b.nombre_sucursal, os.status, sp.status_pay`+
        ` FROM ${table} o`+
        ` INNER JOIN branchs b ON o.id_branch = b.id`+
        ` INNER JOIN orders_status os ON o.status = os.id`+
        ` INNER JOIN status_pay sp ON o.status_pay = sp.id`, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// TABLA ORDENES por id(orders) join branch, status, status_pay 
function detailOrdersId(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT o.id, o.id_customer, o.total_products, o.total_order, o.id_branch,`+
        ` b.nombre_sucursal, os.status, sp.status_pay`+
        ` FROM ${table} o`+
        ` INNER JOIN branchs b ON o.id_branch = b.id`+
        ` INNER JOIN orders_status os ON o.status = os.id`+
        ` INNER JOIN status_pay sp ON o.status_pay = sp.id`+
        ` WHERE o.id = ${id}` , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// TABLA ORDENES(orders) join branch, status, status_pay PARA USO ADMINISTRATIVO
function detailOrdersPendingDelivery(table) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT o.id_notaventa, o.id_customer, o.total_products, o.total_order, o.id_branch,`+
        ` b.nombre_sucursal, os.status, sp.status_pay`+
        ` FROM ${table} o`+
        ` INNER JOIN branchs b ON o.id_branch = b.id`+
        ` INNER JOIN orders_status os ON o.status = os.id`+
        ` INNER JOIN status_pay sp ON o.status_pay = sp.id`+
        ` WHERE o.status <> 4` , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// TABLA ORDENES(orders) join branch, status, status_pay DE ACUERDO AL ESTADO DEL PEDIDO
function detailOrdersStatus(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT o.id_notaventa, o.id_customer, o.total_products, o.total_order, o.id_branch,`+
        ` b.nombre_sucursal, os.status, sp.status_pay`+
        ` FROM ${table} o`+
        ` INNER JOIN branchs b ON o.id_branch = b.id`+
        ` INNER JOIN orders_status os ON o.status = os.id`+
        ` INNER JOIN status_pay sp ON o.status_pay = sp.id`+
        ` WHERE o.status = ${id}` , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

// TABLA ORDENES(orders) join branch, status, status_pay DE ACUERDO AL ESTADO DEL PAGO
function detailOrdersStatusPay(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT o.id_notaventa, o.id_customer, o.total_products, o.total_order, o.id_branch,`+
        ` b.nombre_sucursal, os.status, sp.status_pay`+
        ` FROM ${table} o`+
        ` INNER JOIN branchs b ON o.id_branch = b.id`+
        ` INNER JOIN orders_status os ON o.status = os.id`+
        ` INNER JOIN status_pay sp ON o.status_pay = sp.id`+
        ` WHERE o.status_pay = ${id}` , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}


// TABLA DIRECCIONES CLIENTES(customers_adress) join adress_type
function detailCustomers(table) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT cs.id, cs.id_customer, cs.zona, cs.adress, cs.referencia, adt.adress_type`+
        ` FROM ${table} cs` + 
        ` INNER JOIN adress_type adt ON cs.id_adress_type = adt.id`, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}


// TABLA DIRECCIONES CLIENTES por ID (customers_adress) join adress_type
function detailCustomersId(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT cs.id_customer, cs.zona, cs.adress, cs.referencia, adt.adress_type`+
        ` FROM ${table} cs` + 
        ` INNER JOIN adress_type adt ON cs.id_adress_type = adt.id`+
        ` WHERE cs.id = ${id}` , (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}


// TABLA EMPLEADOS (employed) join CARGO(position) TIPO DE USUARIO(user_type)
function detailEmployed(table) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT e.id, e.id_user, e.email, e.email, e.phone, e.adress,`+
        ` tu.type, p.position`+
        ` FROM ${table} e`+
        ` INNER JOIN type_users tu ON e.id_type_user = tu.id`+
        ` INNER JOIN position p ON e.id_position = p.id `, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}


// TABLA EMPLEADOS por ID (employed) join CARGO(position) TIPO DE USUARIO(user_type)
function detailEmployedId(table, id) {
    return new Promise (( resolve, reject) => {
        conexion.query(`SELECT e.id, e.id_user, e.email, e.email, e.phone, e.adress,`+
        ` tu.type, p.position`+
        ` FROM ${table} e`+
        ` INNER JOIN type_users tu ON e.id_type_user = tu.id`+
        ` INNER JOIN position p ON e.id_position = p.id`+
        ` WHERE e.id = ${id}`, (error, result) =>{
            return error ? reject(error) : resolve(result);
        })
    });
}

module.exports = {
    all,
    unique,
    insert,
    del,
    detailProducts,
    detailProductsId,
    detailUsers,
    detailUsersId,
    detailOrdersAll,
    detailOrdersPendingDelivery,
    detailOrdersStatus,
    detailOrdersStatusPay,
    detailOrdersId,
    detailCustomers,
    detailCustomersId,
    detailEmployed,
    detailEmployedId,
}