const express = require('express');

const respuesta = require('../../red/respuestas')
const controller = require('./index');


const router = express.Router();

router.get('/', detailProducts);
router.get('/:id', detailProductsId);
router.put('/', del);
router.post('/', insert);

async function detailProducts(req, res, next){
    try{
        const items =  await controller.detailProducts()
        respuesta.success(req, res, items , 200)
    } catch(err){
        next(err);
    }
};

async function detailProductsId(req, res, next){
    try {
        const items =  await controller.detailProductsId(req.params.id)
        respuesta.success(req, res, items , 200)
    } catch (err) {
        next(err);
    }
};

async function del(req, res, next){
    try {
        const items =  await controller.del(req.body)
        respuesta.success(req, res, 'Producto eliminado correctamente' , 200)
    } catch (err) {
        next(err);
    }
};

async function insert(req, res, next){
    try {
        const items =  await controller.insert(req.body)
        if(req.body.id == 0){
            mensaje = 'Producto guardado con éxito'
        }else{
            mensaje = 'Producto actualizado con éxito'
        }
        respuesta.success(req, res, mensaje , 201)
    } catch (err) {
        next(err);
    }
};

module.exports = router;