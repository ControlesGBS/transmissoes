-- Rodar no SQL Editor do Supabase do GBS.
-- Remove os dados do RZ 01 de agosto/2026 que vieram do arquivo da Cemig
-- de outro contrato, enviado por engano.

-- 1) Confere quantas linhas vai apagar antes de rodar o delete
select count(*) from transmissoes where rz = '01' and mes_ref = '2026-08-01';

-- 2) Depois de conferir, roda isso pra apagar de vez (não tem como desfazer)
delete from transmissoes where rz = '01' and mes_ref = '2026-08-01';
