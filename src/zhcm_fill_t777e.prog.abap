*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_T777E
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_T777E.

DATA: lt_t777e TYPE TABLE OF zhcm_t777e,
      ls_t777e TYPE zhcm_t777e,
      lv_lines TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_t777e WHERE otype IS NOT INITIAL.

  " O - Organizational Unit
  CLEAR ls_t777e.
  ls_t777e-otype = 'O'. ls_t777e-istat = '1'.
  ls_t777e-tclas = 'O'. ls_t777e-begda = '00010101'.
  ls_t777e-endda = '99991231'.
  ls_t777e-tinfo = '1'.
  APPEND ls_t777e TO lt_t777e.

  " S - Position
  CLEAR ls_t777e.
  ls_t777e-otype = 'S'. ls_t777e-istat = '1'.
  ls_t777e-tclas = 'S'. ls_t777e-begda = '00010101'.
  ls_t777e-endda = '99991231'.
  ls_t777e-tinfo = '1'.
  APPEND ls_t777e TO lt_t777e.

  " P - Person
  CLEAR ls_t777e.
  ls_t777e-otype = 'P'. ls_t777e-istat = '1'.
  ls_t777e-tclas = 'P'. ls_t777e-begda = '00010101'.
  ls_t777e-endda = '99991231'.
  ls_t777e-tinfo = '1'.
  APPEND ls_t777e TO lt_t777e.

  " C - Job
  CLEAR ls_t777e.
  ls_t777e-otype = 'C'. ls_t777e-istat = '1'.
  ls_t777e-tclas = 'C'. ls_t777e-begda = '00010101'.
  ls_t777e-endda = '99991231'.
  ls_t777e-tinfo = '2'.
  APPEND ls_t777e TO lt_t777e.

  INSERT zhcm_t777e FROM TABLE lt_t777e ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_T777E.|.
  WRITE: / 'O - Org Unit  / TC1'.
  WRITE: / 'S - Position  / TC1'.
  WRITE: / 'P - Person    / TC1'.
  WRITE: / 'C - Job       / TC2'.
