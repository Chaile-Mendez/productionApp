const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const app = express();
const mysql = require("mysql");

app.use(cors());
app.use(express.json());
app.use(bodyParser.urlencoded({ extended: true }));

const db = mysql.createPool({
  host: "127.0.0.1",
  user: "root",
  password: "root",
  database: "lsg",
});

//Create production Order
app.post("/api/retail/createOrder", (req, res) => {
  const productId = req.body.productId;
  const quantity = req.body.quantity;
  const purchaseOrderId = req.body.purchaseOrderId;
  const batch = req.body.batch;

  const sqlInsert =
    "INSERT INTO productionOrders (productId, quantity, purchaseOrderId, batch) VALUES (?,?,?,?)";

  db.query(
    sqlInsert,
    [productId, quantity, purchaseOrderId, batch],
    (err, result) => {
      console.log(sqlInsert);
      console.log(result);
    }
  );
});

app.get("/api/retail/productionOrders/byPurchaseOrder/:id", (req, res) => {
  const id = req.params.id;

  const sqlInsert = `
  SELECT 
  productionOrders.*,
  purchaseOrderItems.id,
  purchaseOrderItems.purchaseOrderId,
  purchaseOrders.id as poID,
  products.name as name,
  products.shortName as shortName

  FROM productionOrders
  LEFT JOIN purchaseOrderItems

  ON productionOrders.purchaseOrderItemId = purchaseOrderItems.id

  LEFT JOIN purchaseOrders
  ON purchaseOrderItems.purchaseOrderId = purchaseOrders.id

  LEFT JOIN products
  ON productionOrders.productId = products.id
 
  HAVING purchaseOrders.id = ?;`;

  db.query(sqlInsert, id, (err, result) => {
    res.send(result);
  });
});

app.get("/api/retail/purchaseOrders/byDate/:date", (req, res) => {
  const date = req.params.date;
  const sqlInsert = `
  SELECT purchaseOrders.*, clients.name as clientName
  FROM purchaseOrders
  JOIN clients
  ON purchaseOrders.clientId = clients.id
  HAVING deliveryDate = ?`;

  db.query(sqlInsert, date, (err, result) => {
    res.send(result);
    if (err) console.log(err);
  });
});

app.get("/api/retail/getProductsList", (req, res) => {
  const sqlInsert = "SELECT productId, productName FROM products LIMIT 99";

  db.query(sqlInsert, (err, result) => {
    res.send(result);
  });
});

app.get("/api/retail/getProductionOrderBy/id/:id", (req, res) => {
  const id = req.params.id;

  const sqlInsert = `SELECT
    productionOrders.productionOrderId,
    products.productId,
    products.productName,
    products.productShortName,
    productionOrders.quantity,
    productionOrders.batch,
    productionOrders.purchaseOrderId
    FROM productionOrders
    INNER JOIN
    products ON
    productionOrders.productId = products.productId
    
    HAVING 
    productionOrders.productionOrderId = ?
    `;

  db.query(sqlInsert, id, (err, result) => {
    res.send(result);
  });
});

app.get("/api/retail/getProductionOrdersBy/batch/:batch", (req, res) => {
  const batch = req.params.batch;

  const sqlInsert = `SELECT
    productionOrders.productionOrderId,
    products.productId,
    products.productName,
    products.productShortName,
    productionOrders.quantity,
    productionOrders.batch,
    productionOrders.purchaseOrderId
    FROM productionOrders
    INNER JOIN
    products ON
    productionOrders.productId = products.productId
    
    HAVING productionOrders.batch like CONCAT('%',?,'%') LIMIT 99
    `;

  db.query(sqlInsert, batch, (err, result) => {
    res.send(result);
  });
});

app.put("/api/retail/updateProductionOrdersBy/id/:id", (req, res) => {
  const productId = req.body.productId;
  const quantity = req.body.quantity;
  const batch = req.body.batch;
  const purchaseOrderId = req.body.purchaseOrderId;
  const id = req.params.id;
  values = [productId, quantity, batch, purchaseOrderId, id];
  const sqlInsert = `UPDATE productionOrders
    SET
      productId = ?,
      quantity = ?,
      batch = ?,
      purchaseOrderId = ?

    WHERE productionOrderId = ?
    ;`;

  db.query(
    sqlInsert,
    [productId, quantity, batch, purchaseOrderId, id],
    (err, result) => {
      res.send(result);
    }
  );
});

app.put("/api/update/:id", (req, res) => {
  const name = req.body.name;
  const review = req.body.review;
  const id = req.params.id;

  const sqlInsert =
    "UPDATE movie_reviews SET (movieName = ?, movieReview = ?) where id = ?";

  db.query(sqlInsert, [name, review, id], (err, result) => {
    //if(err) console.log(err)
    console.log([name, review, id]);
  });
});

app.get("/api/retail/getAllProducts", (req, res) => {
  const sqlInsert = `
  SELECT *
  FROM
  products
  ;`;
  console.log("req");
  db.query(sqlInsert, (err, result) => {
    if (err) console.log(err);

    res.send(result);
  });
});

app.get("/api/retail/getProcess/:id", (req, res) => {
  id = req.params.id;
  const sqlInsert = `
  SELECT *
  FROM
  process
  WHERE
  productId = ?
  ;`;

  db.query(sqlInsert, id, (err, result) => {
    if (err) console.log(err);
    console.log("test", result);
    res.send(result);
  });
});

app.get("/api/retail/getProductionBy/batchs/", (req, res) => {
  const id = req.headers.productid;
  const iBatchYear = req.headers.ibatchyear;
  const iBatchDay = req.headers.ibatchday;
  const fBatchYear = req.headers.fbatchyear;
  const fBatchDay = req.headers.fbatchday;

  const sqlInsert = `
  SELECT 
  productionOrderId, productionOrders.productId, quantity,purchaseOrderId, batch, batchYear, batchDay, productName, productShortName

  FROM productionOrders 
  LEFT JOIN products
  ON
  productionOrders.productId = products.productId

  HAVING batchYear BETWEEN ? and ? AND 
  batchDay between ? and ? AND 
  productId = ?


  ;`;

  db.query(
    sqlInsert,
    [iBatchYear, fBatchYear, iBatchDay, fBatchDay, id],
    (err, result) => {
      if (err) console.log(err);
      res.send(result);
    }
  );
});

app.delete("/api/delete/:id", (req, res) => {
  const id = req.params.id;

  const sqlInsert = "DELETE FROM movie_reviews WHERE idReview = ?;";
  db.query(sqlInsert, id, (err, resp) => {
    if (err) console.log(err);
  });
});

app.get("/", (req, res) => {
  res.send("Server is running: ByJuan");
});

app.listen(3001, () => {
  //console.log("Corriendo en puerto 3001");
});
