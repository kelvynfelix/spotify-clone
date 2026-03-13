create function add_play_history () RETURNS TRIGGER as $$
BEGIN
    -- Insere um registro no histórico de reprodução
    INSERT INTO play_history(
        user_id,
        spotify_track_id,
        played_at
    )
    VALUES (
        NEW.user_id,
        NEW.spotify_track_id,
        now()
    );

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Trigger
create trigger on_new_play
after INSERT on playlist_tracks for EACH row
execute FUNCTION add_play_history ();