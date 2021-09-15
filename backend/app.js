const express = require('express');

const mongoose = require('mongoose');

const app = express();

const bodyParser = require('body-parser');

require('dotenv/config');

app.use(bodyParser.json());

// Import Routes
const postRoute = require('./routes/posts');

app.use('/api/posts', postRoute);

// Connect to database
mongoose.connect(process.env.DB_CONNECTION, () => {
    console.log('Connected to DB');
});

// ENVIRONMENT PORT
const port = process.env.PORT || 3000;
app.listen(port, () => console.log(`Listening on port ${port}...`));