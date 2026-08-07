-- Rodar no SQL Editor do Supabase do GBS.
-- Corrige um bug real: quando uma releitura "migra" pro mês do vencimento (RZ do fim
-- do mês, vencimento cai no mês seguinte), e depois o relatório do mês de destino é
-- subido de verdade, o upload do mês de destino limpava TUDO daquele mês antes de
-- inserir os dados dele — inclusive as releituras que tinham migrado de outro
-- relatório, que sumiam sem deixar rastro.
--
-- A partir de agora, mes_ref_relatorio guarda de qual relatório a releitura veio
-- (fixo, nunca muda), separado de mes_ref (a página onde ela aparece, que pode ser
-- diferente quando o vencimento cai no mês seguinte). Cada upload só limpa e
-- substitui as linhas do PRÓPRIO relatório, nunca as de outro.

alter table releituras add column if not exists mes_ref_relatorio date;

update releituras set mes_ref_relatorio = mes_ref where mes_ref_relatorio is null;
