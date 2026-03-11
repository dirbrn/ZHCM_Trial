*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA0002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA0002.

DATA: lt_pa0002 TYPE TABLE OF zhcm_pa0002,
      ls_pa0002 TYPE zhcm_pa0002,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa0002 WHERE pernr LIKE '9%'.

  CLEAR ls_pa0002.
  ls_pa0002-pernr = '90000001'. ls_pa0002-begda = '20230101'.
  ls_pa0002-endda = '99991231'. ls_pa0002-seqnr = '000'.
  ls_pa0002-nachn = 'Mueller'. ls_pa0002-vorna = 'Thomas'.
  ls_pa0002-gbdat = '19850315'. ls_pa0002-gesch = '1'.
  ls_pa0002-natio = 'DEU'.
  APPEND ls_pa0002 TO lt_pa0002.

  CLEAR ls_pa0002.
  ls_pa0002-pernr = '90000002'. ls_pa0002-begda = '20230301'.
  ls_pa0002-endda = '99991231'. ls_pa0002-seqnr = '000'.
  ls_pa0002-nachn = 'Schmidt'. ls_pa0002-vorna = 'Sandra'.
  ls_pa0002-gbdat = '19900622'. ls_pa0002-gesch = '2'.
  ls_pa0002-natio = 'DEU'.
  APPEND ls_pa0002 TO lt_pa0002.

  CLEAR ls_pa0002.
  ls_pa0002-pernr = '90000003'. ls_pa0002-begda = '20220601'.
  ls_pa0002-endda = '99991231'. ls_pa0002-seqnr = '000'.
  ls_pa0002-nachn = 'Weber'. ls_pa0002-vorna = 'Klaus'.
  ls_pa0002-gbdat = '19751108'. ls_pa0002-gesch = '1'.
  ls_pa0002-natio = 'AUT'.
  APPEND ls_pa0002 TO lt_pa0002.

  CLEAR ls_pa0002.
  ls_pa0002-pernr = '90000004'. ls_pa0002-begda = '20240101'.
  ls_pa0002-endda = '99991231'. ls_pa0002-seqnr = '000'.
  ls_pa0002-nachn = 'Fischer'. ls_pa0002-vorna = 'Anna'.
  ls_pa0002-gbdat = '19951203'. ls_pa0002-gesch = '2'.
  ls_pa0002-natio = 'DEU'.
  APPEND ls_pa0002 TO lt_pa0002.

  CLEAR ls_pa0002.
  ls_pa0002-pernr = '90000005'. ls_pa0002-begda = '20210901'.
  ls_pa0002-endda = '20231231'. ls_pa0002-seqnr = '000'.
  ls_pa0002-nachn = 'Becker'. ls_pa0002-vorna = 'Frank'.
  ls_pa0002-gbdat = '19680420'. ls_pa0002-gesch = '1'.
  ls_pa0002-natio = 'DEU'.
  APPEND ls_pa0002 TO lt_pa0002.

  INSERT zhcm_pa0002 FROM TABLE lt_pa0002 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA0002.|.
  WRITE: / '90000001 - Mueller Thomas'.
  WRITE: / '90000002 - Schmidt Sandra'.
  WRITE: / '90000003 - Weber Klaus'.
  WRITE: / '90000004 - Fischer Anna'.
  WRITE: / '90000005 - Becker Frank'.
