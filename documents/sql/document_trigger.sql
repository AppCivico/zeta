alter table driver add column documents_validated boolean not null default false;

CREATE OR REPLACE FUNCTION f_driver_documents_validated() RETURNS trigger AS $BODYSHOT$
BEGIN

IF TG_OP = 'DELETE' THEN 

	UPDATE driver 
	SET documents_validated = false
	WHERE user_id = OLD.user_id;
       
	RETURN OLD;
ELSE

	UPDATE driver 
	SET documents_validated = (
		( select count(1) from "document" where user_id = NEW.user_id and class_name = 'registro_cnh' AND validated_at IS NOT NULL )+
		( select count(1) from "document" where user_id = NEW.user_id and class_name = 'comprovante_residencia' AND validated_at IS NOT NULL)+
		( select count(1) from "document" where user_id = NEW.user_id and class_name = 'foto_carro' AND validated_at IS NOT NULL)
	) = 3
	WHERE user_id = NEW.user_id;

	RETURN NEW;
END IF;
END;
$BODYSHOT$ LANGUAGE plpgsql;

CREATE TRIGGER t_driver_documents_validated AFTER INSERT OR UPDATE OR DELETE ON document
   FOR EACH ROW EXECUTE PROCEDURE f_driver_documents_validated();
