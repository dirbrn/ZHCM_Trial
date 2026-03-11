*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_T503
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_T503.

DATA: lt_t503 TYPE TABLE OF zhcm_t503,
      ls_t503 TYPE zhcm_t503,
      lv_lines TYPE i.

START-OF-SELECTION.

  " Clear existing test data
  DELETE FROM zhcm_t503 WHERE persg IN ('1','2','3').

  " Fill internal table
  " Employee Group 1 = Active
  ls_t503 = VALUE #( persg = '1' persk = 'U1' langu = 'E' ptext = 'Hourly Wage'      empct = '100' ). APPEND ls_t503 TO lt_t503.
  ls_t503 = VALUE #( persg = '1' persk = 'U2' langu = 'E' ptext = 'Monthly Wage'     empct = '100' ). APPEND ls_t503 TO lt_t503.
  ls_t503 = VALUE #( persg = '1' persk = 'A1' langu = 'E' ptext = 'Salaried Staff'   empct = '100' ). APPEND ls_t503 TO lt_t503.
  ls_t503 = VALUE #( persg = '1' persk = 'A2' langu = 'E' ptext = 'Senior Staff'     empct = '100' ). APPEND ls_t503 TO lt_t503.
  " Employee Group 2 = External
  ls_t503 = VALUE #( persg = '2' persk = 'F1' langu = 'E' ptext = 'Freelancer'       empct = '50'  ). APPEND ls_t503 TO lt_t503.
  ls_t503 = VALUE #( persg = '2' persk = 'F2' langu = 'E' ptext = 'Contractor'       empct = '100' ). APPEND ls_t503 TO lt_t503.
  " Employee Group 3 = Pensioner
  ls_t503 = VALUE #( persg = '3' persk = 'P1' langu = 'E' ptext = 'Early Retirement' empct = '0'   ). APPEND ls_t503 TO lt_t503.
  ls_t503 = VALUE #( persg = '3' persk = 'P2' langu = 'E' ptext = 'Full Retirement'  empct = '0'   ). APPEND ls_t503 TO lt_t503.

  " Insert into DB
  INSERT zhcm_t503 FROM TABLE lt_t503 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_T503.|.
  WRITE: / 'Employee Groups:'.
  WRITE: / '  1/U1 - Active / Hourly Wage'.
  WRITE: / '  1/U2 - Active / Monthly Wage'.
  WRITE: / '  1/A1 - Active / Salaried Staff'.
  WRITE: / '  1/A2 - Active / Senior Staff'.
  WRITE: / '  2/F1 - External / Freelancer'.
  WRITE: / '  2/F2 - External / Contractor'.
  WRITE: / '  3/P1 - Pensioner / Early Retirement'.
  WRITE: / '  3/P2 - Pensioner / Full Retirement'.
