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
        ` INNER JOIN type_users ON users.id_type = type_users.id ORDER BY users.id WHERE users.id = ${id}`, (error, result) =>{
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
}