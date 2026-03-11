*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_T500P
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zhcm_fill_t500p.

DATA: lt_t500p TYPE TABLE OF zhcm_t500p,
      ls_t500p TYPE zhcm_t500p,
      lv_lines TYPE i.

START-OF-SELECTION.

  " Clear existing test data
  DELETE FROM zhcm_t500p WHERE werks LIKE '9%'.

  " Fill internal table
  ls_t500p = VALUE #( werks = '9001' landt = 'DE' name1 = 'Head Office Berlin'       ). APPEND ls_t500p TO lt_t500p.
  ls_t500p = VALUE #( werks = '9002' landt = 'DE' name1 = 'Plant Hamburg'             ). APPEND ls_t500p TO lt_t500p.
  ls_t500p = VALUE #( werks = '9003' landt = 'DE' name1 = 'Plant Munich'              ). APPEND ls_t500p TO lt_t500p.
  ls_t500p = VALUE #( werks = '9004' landt = 'DE' name1 = 'Branch Frankfurt'          ). APPEND ls_t500p TO lt_t500p.
  ls_t500p = VALUE #( werks = '9005' landt = 'AT' name1 = 'Subsidiary Vienna'         ). APPEND ls_t500p TO lt_t500p.

  " Insert into DB
  INSERT zhcm_t500p FROM TABLE lt_t500p ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_T500P.|.
  WRITE: / 'Personnel Areas:'.
  WRITE: / '  9001 - Head Office Berlin (DE)'.
  WRITE: / '  9002 - Plant Hamburg (DE)'.
  WRITE: / '  9003 - Plant Munich (DE)'.
  WRITE: / '  9004 - Branch Frankfurt (DE)'.
  WRITE: / '  9005 - Subsidiary Vienna (AT)'.
