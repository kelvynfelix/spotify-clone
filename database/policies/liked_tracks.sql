-- SELECT
create policy "select_own_liked_tracks" on liked_tracks for
select
    using (auth.uid () = user_id);

-- INSERT
create policy "insert_own_liked_track" on liked_tracks for insert
with
    check (auth.uid () = user_id);

-- DELETE
create policy "delete_own_liked_track" on liked_tracks for delete using (auth.uid () = user_id);