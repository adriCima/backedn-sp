const express = require('express');
const morgan = require('morgan');
const config = require('./config.js');

const products = require('./modulos/products/routes.js');
const users = require('./modulos/users/routes.js');
const error = require('./red/errors')

const app = express();

// Middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: true}))

// Config
app.set('port', config.app.port)

// Rutas
app.use('/api/products', products)
app.use('/api/users', users)
app.use(error);

module.exports = app;