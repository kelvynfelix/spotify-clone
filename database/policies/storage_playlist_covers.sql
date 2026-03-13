create policy "select_public_playlist_covers" on storage.objects for
select
  using (
    bucket_id = 'playlist-covers'
    and exists (
      select
        1
      from
        playlists
      where
        playlists.id = (storage.foldername (name)) [1]::uuid
        and playlists.is_public = true
    )
  );

create policy "insert_own_playlist_cover" on storage.objects for insert
with
  check (
    bucket_id = 'playlist-covers'
    and exists (
      select
        1
      from
        playlists
      where
        playlists.id = (storage.foldername (name)) [1]::uuid
        and playlists.user_id = auth.uid ()
    )
  );

create policy "update_own_playlist_cover" on storage.objects
for update
  using (
    bucket_id = 'playlist-covers'
    and exists (
      select
        1
      from
        playlists
      where
        playlists.id = (storage.foldername (name)) [1]::uuid
        and playlists.user_id = auth.uid ()
    )
  );

create policy "delete_own_playlist_cover" on storage.objects for delete using (
  bucket_id = 'playlist-covers'
  and exists (
    select
      1
    from
      playlists
    where
      playlists.id = (storage.foldername (name)) [1]::uuid
      and playlists.user_id = auth.uid ()
  )
);