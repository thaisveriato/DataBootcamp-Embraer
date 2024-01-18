CREATE TABLE `t1_pedidos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_original` longtext,
  `id_produto` longtext,
  `id_cliente` longtext,
  `id_funcionario` longtext,
  `quantidade` double DEFAULT NULL,
  `valor_unitario` double DEFAULT NULL,
  `pedido_realizado` date DEFAULT NULL,
  `pedido_aprovado` date DEFAULT NULL,
  `pedido_separacao` date DEFAULT NULL,
  `pedido_faturado` date DEFAULT NULL,
  `pedido_coletado` date DEFAULT NULL,
  `previsao_entrega` date DEFAULT NULL,
  `entrega_realizada` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=713 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t2_leadtime` (
  `processo` text,
  `tempo_dias` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t3_transittime` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Cidade` longtext,
  `UF` longtext,
  `Regiao` longtext,
  `metrica_tempo` int DEFAULT NULL,
  `Ponto_Saida` longtext,
  `Ponto_A` longtext,
  `Ponto_B` longtext,
  `Ponto_C` longtext,
  `Ponto_D` longtext,
  `Ponto_Chegada` longtext,
  `info_parada` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE `t4_produtos` (
  `id_produto` text,
  `descricao_produto` text,
  `quantidade_estoque` double DEFAULT NULL,
  `preco_custo_unitario` double DEFAULT NULL,
  `preco_venda_unitario` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t5_clientes` (
  `cliente_cnpj` text,
  `cliente_codigo` text,
  `cliente_nome` text,
  `cliente_cidade` text,
  `cliente_uf` text,
  `cliente_regiao` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t6_vendedores` (
  `id_funcionario` text,
  `nome_funcionario` text,
  `unidade_funcionario` text,
  `email_funcionario` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t7_ocorrencias` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pedido` double DEFAULT NULL,
  `id_cliente` longtext,
  `cidade_ocorrencia` longtext,
  `id_produto` longtext,
  `descricao_negocio` longtext,
  `area_responsavel_ocorrencia` longtext,
  `tipo_responsavel` longtext,
  `descricao_ocorrencia` longtext,
  `data_ocorrencia` date DEFAULT NULL,
  `responsavel_ocorrencia` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `t8_deslocamento` (
  `id` int NOT NULL DEFAULT '0',
  `id_original` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cliente_codigo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `cliente_cidade` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_produto` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `quantidade` double DEFAULT NULL,
  `Ponto_Saida` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Ponto_A` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Ponto_B` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Ponto_C` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Ponto_D` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `Ponto_Chegada` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `andamento_pedido` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `Data_A` date DEFAULT NULL,
  `Data_B` date DEFAULT NULL,
  `Data_C` date DEFAULT NULL,
  `Data_D` date DEFAULT NULL,
  `Data_Final` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
