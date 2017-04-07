const express = require('express')
const app = express()

app.get('/', (req, res, next) => {
  res.json({
    success: true
  })
})

app.listen(3000, () => {
  console.log('running on port 3000')
})
