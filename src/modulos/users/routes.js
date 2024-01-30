const express = require('express');

const respuesta = require('../../red/respuestas')
const controller = require('./index');


const router = express.Router();

router.get('/', detailUsers);
router.get('/:id', detailUsersId);
router.put('/', del);
router.post('/', insert);

async function detailUsers(req, res, next){
    try{
        const items =  await controller.detailUsers()
        respuesta.success(req, res, items , 200)
    } catch(err){
        next(err);
    }
};

async function detailUsersId(req, res, next){
    try {
        const items =  await controller.detailUsersId(req.params.id)
        respuesta.success(req, res, items , 200)
    } catch (err) {
        next(err);
    }
};

async function del(req, res, next){
    try {
        const items =  await controller.del(req.body)
        respuesta.success(req, res, 'usuario eliminado correctamente' , 200)
    } catch (err) {
        next(err);
    }
};

async function insert(req, res, next){
    try {
        const items =  await controller.insert(req.body)
        if(req.body.id == 0){
            mensaje = 'Usuario guardado con éxito'
        }else{
            mensaje = 'Usuario actualizado con éxito'
        }
        respuesta.success(req, res, mensaje , 201)
    } catch (err) {
        next(err);
    }
};

module.exports = router;