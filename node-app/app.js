const express = require('express')

const app = express()
app.use((req,res,next) => {
  res.status(200).send({
    message: 'Olaaaa'
  })
})

module.exports = app;
// server.listen(port, () => {
//   console.log(`Server running at http://localhost:${port}/`);
// });