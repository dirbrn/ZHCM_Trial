*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA0000
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA0000.

DATA: lt_pa0000 TYPE TABLE OF zhcm_pa0000,
      ls_pa0000 TYPE zhcm_pa0000,
      lv_lines  TYPE i.

START-OF-SELECTION.

  " Clear existing test data
  DELETE FROM zhcm_pa0000 WHERE pernr LIKE '9%'.

  " 5 Mitarbeiter - Hiring Action (MASSN = '01')
  ls_pa0000 = VALUE #(
    pernr = '90000001' infty = '0000' subty = '    ' seqnr = '000'
    begda = '20230101' endda = '99991231'
    massn = '01' massg = '01' stat2 = '3' stat1 = '1' stat3 = '1' ). APPEND ls_pa0000 TO lt_pa0000.

  ls_pa0000 = VALUE #(
    pernr = '90000002' infty = '0000' subty = '    ' seqnr = '000'
    begda = '20230301' endda = '99991231'
    massn = '01' massg = '01' stat2 = '3' stat1 = '1' stat3 = '1' ). APPEND ls_pa0000 TO lt_pa0000.

  ls_pa0000 = VALUE #(
    pernr = '90000003' infty = '0000' subty = '    ' seqnr = '000'
    begda = '20220601' endda = '99991231'
    massn = '01' massg = '01' stat2 = '3' stat1 = '1' stat3 = '1' ). APPEND ls_pa0000 TO lt_pa0000.

  ls_pa0000 = VALUE #(
    pernr = '90000004' infty = '0000' subty = '    ' seqnr = '000'
    begda = '20240101' endda = '99991231'
    massn = '01' massg = '01' stat2 = '3' stat1 = '1' stat3 = '1' ). APPEND ls_pa0000 TO lt_pa0000.

  ls_pa0000 = VALUE #(
    pernr = '90000005' infty = '0000' subty = '    ' seqnr = '000'
    begda = '20210901' endda = '20231231'
    massn = '07' massg = '04' stat2 = '0' stat1 = '0' stat3 = '0' ). APPEND ls_pa0000 TO lt_pa0000.

  " Insert into DB
  INSERT zhcm_pa0000 FROM TABLE lt_pa0000 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA0000.|.
  WRITE: / 'Employees:'.
  WRITE: / '  90000001 - Hired 01.01.2023 - Active'.
  WRITE: / '  90000002 - Hired 01.03.2023 - Active'.
  WRITE: / '  90000003 - Hired 01.06.2022 - Active'.
  WRITE: / '  90000004 - Hired 01.01.2024 - Active'.
  WRITE: / '  90000005 - Hired 01.09.2021 - Left 31.12.2023'.
