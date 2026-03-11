*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA2011
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA2011.

DATA: lt_pa2011 TYPE TABLE OF zhcm_pa2011,
      ls_pa2011 TYPE zhcm_pa2011,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa2011 WHERE pernr LIKE '9%'.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000001'. ls_pa2011-begda = '20240108'.
  ls_pa2011-seqnr = '000'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P10'. ls_pa2011-stdaz = '075500'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T001'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000001'. ls_pa2011-begda = '20240108'.
  ls_pa2011-seqnr = '001'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P20'. ls_pa2011-stdaz = '163000'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T001'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000001'. ls_pa2011-begda = '20240109'.
  ls_pa2011-seqnr = '000'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P10'. ls_pa2011-stdaz = '080000'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T001'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000001'. ls_pa2011-begda = '20240109'.
  ls_pa2011-seqnr = '001'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P20'. ls_pa2011-stdaz = '170000'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T001'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000002'. ls_pa2011-begda = '20240108'.
  ls_pa2011-seqnr = '000'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P10'. ls_pa2011-stdaz = '090000'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T002'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000002'. ls_pa2011-begda = '20240108'.
  ls_pa2011-seqnr = '001'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P20'. ls_pa2011-stdaz = '180000'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T002'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000003'. ls_pa2011-begda = '20240108'.
  ls_pa2011-seqnr = '000'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P10'. ls_pa2011-stdaz = '073000'.
  ls_pa2011-versl = '0'. ls_pa2011-termz = 'T001'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000004'. ls_pa2011-begda = '20240108'.
  ls_pa2011-seqnr = '000'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P10'. ls_pa2011-stdaz = '080000'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T003'.
  APPEND ls_pa2011 TO lt_pa2011.

  CLEAR ls_pa2011.
  ls_pa2011-pernr = '90000004'. ls_pa2011-begda = '20240108'.
  ls_pa2011-seqnr = '001'. ls_pa2011-endda = '99991231'.
  ls_pa2011-lgart = 'P20'. ls_pa2011-stdaz = '163000'.
  ls_pa2011-versl = '1'. ls_pa2011-termz = 'T003'.
  APPEND ls_pa2011 TO lt_pa2011.

  INSERT zhcm_pa2011 FROM TABLE lt_pa2011 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA2011.|.
  WRITE: / '90000001 - ClockIn/Out 08.01 + 09.01.2024'.
  WRITE: / '90000002 - ClockIn/Out 08.01.2024'.
  WRITE: / '90000003 - ClockIn only 08.01.2024 (open)'.
  WRITE: / '90000004 - ClockIn/Out 08.01.2024'.
