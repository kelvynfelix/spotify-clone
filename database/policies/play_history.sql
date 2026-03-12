-- SELECT
create policy "select_own_play_history" on play_history for
select
    using (auth.uid () = user_id);

-- INSERT
create policy "insert_own_play_history" on play_history for insert
with
    check (auth.uid () = user_id);