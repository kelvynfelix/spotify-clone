# 🎵 NovoSpotify

> Clone simplificado do Spotify — projeto fullstack para portfólio.

---

## 📌 Visão Geral

Aplicação web de streaming de música inspirada no Spotify, com funcionalidades essenciais: autenticação, busca de músicas, playlists, player e plano premium com integração de pagamento. O projeto consome a **Spotify Web API** para o catálogo de músicas e utiliza **Supabase** como banco de dados e autenticação.

---

## 🛠️ Stack Tecnológica

| Camada         | Tecnologia                           |
| -------------- | ------------------------------------ |
| Frontend       | HTML, CSS (Tailwind CSS), JavaScript |
| Backend API    | Python + Flask                       |
| Microserviço   | Node.js + Express                    |
| Banco de Dados | Supabase (PostgreSQL + Auth)         |
| Deploy         | Vercel                               |

---

## 🎯 Funcionalidades

### MVP (v1)

- [x] Autenticação (login/registro)
- [x] Login com conta Spotify (OAuth)
- [x] Busca de músicas, álbuns e artistas
- [x] Player de música (preview 30s)
- [x] Criar, editar e excluir playlists
- [x] Adicionar/remover músicas de playlists
- [x] Biblioteca pessoal (músicas curtidas)
- [x] Perfil do usuário

### Premium (v2)

- [ ] Plano premium com pagamento
- [ ] Histórico de reprodução
- [ ] Recomendações personalizadas
- [ ] Modo offline (cache local)

---

## 🗂️ Estrutura do Projeto

```
Novo_Spotify/
│
├── frontend/          # SPA — HTML, Tailwind CSS, JavaScript
│   ├── public/        # Assets estáticos (imagens, ícones)
│   └── src/           # Código-fonte (CSS, JS, templates)
│
├── backend/           # API principal — Python + Flask
│   └── app/           # Routes, controllers, services
│
├── payments/          # Microserviço de pagamentos — Node.js + Express
│   └── src/           # Routes, controllers, services
│
├── database/          # Migrations e schema SQL (Supabase)
│
└── docs/              # Documentação (arquitetura, endpoints, setup)
```

---

## 📐 Arquitetura

```
┌─────────────┐     ┌──────────────────┐     ┌─────────────┐
│             │     │                  │     │             │
│  Frontend   │────>│  Backend         │────>│  Supabase   │
│  (HTML/CSS/ │     │  (Flask API)     │     │  (DB/Auth)  │
│   JS)       │     │                  │     │             │
│             │     └──────┬───────────┘     └─────────────┘
└──────┬──────┘            │
       │              ┌────▼──────────┐     ┌─────────────┐
       │              │               │     │             │
       └─────────────>│  Payments     │────>│  Gateway de │
         (premium)    │  (Express API)│     │  Pagamento  │
                      │               │     │             │
                      └───────────────┘     └─────────────┘
                             │
       ┌─────────────────────┘
       ▼
┌─────────────┐
│  Spotify    │
│  Web API    │
└─────────────┘
```

---

## 🚀 Como Rodar

```bash
# 1. Clone o repositório
git clone https://github.com/seu-usuario/novo-spotify.git
cd novo-spotify

# 2. Backend (Flask)
cd backend
pip install -r requirements.txt
cp .env.example .env
python app/main.py

# 3. Microserviço de Pagamentos (Express)
cd payments
npm install
cp .env.example .env
npm run dev

# 4. Frontend
cd frontend
npm install
npx tailwindcss -i src/css/global.css -o dist/output.css --watch

# 5. Banco de Dados
# Execute os scripts de migration no Supabase SQL Editor
```

> Consulte o `.env.example` de cada serviço para as variáveis necessárias.

---

## 👥 Equipe

Projeto desenvolvido para portfólio e crescimento profissional.

---

## 📄 Licença

MIT
