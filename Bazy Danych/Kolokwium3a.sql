ALTER TABLE KIEROWNIK ADD ZAROBEK INT DEFAULT 0;
UPDATE KIEROWNIK SET ZAROBEK=3000 WHERE N_KIEROWNIKA='THOMAS';
SELECT * FROM KIEROWNIK;