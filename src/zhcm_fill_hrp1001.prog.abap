*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_HRP1001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_HRP1001.

DATA: lt_hrp1001 TYPE TABLE OF zhcm_hrp1001,
      ls_hrp1001 TYPE zhcm_hrp1001,
      lv_lines   TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_hrp1001 WHERE objid LIKE '9%'.

  " S 90000010 (IT Manager) belongs to O 90000002 (IT Dept)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'S'. ls_hrp1001-objid = '90000010'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '002'.
  ls_hrp1001-sclas = 'O'. ls_hrp1001-sobid = '90000002'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " S 90000011 (ABAP Developer) belongs to O 90000002 (IT Dept)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'S'. ls_hrp1001-objid = '90000011'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '002'.
  ls_hrp1001-sclas = 'O'. ls_hrp1001-sobid = '90000002'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " S 90000012 (HR Consultant) belongs to O 90000003 (HR Dept)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'S'. ls_hrp1001-objid = '90000012'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '002'.
  ls_hrp1001-sclas = 'O'. ls_hrp1001-sobid = '90000003'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " O 90000002 (IT Dept) belongs to O 90000001 (Head Office)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'O'. ls_hrp1001-objid = '90000002'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '002'.
  ls_hrp1001-sclas = 'O'. ls_hrp1001-sobid = '90000001'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " O 90000003 (HR Dept) belongs to O 90000001 (Head Office)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'O'. ls_hrp1001-objid = '90000003'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '002'.
  ls_hrp1001-sclas = 'O'. ls_hrp1001-sobid = '90000001'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " P 90000001 (Mueller) holder of S 90000011 (ABAP Developer)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'P'. ls_hrp1001-objid = '90000001'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '008'.
  ls_hrp1001-sclas = 'S'. ls_hrp1001-sobid = '90000011'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " P 90000002 (Schmidt) holder of S 90000011 (ABAP Developer)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'P'. ls_hrp1001-objid = '90000002'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230301'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '008'.
  ls_hrp1001-sclas = 'S'. ls_hrp1001-sobid = '90000011'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " P 90000003 (Weber) holder of S 90000010 (IT Manager)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'P'. ls_hrp1001-objid = '90000003'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20220601'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '008'.
  ls_hrp1001-sclas = 'S'. ls_hrp1001-sobid = '90000010'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " P 90000004 (Fischer) holder of S 90000012 (HR Consultant)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'P'. ls_hrp1001-objid = '90000004'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20240101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '008'.
  ls_hrp1001-sclas = 'S'. ls_hrp1001-sobid = '90000012'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  " S 90000011 (ABAP Developer) describes C 90000020 (SW Developer)
  CLEAR ls_hrp1001.
  ls_hrp1001-otype = 'S'. ls_hrp1001-objid = '90000011'.
  ls_hrp1001-istat = '1'. ls_hrp1001-begda = '20230101'.
  ls_hrp1001-endda = '99991231'.
  ls_hrp1001-rsign = 'A'. ls_hrp1001-relat = '007'.
  ls_hrp1001-sclas = 'C'. ls_hrp1001-sobid = '90000020'.
  APPEND ls_hrp1001 TO lt_hrp1001.

  INSERT zhcm_hrp1001 FROM TABLE lt_hrp1001 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_HRP1001.|.
  WRITE: / 'S→O: Positions linked to Org Units'.
  WRITE: / 'O→O: Departments linked to Head Office'.
  WRITE: / 'P→S: Persons linked to Positions'.
  WRITE: / 'S→C: Positions linked to Jobs'.
