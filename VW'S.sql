CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `vw_andamento_pedido` AS
    SELECT 
        `TABELA_01`.`id` AS `id`,
        `TABELA_01`.`id_original` AS `id_original`,
        `TABELA_01`.`id_produto` AS `id_produto`,
        `TABELA_01`.`id_cliente` AS `id_cliente`,
        `TABELA_01`.`pedido_realizado` AS `pedido_realizado`,
        `TABELA_01`.`pedido_aprovado` AS `pedido_aprovado`,
        `TABELA_01`.`pedido_separacao` AS `pedido_separacao`,
        `TABELA_01`.`pedido_faturado` AS `pedido_faturado`,
        `TABELA_01`.`pedido_coletado` AS `pedido_coletado`,
        `TABELA_01`.`entrega_realizada` AS `entrega_realizada`,
        `TABELA_01`.`status` AS `status`,
        `TABELA_01`.`andamento_pedido` AS `andamento_pedido`,
        `TABELA_01`.`cliente_nome` AS `cliente_nome`,
        `TABELA_01`.`descricao_produto` AS `descricao_produto`,
        `TABELA_01`.`nome_funcionario` AS `nome_funcionario`,
        (CASE
            WHEN (`TABELA_01`.`andamento_pedido` = 'Pedido Realizado') THEN 1
            WHEN (`TABELA_01`.`andamento_pedido` = 'Pedido Aprovado') THEN 2
            WHEN (`TABELA_01`.`andamento_pedido` = 'Pedido em Separação') THEN 3
            WHEN (TABELA_01.andamento_pedido = 'Pedido Faturado') THEN 4
            WHEN (TABELA_01.andamento_pedido = 'Pedido Coletado') THEN 5
            WHEN (TABELA_01.andamento_pedido = 'Entrega Realizada') THEN 6
            ELSE 'Aguardando Ação'
        END) AS ordem_page
    FROM
        (SELECT 
            P.id AS id,
                P.id_original AS id_original,
                P.id_produto AS id_produto,
                P.id_cliente AS id_cliente,
                P.pedido_realizado AS pedido_realizado,
                P.pedido_aprovado AS pedido_aprovado,
                P.pedido_separacao AS pedido_separacao,
                P.pedido_faturado AS pedido_faturado,
                P.pedido_coletado AS pedido_coletado,
                P.entrega_realizada AS entrega_realizada,
                VW.status AS status,
                C.cliente_nome AS cliente_nome,
                X.descricao_produto AS descricao_produto,
                V.nome_funcionario AS nome_funcionario,
                (CASE
                    WHEN
                        ((P.pedido_realizado IS NOT NULL)
                            AND (P.pedido_aprovado IS NULL)
                            AND (P.pedido_separacao IS NULL)
                            AND (P.pedido_faturado IS NULL)
                            AND (P.pedido_coletado IS NULL)
                            AND (P.entrega_realizada IS NULL))
                    THEN
                        'Pedido Realizado'
                    WHEN
                        ((P.pedido_aprovado IS NOT NULL)
                            AND (P.pedido_separacao IS NULL)
                            AND (P.pedido_faturado IS NULL)
                            AND (P.pedido_coletado IS NULL)
                            AND (P.entrega_realizada IS NULL))
                    THEN
                        'Pedido Aprovado'
                    WHEN
                        ((P.pedido_separacao IS NOT NULL)
                            AND (P.pedido_faturado IS NULL)
                            AND (P.pedido_coletado IS NULL)
                            AND (P.entrega_realizada IS NULL))
                    THEN
                        'Pedido em Separação'
                    WHEN
                        ((P.pedido_faturado IS NOT NULL)
                            AND (P.pedido_coletado IS NULL)
                            AND (P.entrega_realizada IS NULL))
                    THEN
                        'Pedido Faturado'
                    WHEN
                        ((P.pedido_coletado IS NOT NULL)
                            AND (P.entrega_realizada IS NULL))
                    THEN
                        'Pedido Coletado'
                    WHEN (P.entrega_realizada IS NOT NULL) THEN 'Entrega Realizada'
                    ELSE 'Aguardando Ação'
                END) AS andamento_pedido
        FROM
            ((((t1_pedidos P
        JOIN VW_STATUS_TRANSPORTE VW ON ((P.id_original = VW.id_original)))
        JOIN t5_clientes `C` ON ((P.id_cliente = C.cliente_codigo)))
        JOIN t4_produtos `X` ON ((P.id_produto = X.id_produto)))
        JOIN t6_vendedores `V` ON ((P.id_funcionario = V.id_funcionario)))) TABELA_01
		
		
		
		
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `VW_INFO_WEB` AS select `TABELA_WEB`.`id` AS `id`,`TABELA_WEB`.`id_original` AS `id_original`,`TABELA_WEB`.`cliente_codigo` AS `cliente_codigo`,`TABELA_WEB`.`cliente_cidade` AS `cliente_cidade`,`TABELA_WEB`.`id_produto` AS `id_produto`,`TABELA_WEB`.`quantidade` AS `quantidade`,`TABELA_WEB`.`Ponto_Saida` AS `Ponto_Saida`,`TABELA_WEB`.`Ponto_A` AS `Ponto_A`,`TABELA_WEB`.`Data_A` AS `Data_A`,`TABELA_WEB`.`Ponto_B` AS `Ponto_B`,`TABELA_WEB`.`Data_B` AS `Data_B`,`TABELA_WEB`.`Ponto_C` AS `Ponto_C`,`TABELA_WEB`.`Data_C` AS `Data_C`,`TABELA_WEB`.`Ponto_D` AS `Ponto_D`,`TABELA_WEB`.`Data_D` AS `Data_D`,`TABELA_WEB`.`Ponto_Chegada` AS `Ponto_Chegada`,`TABELA_WEB`.`Data_Final` AS `Data_Final`,`TABELA_WEB`.`andamento_pedido` AS `andamento_pedido`,`TABELA_WEB`.`status` AS `status`,`TABELA_WEB`.`info_parada` AS `info_parada`,`TABELA_WEB`.`Deslocamento` AS `Deslocamento` from (select `D`.`id` AS `id`,`D`.`id_original` AS `id_original`,`D`.`cliente_codigo` AS `cliente_codigo`,`D`.`cliente_cidade` AS `cliente_cidade`,`D`.`id_produto` AS `id_produto`,`D`.`quantidade` AS `quantidade`,`D`.`Ponto_Saida` AS `Ponto_Saida`,`D`.`Ponto_A` AS `Ponto_A`,`D`.`Data_A` AS `Data_A`,`D`.`Ponto_B` AS `Ponto_B`,`D`.`Data_B` AS `Data_B`,`D`.`Ponto_C` AS `Ponto_C`,`D`.`Data_C` AS `Data_C`,`D`.`Ponto_D` AS `Ponto_D`,`D`.`Data_D` AS `Data_D`,`D`.`Ponto_Chegada` AS `Ponto_Chegada`,`D`.`Data_Final` AS `Data_Final`,`vw`.`andamento_pedido` AS `andamento_pedido`,`vw`.`status` AS `status`,`T`.`info_parada` AS `info_parada`,(case when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 4) and (`D`.`Ponto_A` is null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Sem informação de pit-stop. Pedido Coletado em ',`T`.`Ponto_Saida`,' | ',`vw`.`pedido_coletado`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 4) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo primeiro pit-stop: ',`T`.`Ponto_A`,' em ',`D`.`Data_A`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 4) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is not null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo segundo pit-stop: ',`T`.`Ponto_B`,' em ',`D`.`Data_B`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 4) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is not null) and (`D`.`Ponto_C` is not null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo terceiro pit-stop: ',`T`.`Ponto_C`,' em ',`D`.`Data_C`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 4) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is not null) and (`D`.`Ponto_C` is not null) and (`D`.`Ponto_D` is not null)) then concat('Passou pelo quarto pit-stop: ',`T`.`Ponto_D`,' em ',`D`.`Data_D`) else 'Consultar suporte para mais informações' end) AS `Deslocamento` from ((`t8_deslocamento` `D` join `t3_transittime` `T` on((`D`.`cliente_cidade` = `T`.`Cidade`))) join `vw_andamento_pedido` `vw` on((`vw`.`id_original` = `D`.`id_original`))) where ((`T`.`info_parada` = 4) and (`D`.`Ponto_Chegada` is null)) union all select `D`.`id` AS `id`,`D`.`id_original` AS `id_original`,`D`.`cliente_codigo` AS `cliente_codigo`,`D`.`cliente_cidade` AS `cliente_cidade`,`D`.`id_produto` AS `id_produto`,`D`.`quantidade` AS `quantidade`,`D`.`Ponto_Saida` AS `Ponto_Saida`,`D`.`Ponto_A` AS `Ponto_A`,`D`.`Data_A` AS `Data_A`,`D`.`Ponto_B` AS `Ponto_B`,`D`.`Data_B` AS `Data_B`,`D`.`Ponto_C` AS `Ponto_C`,`D`.`Data_C` AS `Data_C`,`D`.`Ponto_D` AS `Ponto_D`,`D`.`Data_D` AS `Data_D`,`D`.`Ponto_Chegada` AS `Ponto_Chegada`,`D`.`Data_Final` AS `Data_Final`,`vw`.`andamento_pedido` AS `andamento_pedido`,`vw`.`status` AS `status`,`T`.`info_parada` AS `info_parada`,(case when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 3) and (`D`.`Ponto_A` is null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Sem informação de pit-stop. Pedido Coletado em ',`T`.`Ponto_Saida`,' | ',`vw`.`pedido_coletado`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 3) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo primeiro pit-stop: ',`T`.`Ponto_A`,' em ',`D`.`Data_A`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 3) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is not null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo segundo pit-stop: ',`T`.`Ponto_B`,' em ',`D`.`Data_B`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 3) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is not null) and (`D`.`Ponto_C` is not null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo terceiro pit-stop: ',`T`.`Ponto_C`,' em ',`D`.`Data_C`) else 'Consultar suporte para mais informações' end) AS `Deslocamento` from ((`t8_deslocamento` `D` join `t3_transittime` `T` on((`D`.`cliente_cidade` = `T`.`Cidade`))) join `vw_andamento_pedido` `vw` on((`vw`.`id_original` = `D`.`id_original`))) where ((`T`.`info_parada` = 3) and (`D`.`Ponto_Chegada` is null)) union all select `D`.`id` AS `id`,`D`.`id_original` AS `id_original`,`D`.`cliente_codigo` AS `cliente_codigo`,`D`.`cliente_cidade` AS `cliente_cidade`,`D`.`id_produto` AS `id_produto`,`D`.`quantidade` AS `quantidade`,`D`.`Ponto_Saida` AS `Ponto_Saida`,`D`.`Ponto_A` AS `Ponto_A`,`D`.`Data_A` AS `Data_A`,`D`.`Ponto_B` AS `Ponto_B`,`D`.`Data_B` AS `Data_B`,`D`.`Ponto_C` AS `Ponto_C`,`D`.`Data_C` AS `Data_C`,`D`.`Ponto_D` AS `Ponto_D`,`D`.`Data_D` AS `Data_D`,`D`.`Ponto_Chegada` AS `Ponto_Chegada`,`D`.`Data_Final` AS `Data_Final`,`vw`.`andamento_pedido` AS `andamento_pedido`,`vw`.`status` AS `status`,`T`.`info_parada` AS `info_parada`,(case when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 2) and (`D`.`Ponto_A` is null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Sem informação de pit-stop. Pedido Coletado em ',`T`.`Ponto_Saida`,' | ',`vw`.`pedido_coletado`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 2) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo primeiro pit-stop: ',`T`.`Ponto_A`,' em ',`D`.`Data_A`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 2) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is not null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo segundo pit-stop: ',`T`.`Ponto_B`,' em ',`D`.`Data_B`) else 'Consultar suporte para mais informações' end) AS `Deslocamento` from ((`t8_deslocamento` `D` join `t3_transittime` `T` on((`D`.`cliente_cidade` = `T`.`Cidade`))) join `vw_andamento_pedido` `vw` on((`vw`.`id_original` = `D`.`id_original`))) where ((`T`.`info_parada` = 2) and (`D`.`Ponto_Chegada` is null)) union all select `D`.`id` AS `id`,`D`.`id_original` AS `id_original`,`D`.`cliente_codigo` AS `cliente_codigo`,`D`.`cliente_cidade` AS `cliente_cidade`,`D`.`id_produto` AS `id_produto`,`D`.`quantidade` AS `quantidade`,`D`.`Ponto_Saida` AS `Ponto_Saida`,`D`.`Ponto_A` AS `Ponto_A`,`D`.`Data_A` AS `Data_A`,`D`.`Ponto_B` AS `Ponto_B`,`D`.`Data_B` AS `Data_B`,`D`.`Ponto_C` AS `Ponto_C`,`D`.`Data_C` AS `Data_C`,`D`.`Ponto_D` AS `Ponto_D`,`D`.`Data_D` AS `Data_D`,`D`.`Ponto_Chegada` AS `Ponto_Chegada`,`D`.`Data_Final` AS `Data_Final`,`vw`.`andamento_pedido` AS `andamento_pedido`,`vw`.`status` AS `status`,`T`.`info_parada` AS `info_parada`,(case when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 1) and (`D`.`Ponto_A` is null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Sem informação de pit-stop. Pedido Coletado em ',`T`.`Ponto_Saida`,' | ',`vw`.`pedido_coletado`) when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 1) and (`D`.`Ponto_A` is not null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Passou pelo primeiro pit-stop: ',`T`.`Ponto_A`,' em ',`D`.`Data_A`) else 'Consultar suporte para mais informações' end) AS `Deslocamento` from ((`t8_deslocamento` `D` join `t3_transittime` `T` on((`D`.`cliente_cidade` = `T`.`Cidade`))) join `vw_andamento_pedido` `vw` on((`vw`.`id_original` = `D`.`id_original`))) where ((`T`.`info_parada` = 1) and (`D`.`Ponto_Chegada` is null)) union all select `D`.`id` AS `id`,`D`.`id_original` AS `id_original`,`D`.`cliente_codigo` AS `cliente_codigo`,`D`.`cliente_cidade` AS `cliente_cidade`,`D`.`id_produto` AS `id_produto`,`D`.`quantidade` AS `quantidade`,`D`.`Ponto_Saida` AS `Ponto_Saida`,`D`.`Ponto_A` AS `Ponto_A`,`D`.`Data_A` AS `Data_A`,`D`.`Ponto_B` AS `Ponto_B`,`D`.`Data_B` AS `Data_B`,`D`.`Ponto_C` AS `Ponto_C`,`D`.`Data_C` AS `Data_C`,`D`.`Ponto_D` AS `Ponto_D`,`D`.`Data_D` AS `Data_D`,`D`.`Ponto_Chegada` AS `Ponto_Chegada`,`D`.`Data_Final` AS `Data_Final`,`vw`.`andamento_pedido` AS `andamento_pedido`,`vw`.`status` AS `status`,`T`.`info_parada` AS `info_parada`,(case when ((`D`.`cliente_cidade` = `T`.`Cidade`) and (`T`.`info_parada` = 0) and (`D`.`Ponto_A` is null) and (`D`.`Ponto_B` is null) and (`D`.`Ponto_C` is null) and (`D`.`Ponto_D` is null)) then concat('Não há ponto de pit-stop. Pedido Coletado em ',`T`.`Ponto_Saida`,' | ',`vw`.`pedido_coletado`) else 'Consultar suporte para mais informações' end) AS `Deslocamento` from ((`t8_deslocamento` `D` join `t3_transittime` `T` on((`D`.`cliente_cidade` = `T`.`Cidade`))) join `vw_andamento_pedido` `vw` on((`vw`.`id_original` = `D`.`id_original`))) where ((`T`.`info_parada` = 0) and (`D`.`Ponto_Chegada` is null)) union all select `D`.`id` AS `id`,`D`.`id_original` AS `id_original`,`D`.`cliente_codigo` AS `cliente_codigo`,`D`.`cliente_cidade` AS `cliente_cidade`,`D`.`id_produto` AS `id_produto`,`D`.`quantidade` AS `quantidade`,`D`.`Ponto_Saida` AS `Ponto_Saida`,`D`.`Ponto_A` AS `Ponto_A`,`D`.`Data_A` AS `Data_A`,`D`.`Ponto_B` AS `Ponto_B`,`D`.`Data_B` AS `Data_B`,`D`.`Ponto_C` AS `Ponto_C`,`D`.`Data_C` AS `Data_C`,`D`.`Ponto_D` AS `Ponto_D`,`D`.`Data_D` AS `Data_D`,`D`.`Ponto_Chegada` AS `Ponto_Chegada`,`D`.`Data_Final` AS `Data_Final`,`vw`.`andamento_pedido` AS `andamento_pedido`,`vw`.`status` AS `status`,`T`.`info_parada` AS `info_parada`,(case when (`D`.`cliente_cidade` = `T`.`Cidade`) then concat('Pedido entregue em: ',`D`.`Ponto_Chegada`,' em ',`D`.`Data_Final`) else 'Consultar suporte para mais informações' end) AS `Deslocamento` from ((`t8_deslocamento` `D` join `t3_transittime` `T` on((`D`.`cliente_cidade` = `T`.`Cidade`))) join `vw_andamento_pedido` `vw` on((`vw`.`id_original` = `D`.`id_original`))) where (`D`.`Ponto_Chegada` is not null)) `TABELA_WEB`




CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `VW_PEDIDOS_REGIAO` AS
    SELECT 
        COUNT(`P`.`id_original`) AS `QTD`,
        SUM(`P`.`quantidade`) AS `QTD_P`,
        `T`.`Regiao` AS `Regiao`
    FROM
        (`VW_INFO_WEB` `P`
        JOIN `t3_transittime` `T` ON ((`P`.`cliente_cidade` = `T`.`Cidade`)))
    GROUP BY `T`.`Regiao`
	
	
	
CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`%` 
    SQL SECURITY DEFINER
VIEW `VW_STATUS_TRANSPORTE` AS
    SELECT 
        `t1_pedidos`.`id` AS `id`,
        `t1_pedidos`.`id_original` AS `id_original`,
        `t1_pedidos`.`id_produto` AS `id_produto`,
        `t1_pedidos`.`id_cliente` AS `id_cliente`,
        `t1_pedidos`.`id_funcionario` AS `id_funcionario`,
        (TO_DAYS(`t1_pedidos`.`pedido_aprovado`) - TO_DAYS(`t1_pedidos`.`pedido_realizado`)) AS `tempo_aprovacao`,
        (TO_DAYS(`t1_pedidos`.`pedido_separacao`) - TO_DAYS(`t1_pedidos`.`pedido_aprovado`)) AS `tempo_separacao`,
        (TO_DAYS(`t1_pedidos`.`pedido_faturado`) - TO_DAYS(`t1_pedidos`.`pedido_separacao`)) AS `tempo_faturamento`,
        (TO_DAYS(`t1_pedidos`.`pedido_coletado`) - TO_DAYS(`t1_pedidos`.`pedido_faturado`)) AS `tempo_coleta`,
        (TO_DAYS(`t1_pedidos`.`entrega_realizada`) - TO_DAYS(`t1_pedidos`.`pedido_coletado`)) AS `tempo_transporte`,
        (CASE
            WHEN (`t1_pedidos`.`previsao_entrega` > `t1_pedidos`.`entrega_realizada`) THEN 'Adiantado'
            WHEN (`t1_pedidos`.`previsao_entrega` < `t1_pedidos`.`entrega_realizada`) THEN 'Atrasado'
            ELSE 'No prazo'
        END) AS `status`
    FROM
        `t1_pedidos`