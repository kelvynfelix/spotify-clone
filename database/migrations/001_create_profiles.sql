-- cria a tabela de usuários
-- guarda informações públicas do perfil
create table
    profiles (
        id uuid primary key references auth.users (id) on delete cascade,
        username varchar(30) unique not null,
        display_name text,
        avatar_url text,
        is_premium boolean default false,
        created_at timestamptz default now ()
    );