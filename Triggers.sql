CREATE OR REPLACE FUNCTION delete_update_connected_with_this_series() RETURNS TRIGGER AS $$
BEGIN
    IF (TG_OP = 'DELETE') THEN
        DELETE FROM cyber_sport_db.team_series WHERE team_series.series_id = OLD.series_id;
        DELETE FROM cyber_sport_db.game WHERE game.series_id = OLD.series_id;
        IF NOT FOUND THEN RETURN NULL; END IF;
        RETURN OLD;
    ELSIF (TG_OP = 'UPDATE') THEN
        UPDATE cyber_sport_db.team_series SET team_series.series_id = NEW.series_id WHERE team_series.series_id = OLD.series_id;
        UPDATE cyber_sport_db.game SET game.series_id = NEW.series_id WHERE game.series_id = OLD.series_id;
        IF NOT FOUND THEN RETURN NULL; END IF;
        RETURN NEW;
    END IF;
END
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION delete_copies() RETURNS TRIGGER AS $$
BEGIN
   DELETE FROM cyber_sport_db.player WHERE name = NEW.name AND nickname = NEW.nickname;
   RETURN NEW;
END
$$ LANGUAGE plpgsql;




/* Правильное удаление или обновление серии */
CREATE TRIGGER delete_update_series
    BEFORE DELETE OR UPDATE ON cyber_sport_db.series
    FOR EACH ROW
    WHEN (OLD.series_id IS DISTINCT FROM NEW.series_id)
    EXECUTE PROCEDURE delete_update_connected_with_this_series();

DROP TRIGGER delete_series ON cyber_sport_db.series;



/* Удаляем копии */
CREATE TRIGGER insert_update_player
    BEFORE INSERT OR UPDATE ON cyber_sport_db.player
    FOR EACH ROW
    EXECUTE PROCEDURE delete_copies();
