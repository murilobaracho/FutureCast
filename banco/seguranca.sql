-- Role de privilégio mínimo para o site (a URL dela fica em src/scripts/config.js).
-- Rode no SQL Editor do Neon, conectado ao banco BD/FUTURECAST, trocando a senha abaixo.
-- Assim, mesmo que alguém leia a conexão no navegador, NÃO consegue apagar dados,
-- alterar tabelas, derrubar o banco nem ler o campo usuario.senha_hash.

DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_roles WHERE rolname = 'futurecast_web') THEN
    CREATE ROLE futurecast_web LOGIN;
  END IF;
END $$;
ALTER ROLE futurecast_web WITH LOGIN PASSWORD 'TROQUE-POR-UMA-SENHA-FORTE-E-NOVA';

GRANT USAGE ON SCHEMA public TO futurecast_web;

-- usuario: sem acesso de leitura a senha_hash; sem DELETE
GRANT SELECT (id, nome, email, telefone, foto_url, criado_em, ultimo_acesso) ON usuario TO futurecast_web;
GRANT INSERT (nome, email, senha_hash, criado_em, ultimo_acesso)             ON usuario TO futurecast_web;
GRANT UPDATE (nome, telefone, foto_url, ultimo_acesso)                       ON usuario TO futurecast_web;

-- conteúdo do site: ler e criar (curtida também alterna o estado)
GRANT SELECT, INSERT ON post, comentario, compartilhar TO futurecast_web;
GRANT SELECT, INSERT ON curtida TO futurecast_web;
GRANT UPDATE (curtida_ativa) ON curtida TO futurecast_web;

-- formulário de contato: só enviar (ninguém lê pelo site)
GRANT INSERT ON contato TO futurecast_web;

-- ids automáticos (serial/identity)
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO futurecast_web;

-- Se algum comando falhar com "column does not exist", ajuste o nome da coluna acima
-- para o que existe na sua tabela (\d usuario).
