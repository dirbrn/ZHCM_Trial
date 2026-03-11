*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_HRP1000
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_HRP1000.

DATA: lt_hrp1000 TYPE TABLE OF zhcm_hrp1000,
      ls_hrp1000 TYPE zhcm_hrp1000,
      lv_lines   TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_hrp1000 WHERE objid LIKE '9%'.

  " Organizational Units (O)
  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'O'. ls_hrp1000-objid = '90000001'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '1'.
  ls_hrp1000-stext = 'Head Office Berlin'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'O'. ls_hrp1000-objid = '90000002'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '1'.
  ls_hrp1000-stext = 'IT Department'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'O'. ls_hrp1000-objid = '90000003'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '1'.
  ls_hrp1000-stext = 'HR Department'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  " Positions (S)
  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'S'. ls_hrp1000-objid = '90000010'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '1'.
  ls_hrp1000-stext = 'IT Manager'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'S'. ls_hrp1000-objid = '90000011'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '1'.
  ls_hrp1000-stext = 'ABAP Developer'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'S'. ls_hrp1000-objid = '90000012'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '1'.
  ls_hrp1000-stext = 'HR Consultant'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  " Jobs (C)
  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'C'. ls_hrp1000-objid = '90000020'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '2'.
  ls_hrp1000-stext = 'Software Developer'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  CLEAR ls_hrp1000.
  ls_hrp1000-otype = 'C'. ls_hrp1000-objid = '90000021'.
  ls_hrp1000-istat = '1'. ls_hrp1000-begda = '20230101'.
  ls_hrp1000-endda = '99991231'. ls_hrp1000-priox = '2'.
  ls_hrp1000-stext = 'HR Specialist'.
  APPEND ls_hrp1000 TO lt_hrp1000.

  INSERT zhcm_hrp1000 FROM TABLE lt_hrp1000 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_HRP1000.|.
  WRITE: / 'Org Units:  90000001 Head Office / 90000002 IT / 90000003 HR'.
  WRITE: / 'Positions:  90000010 IT Mgr / 90000011 ABAP Dev / 90000012 HR'.
  WRITE: / 'Jobs:       90000020 SW Developer / 90000021 HR Specialist'.
