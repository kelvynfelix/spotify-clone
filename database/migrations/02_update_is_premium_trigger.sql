create function update_is_premium () RETURNS TRIGGER as $$
BEGIN
    -- Atualiza profiles.is_premium baseado no status da subscription
    UPDATE profiles
    SET is_premium = (NEW.status = 'active')
    WHERE id = NEW.user_id;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


-- TRIGGER
create trigger on_subscription_update
after
update on subscriptions for EACH row
execute FUNCTION update_is_premium ();