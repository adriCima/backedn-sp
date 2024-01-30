const express = require('express');
const morgan = require('morgan');
const config = require('./config.js');

const users = require('./modulos/users/routes.js');
const orders = require('./modulos/orders/routes.js');
const weight = require('./modulos/weight/routes.js');
const branchs = require('./modulos/branchs/routes.js');
const employed = require('./modulos/employed/routes.js');
const position = require('./modulos/position/routes.js');
const products = require('./modulos/products/routes.js');
const type_pay = require('./modulos/type_pay/routes.js');
const category = require('./modulos/category/routes.js');
const customers = require('./modulos/customers/routes.js');
const status_pay = require('./modulos/statuspay/routes.js');
const type_users = require('./modulos/type_users/routes.js');
const adress_type = require('./modulos/adresstype/routes.js');
const subcategory = require('./modulos/subcategory/routes.js');
const order_status = require('./modulos/orderstatus/routes.js');
const order_detail = require('./modulos/order_detail/routes.js');
const order_market = require('./modulos/order_market/routes.js');
const shipping_type = require('./modulos/shipping_type/routes.js');
const customers_adress = require('./modulos/customersadress/routes.js');

const error = require('./red/errors');

const app = express();

// Middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true}))

// Config
app.set('port', config.app.port)

// Rutas
app.use('/api/users', users)
app.use('/api/weight', weight)
app.use('/api/orders', orders)
app.use('/api/branchs', branchs)
app.use('/api/products', products)
app.use('/api/category', category)
app.use('/api/position', position)
app.use('/api/employed', employed)
app.use('/api/type_pay', type_pay)
app.use('/api/customers', customers)
app.use('/api/type_users', type_users)
app.use('/api/status_pay', status_pay)
app.use('/api/subcategory', subcategory)
app.use('/api/adress_type', adress_type)
app.use('/api/orderstatus', order_status)
app.use('/api/order_detail', order_detail)
app.use('/api/order_market', order_market)
app.use('/api/shipping_type', shipping_type)
app.use('/api/customers_adress', customers_adress)


app.use(error);

module.exports = app;