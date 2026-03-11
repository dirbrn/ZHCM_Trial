*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA0001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA0001.

DATA: lt_pa0001 TYPE TABLE OF zhcm_pa0001,
      ls_pa0001 TYPE zhcm_pa0001,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa0001 WHERE pernr LIKE '9%'.

  " 90000001 - Mueller Thomas - ABAP Developer - IT Dept
  CLEAR ls_pa0001.
  ls_pa0001-pernr = '90000001'. ls_pa0001-begda = '20230101'.
  ls_pa0001-endda = '99991231'. ls_pa0001-seqnr = '000'.
  ls_pa0001-subty = '0000'. ls_pa0001-objps = '00'.
  ls_pa0001-orgeh = '90000002'. ls_pa0001-plans = '90000011'.
  ls_pa0001-werks = '9001'. ls_pa0001-persg = '1'.
  ls_pa0001-persk = 'A1'. ls_pa0001-ename = 'Mueller Thomas'.
  APPEND ls_pa0001 TO lt_pa0001.

  " 90000002 - Schmidt Sandra - ABAP Developer - IT Dept
  CLEAR ls_pa0001.
  ls_pa0001-pernr = '90000002'. ls_pa0001-begda = '20230301'.
  ls_pa0001-endda = '99991231'. ls_pa0001-seqnr = '000'.
  ls_pa0001-subty = '0000'. ls_pa0001-objps = '00'.
  ls_pa0001-orgeh = '90000002'. ls_pa0001-plans = '90000011'.
  ls_pa0001-werks = '9001'. ls_pa0001-persg = '1'.
  ls_pa0001-persk = 'A1'. ls_pa0001-ename = 'Schmidt Sandra'.
  APPEND ls_pa0001 TO lt_pa0001.

  " 90000003 - Weber Klaus - IT Manager - IT Dept
  CLEAR ls_pa0001.
  ls_pa0001-pernr = '90000003'. ls_pa0001-begda = '20220601'.
  ls_pa0001-endda = '99991231'. ls_pa0001-seqnr = '000'.
  ls_pa0001-subty = '0000'. ls_pa0001-objps = '00'.
  ls_pa0001-orgeh = '90000002'. ls_pa0001-plans = '90000010'.
  ls_pa0001-werks = '9001'. ls_pa0001-persg = '1'.
  ls_pa0001-persk = 'A2'. ls_pa0001-ename = 'Weber Klaus'.
  APPEND ls_pa0001 TO lt_pa0001.

  " 90000004 - Fischer Anna - HR Consultant - HR Dept
  CLEAR ls_pa0001.
  ls_pa0001-pernr = '90000004'. ls_pa0001-begda = '20240101'.
  ls_pa0001-endda = '99991231'. ls_pa0001-seqnr = '000'.
  ls_pa0001-subty = '0000'. ls_pa0001-objps = '00'.
  ls_pa0001-orgeh = '90000003'. ls_pa0001-plans = '90000012'.
  ls_pa0001-werks = '9001'. ls_pa0001-persg = '1'.
  ls_pa0001-persk = 'A1'. ls_pa0001-ename = 'Fischer Anna'.
  APPEND ls_pa0001 TO lt_pa0001.

  " 90000005 - Becker Frank - left 31.12.2023
  CLEAR ls_pa0001.
  ls_pa0001-pernr = '90000005'. ls_pa0001-begda = '20210901'.
  ls_pa0001-endda = '20231231'. ls_pa0001-seqnr = '000'.
  ls_pa0001-subty = '0000'. ls_pa0001-objps = '00'.
  ls_pa0001-orgeh = '90000002'. ls_pa0001-plans = '90000011'.
  ls_pa0001-werks = '9002'. ls_pa0001-persg = '1'.
  ls_pa0001-persk = 'U2'. ls_pa0001-ename = 'Becker Frank'.
  APPEND ls_pa0001 TO lt_pa0001.

  INSERT zhcm_pa0001 FROM TABLE lt_pa0001 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA0001.|.
  WRITE: / '90000001 - Mueller / ABAP Dev 90000011 / IT 90000002'.
  WRITE: / '90000002 - Schmidt / ABAP Dev 90000011 / IT 90000002'.
  WRITE: / '90000003 - Weber   / IT Mgr  90000010 / IT 90000002'.
  WRITE: / '90000004 - Fischer / HR Cons 90000012 / HR 90000003'.
  WRITE: / '90000005 - Becker  / ABAP Dev 90000011 / IT 90000002'.
