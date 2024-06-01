-- CreateTable
CREATE TABLE "candidatas" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(100) NOT NULL,
    "clube" VARCHAR(30) NOT NULL,
    "idade" SMALLINT NOT NULL,
    "sonho" VARCHAR(100) NOT NULL,
    "n_votos" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "candidatas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "clientes" (
    "id" SERIAL NOT NULL,
    "nome" VARCHAR(30) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "data_nasc" TIMESTAMP(3) NOT NULL,
    "cidade" VARCHAR(30) NOT NULL,

    CONSTRAINT "clientes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "votos" (
    "id" SERIAL NOT NULL,
    "data" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "justificativa" VARCHAR(200),
    "candidataId" INTEGER NOT NULL,
    "clienteId" INTEGER NOT NULL,

    CONSTRAINT "votos_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "votos" ADD CONSTRAINT "votos_candidataId_fkey" FOREIGN KEY ("candidataId") REFERENCES "candidatas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "votos" ADD CONSTRAINT "votos_clienteId_fkey" FOREIGN KEY ("clienteId") REFERENCES "clientes"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
