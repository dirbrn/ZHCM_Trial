*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA0008
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA0008.

DATA: lt_pa0008 TYPE TABLE OF zhcm_pa0008,
      ls_pa0008 TYPE zhcm_pa0008,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa0008 WHERE pernr LIKE '9%'.

  " 90000001 - Thomas Mueller - Senior Staff A2/03
  CLEAR ls_pa0008.
  ls_pa0008-pernr = '90000001'. ls_pa0008-begda = '20230101'.
  ls_pa0008-endda = '99991231'. ls_pa0008-seqnr = '000'.
  ls_pa0008-trfgr = 'E4'. ls_pa0008-trfst = '03'.
  ls_pa0008-bsgrd = '100'.
  ls_pa0008-lga01 = 'M010'. ls_pa0008-bet01 = '3500'.
  ls_pa0008-lga02 = 'M020'. ls_pa0008-bet02 = '350'.
  APPEND ls_pa0008 TO lt_pa0008.

  " 90000002 - Sandra Schmidt - Salaried A1/02
  CLEAR ls_pa0008.
  ls_pa0008-pernr = '90000002'. ls_pa0008-begda = '20230301'.
  ls_pa0008-endda = '99991231'. ls_pa0008-seqnr = '000'.
  ls_pa0008-trfgr = 'E3'. ls_pa0008-trfst = '02'.
  ls_pa0008-bsgrd = '100'.
  ls_pa0008-lga01 = 'M010'. ls_pa0008-bet01 = '3200'.
  ls_pa0008-lga02 = 'M020'. ls_pa0008-bet02 = '320'.
  APPEND ls_pa0008 TO lt_pa0008.

  " 90000003 - Klaus Weber - Senior Staff A2/03
  CLEAR ls_pa0008.
  ls_pa0008-pernr = '90000003'. ls_pa0008-begda = '20220601'.
  ls_pa0008-endda = '99991231'. ls_pa0008-seqnr = '000'.
  ls_pa0008-trfgr = 'E4'. ls_pa0008-trfst = '03'.
  ls_pa0008-bsgrd = '100'.
  ls_pa0008-lga01 = 'M010'. ls_pa0008-bet01 = '4500'.
  ls_pa0008-lga02 = 'M020'. ls_pa0008-bet02 = '450'.
  APPEND ls_pa0008 TO lt_pa0008.

  " 90000004 - Anna Fischer - Salaried A1/01
  CLEAR ls_pa0008.
  ls_pa0008-pernr = '90000004'. ls_pa0008-begda = '20240101'.
  ls_pa0008-endda = '99991231'. ls_pa0008-seqnr = '000'.
  ls_pa0008-trfgr = 'E2'. ls_pa0008-trfst = '01'.
  ls_pa0008-bsgrd = '100'.
  ls_pa0008-lga01 = 'M010'. ls_pa0008-bet01 = '2800'.
  ls_pa0008-lga02 = 'M020'. ls_pa0008-bet02 = '280'.
  APPEND ls_pa0008 TO lt_pa0008.

  " 90000005 - Frank Becker - left 31.12.2023
  CLEAR ls_pa0008.
  ls_pa0008-pernr = '90000005'. ls_pa0008-begda = '20210901'.
  ls_pa0008-endda = '20231231'. ls_pa0008-seqnr = '000'.
  ls_pa0008-trfgr = 'E3'. ls_pa0008-trfst = '02'.
  ls_pa0008-bsgrd = '100'.
  ls_pa0008-lga01 = 'M010'. ls_pa0008-bet01 = '3800'.
  ls_pa0008-lga02 = 'M020'. ls_pa0008-bet02 = '380'.
  APPEND ls_pa0008 TO lt_pa0008.

  INSERT zhcm_pa0008 FROM TABLE lt_pa0008 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA0008.|.
  WRITE: / '90000001 - Mueller / E4/03 / 3500 + 350'.
  WRITE: / '90000002 - Schmidt / E3/02 / 3200 + 320'.
  WRITE: / '90000003 - Weber   / E4/03 / 4500 + 450'.
  WRITE: / '90000004 - Fischer / E2/01 / 2800 + 280'.
  WRITE: / '90000005 - Becker  / E3/02 / 3800 + 380'.
