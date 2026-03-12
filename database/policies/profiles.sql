-- SELECT
create policy "insert_own_profile" on profiles for insert
with
    check (auth.uid () = id);

-- INSERT
create policy "insert_own_profile" on profiles for insert
with
    check (auth.uid () = id);

-- UPDATE
create policy "update_own_profile" on profiles for
update using (auth.uid () = id);