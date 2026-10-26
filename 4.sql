USE Universidade;
DROP PROCEDURE IF EXISTS sp_CadastraNotas;

DELIMITER //

CREATE PROCEDURE sp_CadastraNotas (
    IN p_MATRICULA INT,
    IN p_CURSO CHAR(3),
    IN p_MATERIA CHAR(3),
    IN p_PERLETIVO INT,
    IN p_NOTA DECIMAL(4,2),
    IN p_FALTA INT,
    IN p_BIMESTRE INT
)
BEGIN
    DECLARE v_CARGAHORA INT;
    DECLARE v_TOTALFALTAS INT;
    DECLARE v_MEDIA DECIMAL(4,2);
    DECLARE v_FREQUENCIA DECIMAL(5,2);

    IF p_BIMESTRE < 1 OR p_BIMESTRE > 4 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O bimestre deve ser de 1 a 4';
    END IF;

    IF p_BIMESTRE = 1 THEN

        UPDATE MATRICULA
        SET N1 = p_NOTA,
            F1 = p_FALTA
        WHERE MATRICULA = p_MATRICULA
          AND CURSO = p_CURSO
          AND MATERIA = p_MATERIA
          AND PERLETIVO = p_PERLETIVO;

    ELSEIF p_BIMESTRE = 2 THEN

        UPDATE MATRICULA
        SET N2 = p_NOTA,
            F2 = p_FALTA
        WHERE MATRICULA = p_MATRICULA
          AND CURSO = p_CURSO
          AND MATERIA = p_MATERIA
          AND PERLETIVO = p_PERLETIVO;

    ELSEIF p_BIMESTRE = 3 THEN

        UPDATE MATRICULA
        SET N3 = p_NOTA,
            F3 = p_FALTA
        WHERE MATRICULA = p_MATRICULA
          AND CURSO = p_CURSO
          AND MATERIA = p_MATERIA
          AND PERLETIVO = p_PERLETIVO;

    ELSEIF p_BIMESTRE = 4 THEN

        UPDATE MATRICULA
        SET N4 = p_NOTA,
            F4 = p_FALTA
        WHERE MATRICULA = p_MATRICULA
          AND CURSO = p_CURSO
          AND MATERIA = p_MATERIA
          AND PERLETIVO = p_PERLETIVO;

    END IF;

    UPDATE MATRICULA
    SET TOTALPONTOS =
            COALESCE(N1, 0) +
            COALESCE(N2, 0) +
            COALESCE(N3, 0) +
            COALESCE(N4, 0),

        TOTALFALTAS =
            COALESCE(F1, 0) +
            COALESCE(F2, 0) +
            COALESCE(F3, 0) +
            COALESCE(F4, 0),

        MEDIA = (
            COALESCE(N1, 0) +
            COALESCE(N2, 0) +
            COALESCE(N3, 0) +
            COALESCE(N4, 0)
        ) / p_BIMESTRE

    WHERE MATRICULA = p_MATRICULA
      AND CURSO = p_CURSO
      AND MATERIA = p_MATERIA
      AND PERLETIVO = p_PERLETIVO;

    IF p_BIMESTRE = 4 THEN

        SELECT CARGAHORARIA
        INTO v_CARGAHORA
        FROM MATERIAS
        WHERE SIGLA = p_MATERIA
          AND CURSO = p_CURSO;

        SELECT TOTALFALTAS, MEDIA
        INTO v_TOTALFALTAS, v_MEDIA
        FROM MATRICULA
        WHERE MATRICULA = p_MATRICULA
          AND CURSO = p_CURSO
          AND MATERIA = p_MATERIA
          AND PERLETIVO = p_PERLETIVO;

        SET v_FREQUENCIA =
            ((v_CARGAHORA - v_TOTALFALTAS) /
            v_CARGAHORA) * 100;

        IF v_FREQUENCIA < 75 THEN

            UPDATE MATRICULA
            SET PERCFREQ = v_FREQUENCIA,
                RESULTADO = 'REPROVADO',
                MEDIAFINAL = MEDIA
            WHERE MATRICULA = p_MATRICULA
              AND CURSO = p_CURSO
              AND MATERIA = p_MATERIA
              AND PERLETIVO = p_PERLETIVO;

        ELSEIF v_MEDIA >= 7 THEN

            UPDATE MATRICULA
            SET PERCFREQ = v_FREQUENCIA,
                RESULTADO = 'APROVADO',
                MEDIAFINAL = MEDIA
            WHERE MATRICULA = p_MATRICULA
              AND CURSO = p_CURSO
              AND MATERIA = p_MATERIA
              AND PERLETIVO = p_PERLETIVO;

        ELSEIF v_MEDIA >= 4 THEN

            UPDATE MATRICULA
            SET PERCFREQ = v_FREQUENCIA,
                RESULTADO = 'EXAME',
                MEDIAFINAL = NULL
            WHERE MATRICULA = p_MATRICULA
              AND CURSO = p_CURSO
              AND MATERIA = p_MATERIA
              AND PERLETIVO = p_PERLETIVO;

        ELSE

            UPDATE MATRICULA
            SET PERCFREQ = v_FREQUENCIA,
                RESULTADO = 'REPROVADO',
                MEDIAFINAL = MEDIA
            WHERE MATRICULA = p_MATRICULA
              AND CURSO = p_CURSO
              AND MATERIA = p_MATERIA
              AND PERLETIVO = p_PERLETIVO;

        END IF;

    END IF;

    SELECT *
    FROM MATRICULA
    WHERE MATRICULA = p_MATRICULA
      AND CURSO = p_CURSO
      AND MATERIA = p_MATERIA
      AND PERLETIVO = p_PERLETIVO;

END //

DELIMITER ;