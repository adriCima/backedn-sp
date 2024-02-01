const express = require('express');

const respuesta = require('../../red/respuestas')
const controller = require('./index');


const router = express.Router(); 

router.get('/', detailOrdersAll);
router.get('/countorders', countOrders);
router.get('/pendingdelivery', detailOrdersPendingDelivery);
router.get('/status/:id', detailOrdersStatus);
router.get('/statusPay/:id', detailOrdersStatusPay);
router.get('/:id', detailOrdersId);
router.put('/', del);
router.post('/', insert);

async function detailOrdersAll(req, res, next){
    try{
        const items =  await controller.detailOrdersAll()
        respuesta.success(req, res, items , 200)
    } catch(err){
        next(err);
    }
};

async function countOrders(req, res, next){
    try{
        const data =  await controller.countOrders()
        respuesta.success(req, res, data , 200)
    } catch(err){
        next(err);
    }
};

async function detailOrdersPendingDelivery(req, res, next){
    try{
        const items =  await controller.detailOrdersPendingDelivery()
        respuesta.success(req, res, items , 200)
    } catch(err){
        next(err);
    }
};

async function detailOrdersStatus(req, res, next){
    try {
        const items =  await controller.detailOrdersStatus(req.params.id)
        respuesta.success(req, res, items , 200)
    } catch (err) {
        next(err);
    }
};

async function detailOrdersStatusPay(req, res, next){
    try {
        const items =  await controller.detailOrdersStatusPay(req.params.id)
        respuesta.success(req, res, items , 200)
    } catch (err) {
        next(err);
    }
};

async function detailOrdersId(req, res, next){
    try {
        const items =  await controller.detailOrdersId(req.params.id)
        respuesta.success(req, res, items , 200)
    } catch (err) {
        next(err);
    }
};

async function del(req, res, next){
    try {
        const items =  await controller.del(req.body)
        respuesta.success(req, res, 'Orden eliminada correctamente' , 200)
    } catch (err) {
        next(err);
    }
};

async function insert(req, res, next){
    try {
        const items =  await controller.insert(req.body)
        if(req.body.id == 0){
            mensaje = 'Orden guardada con éxito'
        }else{
            mensaje = 'Orden actualizada con éxito'
        }
        respuesta.success(req, res, mensaje , 201)
    } catch (err) {
        next(err);
    }
};

module.exports = router;