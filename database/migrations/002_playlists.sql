-- cria tabela de playlists dos usuários
-- cada playlist pertence a um usuário
create table
    playlists (
        id uuid primary key default gen_random_uuid (),
        user_id uuid not null references profiles (id) on delete cascade,
        name text not null,
        description text,
        cover_url text,
        is_public boolean default true,
        created_at timestamptz default now ()
    );