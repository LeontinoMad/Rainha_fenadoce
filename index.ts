import express from "express";
const app = express();
// const port = 3000;
const port = process.env.PORT ?? 3000;

import candidataRoutes from "./routes/candidata";
import clienteRoutes from "./routes/cliente";
import votoRoutes from "./routes/voto";

app.use(express.json());
app.use("/candidatas", candidataRoutes);
app.use("/clientes", clienteRoutes);
app.use("/votos", votoRoutes);

app.get("/", (req, res) => {
  res.send("API Fenadoce");
});

app.listen(port, () => {
  console.log(`Rodando na porta ${port}`);
});
