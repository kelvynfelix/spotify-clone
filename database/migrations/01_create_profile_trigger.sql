-- Criação da Função para construir perfil "automatico"
create function create_profile () RETURNS TRIGGER as $$
BEGIN
    -- insere na tabela profiles usando dados do usuário recém-criado
    INSERT INTO profiles(id, username, display_name, avatar_url, is_premium) VALUES (NEW.id, NEW.email, NULL, NULL, false);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER on_user_insert
AFTER INSERT ON auth.users
FOR EACH ROW
EXECUTE FUNCTION create_profile();
