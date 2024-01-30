const express = require('express');

const respuesta = require('../../red/respuestas')
const controller = require('./index');


const router = express.Router();

router.get('/', detailEmployed);
router.get('/:id', detailEmployedId);
router.put('/', del);
router.post('/', insert);

async function detailEmployed(req, res, next){
    try{
        const items =  await controller.detailEmployed()
        respuesta.success(req, res, items , 200)
    } catch(err){
        next(err);
    }
};

async function detailEmployedId(req, res, next){
    try {
        const items =  await controller.detailEmployedId(req.params.id)
        respuesta.success(req, res, items , 200)
    } catch (err) {
        next(err);
    }
};

async function del(req, res, next){
    try {
        const items =  await controller.del(req.body)
        respuesta.success(req, res, 'Empleado eliminado correctamente' , 200)
    } catch (err) {
        next(err);
    }
};

async function insert(req, res, next){
    try {
        const items =  await controller.insert(req.body)
        if(req.body.id == 0){
            mensaje = 'Empleado guardado con éxito'
        }else{
            mensaje = 'Empleado actualizado con éxito'
        }
        respuesta.success(req, res, mensaje , 201)
    } catch (err) {
        next(err);
    }
};

module.exports = router;