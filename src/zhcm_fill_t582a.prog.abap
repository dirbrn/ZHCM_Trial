*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_T582A
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_T582A.

DATA: lt_t582a TYPE TABLE OF zhcm_t582a,
      ls_t582a TYPE zhcm_t582a,
      lv_lines TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_t582a WHERE infty IS NOT INITIAL.

  " IT0000 - Actions - Time Constraint 1 (exactly once)
  CLEAR ls_t582a.
  ls_t582a-infty = '0000'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '1'. ls_t582a-adays = '0'. ls_t582a-record = '1'.
  APPEND ls_t582a TO lt_t582a.

  " IT0001 - Org Assignment - Time Constraint 1
  CLEAR ls_t582a.
  ls_t582a-infty = '0001'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '1'. ls_t582a-adays = '0'. ls_t582a-record = '1'.
  APPEND ls_t582a TO lt_t582a.

  " IT0002 - Personal Data - Time Constraint 1
  CLEAR ls_t582a.
  ls_t582a-infty = '0002'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '1'. ls_t582a-adays = '0'. ls_t582a-record = '1'.
  APPEND ls_t582a TO lt_t582a.

  " IT0003 - Payroll Status - Time Constraint 1
  CLEAR ls_t582a.
  ls_t582a-infty = '0003'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '1'. ls_t582a-adays = '0'. ls_t582a-record = '1'.
  APPEND ls_t582a TO lt_t582a.

  " IT0007 - Work Schedule - Time Constraint 1
  CLEAR ls_t582a.
  ls_t582a-infty = '0007'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '1'. ls_t582a-adays = '0'. ls_t582a-record = '1'.
  APPEND ls_t582a TO lt_t582a.

  " IT0008 - Basic Pay - Time Constraint 1
  CLEAR ls_t582a.
  ls_t582a-infty = '0008'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '1'. ls_t582a-adays = '0'. ls_t582a-record = '1'.
  APPEND ls_t582a TO lt_t582a.

  " IT0041 - Date Specifications - Time Constraint 1
  CLEAR ls_t582a.
  ls_t582a-infty = '0041'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '1'. ls_t582a-adays = '0'. ls_t582a-record = '1'.
  APPEND ls_t582a TO lt_t582a.

  " IT2001 - Absences - Time Constraint 3 (may overlap)
  CLEAR ls_t582a.
  ls_t582a-infty = '2001'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '3'. ls_t582a-adays = '0'. ls_t582a-record = '0'.
  APPEND ls_t582a TO lt_t582a.

  " IT2002 - Attendances - Time Constraint 3
  CLEAR ls_t582a.
  ls_t582a-infty = '2002'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '3'. ls_t582a-adays = '0'. ls_t582a-record = '0'.
  APPEND ls_t582a TO lt_t582a.

  " IT2006 - Absence Quotas - Time Constraint 2 (no overlap)
  CLEAR ls_t582a.
  ls_t582a-infty = '2006'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '2'. ls_t582a-adays = '0'. ls_t582a-record = '0'.
  APPEND ls_t582a TO lt_t582a.

  " IT2011 - Time Events - Time Constraint 3
  CLEAR ls_t582a.
  ls_t582a-infty = '2011'. ls_t582a-tclas = 'P'.
  ls_t582a-begda = '00010101'. ls_t582a-endda = '99991231'.
  ls_t582a-tinfo = '3'. ls_t582a-adays = '0'. ls_t582a-record = '0'.
  APPEND ls_t582a TO lt_t582a.

  INSERT zhcm_t582a FROM TABLE lt_t582a ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_T582A.|.
  WRITE: / 'TC1: IT0000/0001/0002/0003/0007/0008/0041'.
  WRITE: / 'TC2: IT2006'.
  WRITE: / 'TC3: IT2001/2002/2011'.
