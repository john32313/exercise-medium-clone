const express = require("express");
const connection = require("../db");
const router = express.Router();

router.get("/", (req, res) => {
  connection.query("SELECT * FROM article", (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message, sql: err.sql });
    }
    return res.status(200).json(result);
  });
});

router.get("/:slug", async (req, res) => {
  const { slug } = req.params;
  console.log(slug);
  connection.query(
    "SELECT * FROM article WHERE slug_article = ?",
    [slug],
    (err, result) => {
      if (err) {
        return res.status(500).json({ error: err.message, sql: err.sql });
      }
      if (result.length === 0) {
        return res.status(404).json({ message: "Article not found" });
      }
      return res.status(200).json({ result });
    }
  );
});

module.exports = router;
