const express = require('express');

const respuesta = require('../../red/respuestas')
const controller = require('./index');


const router = express.Router();

router.get('/', detailCustomers);
router.get('/:id', detailCustomersId);
router.put('/', del);
router.post('/', insert);

async function detailCustomers(req, res, next){
    try{
        const items =  await controller.detailCustomers()
        respuesta.success(req, res, items , 200)
    } catch(err){
        next(err);
    }
};

async function detailCustomersId(req, res, next){
    try {
        const items =  await controller.detailCustomersId(req.params.id)
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