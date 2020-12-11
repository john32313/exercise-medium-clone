require("dotenv").config();
const express = require("express");
const app = express();

const article = require("./routes/article");

const port = process.env.PORT || 3000;

app.use("/article", article);

app.listen(port, (err) => {
  if (err) {
    throw new Error(`Something bad happened : ${err.message}`);
  }
  console.warn(`Server listening on port ${port}`);
});
