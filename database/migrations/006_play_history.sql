-- histórico de músicas reproduzidas
-- usado para analytics ou recursos premium
create table
    play_history (
        id uuid primary key default gen_random_uuid (),
        user_id uuid not null references profiles (id) on delete cascade,
        spotify_track_id text not null,
        played_at timestamptz default now ()
    );