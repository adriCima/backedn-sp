const express = require('express');

const respuesta = require('../../red/respuestas')
const controller = require('./index');


const router = express.Router();

router.get('/', all);
router.get('/:id', unique);
router.put('/', del);
router.post('/', insert);

async function all(req, res, next){
    try{
        const items =  await controller.all()
        respuesta.success(req, res, items , 200)
    } catch(err){
        next(err);
    }
};

async function unique(req, res, next){
    try {
        const items =  await controller.unique(req.params.id)
        respuesta.success(req, res, items , 200)
    } catch (err) {
        next(err);
    }
};

async function del(req, res, next){
    try {
        const items =  await controller.del(req.body)
        respuesta.success(req, res, 'peso eliminado correctamente' , 200)
    } catch (err) {
        next(err);
    }
};

async function insert(req, res, next){
    try {
        const items =  await controller.insert(req.body)
        if(req.body.id == 0){
            mensaje = 'Peso guardado con éxito'
        }else{
            mensaje = 'Peso actualizado con éxito'
        }
        respuesta.success(req, res, mensaje , 201)
    } catch (err) {
        next(err);
    }
};

module.exports = router;