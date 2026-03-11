*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA2006
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA2006.

DATA: lt_pa2006 TYPE TABLE OF zhcm_pa2006,
      ls_pa2006 TYPE zhcm_pa2006,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa2006 WHERE pernr LIKE '9%'.

  " 90000001 - Annual Leave 2024 (30 days, 5 used)
  ls_pa2006 = VALUE #(
    pernr = '90000001' begda = '20240101' endda = '20241231' seqnr = '000'
    subty = '0001' ktart = '01'
    anzhl = '30' verbt = '5' resto = '25'
    uedtm = '20250331' ). APPEND ls_pa2006 TO lt_pa2006.

  " 90000002 - Annual Leave 2024 (28 days, 10 used)
  ls_pa2006 = VALUE #(
    pernr = '90000002' begda = '20240101' endda = '20241231' seqnr = '000'
    subty = '0001' ktart = '01'
    anzhl = '28' verbt = '10' resto = '18'
    uedtm = '20250331' ). APPEND ls_pa2006 TO lt_pa2006.

  " 90000003 - Annual Leave 2024 (30 days, 20 used)
  ls_pa2006 = VALUE #(
    pernr = '90000003' begda = '20240101' endda = '20241231' seqnr = '000'
    subty = '0001' ktart = '01'
    anzhl = '30' verbt = '20' resto = '10'
    uedtm = '20250331' ). APPEND ls_pa2006 TO lt_pa2006.

  " 90000004 - Annual Leave 2024 (25 days, 0 used - new hire)
  ls_pa2006 = VALUE #(
    pernr = '90000004' begda = '20240101' endda = '20241231' seqnr = '000'
    subty = '0001' ktart = '01'
    anzhl = '25' verbt = '0' resto = '25'
    uedtm = '20250331' ). APPEND ls_pa2006 TO lt_pa2006.

  " 90000005 - Annual Leave 2023 (30 days, 30 used - left)
  ls_pa2006 = VALUE #(
    pernr = '90000005' begda = '20230101' endda = '20231231' seqnr = '000'
    subty = '0001' ktart = '01'
    anzhl = '30' verbt = '30' resto = '0'
    uedtm = '20240331' ). APPEND ls_pa2006 TO lt_pa2006.

  INSERT zhcm_pa2006 FROM TABLE lt_pa2006 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA2006.|.
  WRITE: / '90000001 - 30 days / 5 used / 25 remaining'.
  WRITE: / '90000002 - 28 days / 10 used / 18 remaining'.
  WRITE: / '90000003 - 30 days / 20 used / 10 remaining'.
  WRITE: / '90000004 - 25 days / 0 used / 25 remaining'.
  WRITE: / '90000005 - 30 days / 30 used / 0 remaining'.
