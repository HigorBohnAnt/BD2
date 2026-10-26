USE Universidade;

CALL procMATRICULAALUNO('Robertinho', 'ENG');

CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 8.00, 2, 1);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 7.00, 0, 2);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 6.00, 4, 3);
CALL sp_CadastraNotas(1, 'ENG', 'BDA', 2025, 5.00, 0, 4);

CALL sp_LancaExame(1, 'ENG', 'BDA', 2025, 6.00);

SELECT * FROM MATRICULA;