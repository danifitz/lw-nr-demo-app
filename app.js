var newrelic = require('newrelic');
const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('Hello World!')
})

function randomIntFromInterval(min, max) { // min and max included 
  return Math.floor(Math.random() * (max - min + 1) + min)
}

app.get('/hello', (req, res) => {
    console.log(req.query);
    if(req.query.sleep == 1) {
        setTimeout(function() {
            res.send('Hello')
        }, randomIntFromInterval(2000, 3000));
    } else {
      setTimeout(function() {
        res.send('Hello')
    }, randomIntFromInterval(20, 25));
    }
});

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})