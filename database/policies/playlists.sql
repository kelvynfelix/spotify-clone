-- SELECT
create policy "select_own_playlists" on playlists for
select
    using (
        auth.uid () = user_id
        or is_public = true
    );

-- INSERT
create policy "insert_own_playlist" on playlists for insert
with
    check (auth.uid () = user_id);

-- UPDATE
create policy "update_own_playlist" on playlists for
update using (auth.uid () = id);

-- DELETE
create policy "delete_own_playlist" on playlists for delete using (auth.uid () = id);