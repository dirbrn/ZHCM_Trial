*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA0003
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA0003.

DATA: lt_pa0003 TYPE TABLE OF zhcm_pa0003,
      ls_pa0003 TYPE zhcm_pa0003,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa0003 WHERE pernr LIKE '9%'.

  CLEAR ls_pa0003.
  ls_pa0003-pernr = '90000001'. ls_pa0003-begda = '20230101'.
  ls_pa0003-endda = '99991231'. ls_pa0003-seqnr = '000'.
  ls_pa0003-bondt = '20230101'. ls_pa0003-retdt = '20240131'.
  ls_pa0003-fpper = '202401'. ls_pa0003-preas = '1'.
  APPEND ls_pa0003 TO lt_pa0003.

  CLEAR ls_pa0003.
  ls_pa0003-pernr = '90000002'. ls_pa0003-begda = '20230301'.
  ls_pa0003-endda = '99991231'. ls_pa0003-seqnr = '000'.
  ls_pa0003-bondt = '20230301'. ls_pa0003-retdt = '20240131'.
  ls_pa0003-fpper = '202401'. ls_pa0003-preas = '1'.
  APPEND ls_pa0003 TO lt_pa0003.

  CLEAR ls_pa0003.
  ls_pa0003-pernr = '90000003'. ls_pa0003-begda = '20220601'.
  ls_pa0003-endda = '99991231'. ls_pa0003-seqnr = '000'.
  ls_pa0003-bondt = '20220601'. ls_pa0003-retdt = '20240131'.
  ls_pa0003-fpper = '202401'. ls_pa0003-preas = '1'.
  APPEND ls_pa0003 TO lt_pa0003.

  CLEAR ls_pa0003.
  ls_pa0003-pernr = '90000004'. ls_pa0003-begda = '20240101'.
  ls_pa0003-endda = '99991231'. ls_pa0003-seqnr = '000'.
  ls_pa0003-bondt = '20240101'. ls_pa0003-retdt = '20240131'.
  ls_pa0003-fpper = '202401'. ls_pa0003-preas = '1'.
  APPEND ls_pa0003 TO lt_pa0003.

  CLEAR ls_pa0003.
  ls_pa0003-pernr = '90000005'. ls_pa0003-begda = '20210901'.
  ls_pa0003-endda = '20231231'. ls_pa0003-seqnr = '000'.
  ls_pa0003-bondt = '20210901'. ls_pa0003-retdt = '20231231'.
  ls_pa0003-fpper = '202312'. ls_pa0003-preas = '0'.
  APPEND ls_pa0003 TO lt_pa0003.

  INSERT zhcm_pa0003 FROM TABLE lt_pa0003 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA0003.|.
  WRITE: / '90000001 - Active / Last Payroll 01.2024'.
  WRITE: / '90000002 - Active / Last Payroll 01.2024'.
  WRITE: / '90000003 - Active / Last Payroll 01.2024'.
  WRITE: / '90000004 - Active / Last Payroll 01.2024'.
  WRITE: / '90000005 - Inactive / Last Payroll 12.2023'.
