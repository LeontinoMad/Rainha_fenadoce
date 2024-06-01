import { PrismaClient } from "@prisma/client";
import { Router } from "express";

export const prisma = new PrismaClient();
export const router = Router();

router.get("/", async (req, res) => {
  try {
    const clientes = await prisma.cliente.findMany();
    res.status(200).json(clientes);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.post("/", async (req, res) => {
  const { nome, email, data_nasc, cidade } = req.body;

  if (!nome || !email || !data_nasc || !cidade) {
    res.status(400).json({ erro: "Informe nome,email, data_nasc e cidade" });
    return;
  }

  try {
    const clientes = await prisma.cliente.create({
      data: { nome, email, data_nasc: new Date(data_nasc), cidade },
    });
    res.status(201).json(clientes);
  } catch (error) {
    res.status(400).json(error);
  }
});

export default router;
