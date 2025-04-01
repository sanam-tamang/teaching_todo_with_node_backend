

const bodyParser = require('body-parser');
const express = require('express');
const userRouter = require('./user');

const app = express();
const port = 3000;

app.use(express.json())
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));

app.use(userRouter);
app.listen(port, () => {
    console.log(`app listening on port ${port}`);
});