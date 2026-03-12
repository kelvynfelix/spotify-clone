-- SELECT
create policy "select_playlist_tracks" on playlist_tracks for
select
    using (
        exists (
            select
                *
            from
                playlists
            where
                playlists.id = playlist_tracks.playlist_id
                and playlists.is_public = true
                or playlists.user_id = auth.uid ()
        )
    );

-- INSERT
create policy "insert_own_playlist_track" on playlist_tracks for insert
with
    check (
        exists (
            select
                1
            from
                playlists
            where
                playlists.id = playlist_tracks.playlist_id
                and playlists.user_id = auth.uid ()
        )
    );

-- DELETE
create policy "delete_own_playlist_track" on playlist_tracks for delete using (
    exists (
        select
            1
        from
            playlists
        where
            playlists.id = playlist_tracks.playlist_id
            and playlists.user_id = auth.uid ()
    )
);