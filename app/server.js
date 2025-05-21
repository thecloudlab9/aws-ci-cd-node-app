const express = require("express");
const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Node.js app deployed via CI/CD on AWS!");
});

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}`);
});