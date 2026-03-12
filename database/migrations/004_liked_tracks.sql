-- músicas curtidas pelo usuário
-- pk composta impede curtir a mesma música duas vezes
create table
    liked_tracks (
        user_id uuid not null references profiles (id) on delete cascade,
        spotify_track_id text not null,
        liked_at timestamptz default now (),
        primary key (user_id, spotify_track_id)
    );