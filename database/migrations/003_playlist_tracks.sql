-- músicas dentro de uma playlist
-- guarda o id da música do Spotify e a posição
create table
    playlist_tracks (
        id uuid primary key default gen_random_uuid (),
        playlist_id uuid not null references playlists (id) on delete cascade,
        spotify_track_id text not null,
        added_at timestamptz default now (),
        position integer
    );