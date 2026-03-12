-- SELECT
create policy "select_own_subscriptions" on subscriptions for
select
    using (auth.uid () = user_id);