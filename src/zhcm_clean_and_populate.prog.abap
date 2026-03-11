*&---------------------------------------------------------------------*
*& Report ZHCM_CLEAN_AND_POPULATE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_CLEAN_AND_POPULATE.

DATA: lt_rgdir TYPE TABLE OF zhcm_rgdir,
      lt_pcl2  TYPE TABLE OF zhcm_pcl2,
      lv_json  TYPE string.

START-OF-SELECTION.

  " --- 1. SCHRITT: TABELLEN REINIGEN (TRUNCATE) ---
  DELETE FROM zhcm_rgdir. " Index löschen
  DELETE FROM zhcm_pcl2.  " Cluster-Container löschen
  WRITE: / 'Datenbank bereinigt (ZHCM_RGDIR & ZHCM_PCL2).'.
  ULINE.

  " --- 2. SCHRITT: DATEN-GENERIERUNG FÜR 3 MITARBEITER ---

  " A) MUELLER THOMAS (90000001) - 2 Ergebnisse (Rückrechnung)
  " Lauf 1: Ursprüngliches Ergebnis (wird durch Lauf 2 ersetzt)
  APPEND VALUE #( mandt = sy-mandt pernr = '90000001' SEQNR = '00001'
                  pabrj = '2024' pabrp = '01' IMPER = '202401'
                  srtza = 'P' paydt = '20240125' uname = sy-uname aedtm = sy-datum ) TO lt_rgdir.

  lv_json = '{"RT":[{"LGART":"/101","BETRG":5000.00}],"WPBP":[{"PLANS":"90000011"}]}'.
  APPEND VALUE #( mandt = sy-mandt relid = 'B2' srtfd = '9000000100001'
                  clustd = lv_json uname = sy-uname aedtm = sy-datum ) TO lt_pcl2.

  " Lauf 2: Aktuelles korrigiertes Ergebnis (Nachberechnung im Februar für Januar)
  APPEND VALUE #( mandt = sy-mandt pernr = '90000001' SEQNR = '00002'
                  pabrj = '2024' pabrp = '01' imper = '202402'
                  srtza = 'A' paydt = '20240225' uname = sy-uname aedtm = sy-datum ) TO lt_rgdir.

  lv_json = '{"RT":[{"LGART":"/101","BETRG":5200.00}],"WPBP":[{"PLANS":"90000011"}]}'.
  APPEND VALUE #( mandt = sy-mandt relid = 'B2' srtfd = '9000000100002'
                  clustd = lv_json uname = sy-uname aedtm = sy-datum ) TO lt_pcl2.


  " B) SCHMIDT SANDRA (90000002) - Standardlauf
  APPEND VALUE #( mandt = sy-mandt pernr = '90000002' seqnr = '00001'
                  pabrj = '2024' pabrp = '01' imper = '202401'
                  srtza = 'A' paydt = '20240125' uname = sy-uname aedtm = sy-datum ) TO lt_rgdir.

  lv_json = '{"RT":[{"LGART":"/101","BETRG":4800.00}],"WPBP":[{"PLANS":"90000011"}]}'.
  APPEND VALUE #( mandt = sy-mandt relid = 'B2' srtfd = '9000000200001'
                  clustd = lv_json uname = sy-uname aedtm = sy-datum ) TO lt_pcl2.


  " C) WEBER KLAUS (90000003) - Standardlauf
  APPEND VALUE #( mandt = sy-mandt pernr = '90000003' seqnr = '00001'
                  pabrj = '2024' pabrp = '01' imper = '202401'
                  srtza = 'A' paydt = '20240125' uname = sy-uname aedtm = sy-datum ) TO lt_rgdir.

  lv_json = '{"RT":[{"LGART":"/101","BETRG":4200.00}],"WPBP":[{"PLANS":"90000010"}]}'.
  APPEND VALUE #( mandt = sy-mandt relid = 'B2' srtfd = '9000000300001'
                  clustd = lv_json uname = sy-uname aedtm = sy-datum ) TO lt_pcl2.

  " --- 3. SCHRITT: MASSEN-INSERT ---
  INSERT zhcm_rgdir FROM TABLE lt_rgdir.
  INSERT zhcm_pcl2 FROM TABLE lt_pcl2.

  IF sy-subrc = 0.
    WRITE: / 'Daten erfolgreich generiert.'.
    WRITE: / 'Mitarbeiter: Mueller (2 Sätze), Schmidt (1 Satz), Weber (1 Satz).'.
    ULINE.
  ENDIF.

  " --- 4. SCHRITT: ANZEIGE DER NAVIGATIONSLOGIK ---
    WRITE: / 'NACHWEIS DER NAVIGATION (RGDIR -> PCL2):'.
  LOOP AT lt_rgdir INTO DATA(ls_dir) WHERE srtza = 'A'.

    " Sauberer Key-Zusammenbau (String-Interpolation statt Offset)
    DATA(lv_key) = |{ ls_dir-pernr }{ ls_dir-seqnr WIDTH = 5 ALIGN = RIGHT PAD = '0' }|.

    " Reset der Variable vor dem Select
    CLEAR LV_JSON.

    SELECT SINGLE clustd FROM zhcm_pcl2 INTO @LV_JSON
      WHERE relid = 'B2' AND srtfd = @lv_key.

    IF sy-subrc = 0 AND LV_JSON IS NOT INITIAL.
      " Nur zugreifen, wenn der String lang genug ist
      DATA(lv_len) = strlen( LV_JSON ).
      DATA(lv_display) = COND string(
                     WHEN strlen( LV_JSON ) > 50
                     THEN LV_JSON(50)
                     ELSE LV_JSON ).

WRITE: / 'PERNR:', ls_dir-pernr, 'Key:', lv_key.
WRITE: / '  JSON:', lv_display, '...'.
    ELSE.
      WRITE: / 'PERNR:', ls_dir-pernr, '!!! FEHLER: Kein Cluster unter Key', lv_key, 'gefunden.'.
    ENDIF.
    ULINE.
  ENDLOOP.
