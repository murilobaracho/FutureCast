# FutureCast 🚀🔮

O **FutureCast** é uma rede social inovadora desenvolvida especialmente para adolescentes que se importam com o seu amanhã e querem moldar o seu futuro. Uma plataforma interativa projetada para conectar jovens com objetivos comuns, permitindo a partilha de planos, metas acadêmicas, profissionais e o desenvolvimento pessoal.

---

## 🚀 Funcionalidades

- **Página Inicial (Home):** Feed principal para partilha de pensamentos e conexões com foco no futuro.
- **Minha Conta (`minha-conta.html`):** Perfil personalizado do utilizador, incluindo gestão de foto de perfil e menu hambúrguer responsivo para navegação.
- **Autenticação & Registro:** Páginas dedicadas à experiência de acesso à plataforma de forma segura.
- **Módulos de Conteúdo Integrados:** Abas dedicadas a diferentes pilares do desenvolvimento do jovem:
  - `Trabalho.html` (Carreira, metas e portfólio)
  - `Vida.html` (Estilo de vida, hábitos e reflexões)
  - `Familia.html` (Relações e conexões de apoio)
- **Contacto (`contato.html`):** Canal direto para suporte e comunicação com a equipa da plataforma.

---

## 🛠️ Tecnologias & Stack

A aplicação foi construída utilizando uma stack moderna, robusta e escalável:

- **Front-end:** [HTML5](https://developer.mozilla.org/pt-BR/docs/Web/HTML), [CSS3](https://developer.mozilla.org/pt-BR/docs/Web/CSS) e [JavaScript (ES6+) Puro](https://developer.mozilla.org/pt-BR/docs/Web/JavaScript)
- **Banco de Dados (SGBD):** [PostgreSQL](https://www.postgresql.org/)
- **Hospedagem de Dados Cloud:** [Neon DB](https://neon.tech/) (Infraestrutura PostgreSQL serverless na nuvem para alta performance)
- **Ambiente de Desenvolvimento:** [Visual Studio Code (VS Code)](https://code.visualstudio.com/)

---

## 📂 Estrutura de Ficheiros

O repositório está organizado da seguinte forma:
```bash
├── src/                    # Pasta com recursos adicionais e scripts
├── Familia.html            # Módulo de conexões familiares e suporte
├── Trabalho.html           # Espaço dedicado a metas profissionais e carreira
├── Vida.html               # Conteúdos sobre bem-estar e desenvolvimento pessoal
├── contato.html            # Formulário de contacto da plataforma
├── home.html               # Feed principal da rede social
├── index.html              # Página de entrada/landing page e login
├── minha-conta.html        # Perfil completo do utilizador logado
└── README.md               # Documentação oficial do projeto


---

## 🔐 Banco de dados e segurança

O site roda 100% no **GitHub Pages** e acessa o Neon direto do navegador. Como não há servidor, a conexão fica visível para quem abrir o site; por isso ela deve usar uma **role com permissões mínimas**, nunca o `neondb_owner`.

1. No Neon, gere uma senha nova para o `neondb_owner` (a antiga ficou no histórico público do Git).
2. A role `futurecast_web` já foi criada no Neon com permissões mínimas: só lê/insere o necessário, não apaga nada, não altera tabelas e não lê `senha_hash`.
3. Coloque a URL dessa role em [src/scripts/config.js](src/scripts/config.js), faça commit e push.

> O login não valida senha e a identidade fica no navegador. Qualquer visitante consegue entrar com o e-mail de outra pessoa e editar o perfil dela. Corrigir isso exige um servidor ou login gerenciado (ex.: Supabase).
