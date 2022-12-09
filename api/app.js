const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send({ message: "Hello from Jarno's node.js API :)" });
});

app.get('/programming', (req, res) => {
  var languages = [
    'Java',
    'Python',
    'C#',
    'C++',
    'Html',
    'CSS',
    'JavaScript',
    'Kotlin',
  ];
  res.send({ message: languages });
});

app.listen(3000, () => {
  console.log('API listening on port 3000');
});
