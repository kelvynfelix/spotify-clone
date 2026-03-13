create policy "select_public_avatars" on storage.objects for
select
  using (bucket_id = 'avatars');

create policy "uplaod_own_avatar" on storage.objects for insert
with
  check (
    bucket_id = 'avatars'
    and auth.uid () = (storage.foldername (name)) [1]::uuid
  );

create policy "update_own_avatar" on storage.objects
for update
  using (
    bucket_id = 'avatars'
    and auth.uid () = (storage.foldername (name)) [1]::uuid
  );

create policy "delete_own_avatar" on storage.objects for delete using (
  bucket_id = 'avatars'
  and auth.uid () = (storage.foldername (name)) [1]::uuid
);