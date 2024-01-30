const app = require('./app.js');

app.listen(app.get('port'), () => {
    console.log('Server running on Port: ', app.get('port'));
});
