import { PrismaClient } from "@prisma/client";
import { Router } from "express";

export const prisma = new PrismaClient();
export const router = Router();

router.get("/", async (req, res) => {
  try {
    const votos = await prisma.voto.findMany({
      include: {
        candidata: true,
        cliente: true,
      },
    });
    res.status(200).json(votos);
  } catch (error) {
    res.status(400).json(error);
  }
});

router.post("/", async (req, res) => {
  const { candidataId, clienteId, justificativa } = req.body;

  if (!candidataId || !clienteId) {
    res
      .status(400)
      .json({ erro: "Informe o Id da candidata e o Id do cliente" });
    return;
  }

  try {
    const [voto, candidata] = await prisma.$transaction([
      prisma.voto.create({ data: { candidataId, clienteId, justificativa } }),
      prisma.candidata.update({
        where: { id: candidataId },
        data: { n_votos: { increment: 1 } },
      }),
    ]);
    res.status(201).json();
  } catch (error) {
    res.status(400).json(error);
  }
});

export default router;
