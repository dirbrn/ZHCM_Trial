*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_T512W
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_T512W.

DATA: lt_t512w TYPE TABLE OF zhcm_t512w,
      ls_t512w TYPE zhcm_t512w,
      lv_lines TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_t512w WHERE lgart IS NOT INITIAL.

  " M010 - Basic Salary
  CLEAR ls_t512w.
  ls_t512w-lgart = 'M010'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Basic Salary'.
  ls_t512w-kverg = '01'. ls_t512w-ktosl = 'MA01'.
  APPEND ls_t512w TO lt_t512w.

  " M020 - Transport Allowance
  CLEAR ls_t512w.
  ls_t512w-lgart = 'M020'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Transport Allowance'.
  ls_t512w-kverg = '02'. ls_t512w-ktosl = 'MA02'.
  APPEND ls_t512w TO lt_t512w.

  " M030 - Performance Bonus
  CLEAR ls_t512w.
  ls_t512w-lgart = 'M030'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Performance Bonus'.
  ls_t512w-kverg = '02'. ls_t512w-ktosl = 'MA02'.
  APPEND ls_t512w TO lt_t512w.

  " ST01 - Income Tax
  CLEAR ls_t512w.
  ls_t512w-lgart = 'ST01'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Income Tax'.
  ls_t512w-kverg = '04'. ls_t512w-ktosl = 'ST01'.
  APPEND ls_t512w TO lt_t512w.

  " SV01 - Social Insurance
  CLEAR ls_t512w.
  ls_t512w-lgart = 'SV01'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Social Insurance'.
  ls_t512w-kverg = '05'. ls_t512w-ktosl = 'SV01'.
  APPEND ls_t512w TO lt_t512w.

  " AB01 - Absence Deduction
  CLEAR ls_t512w.
  ls_t512w-lgart = 'AB01'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Absence Deduction'.
  ls_t512w-kverg = '03'. ls_t512w-ktosl = 'AB01'.
  APPEND ls_t512w TO lt_t512w.

  " 0050 - Overtime Balance
  CLEAR ls_t512w.
  ls_t512w-lgart = '0050'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Overtime Balance'.
  ls_t512w-kverg = '02'. ls_t512w-ktosl = 'MA02'.
  APPEND ls_t512w TO lt_t512w.

  " 0100 - Regular Hours
  CLEAR ls_t512w.
  ls_t512w-lgart = '0100'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Regular Hours'.
  ls_t512w-kverg = '01'. ls_t512w-ktosl = 'MA01'.
  APPEND ls_t512w TO lt_t512w.

  " 1000 - Productive Hours
  CLEAR ls_t512w.
  ls_t512w-lgart = '1000'. ls_t512w-langu = 'E'.
  ls_t512w-begda = '00010101'. ls_t512w-endda = '99991231'.
  ls_t512w-lgtxt = 'Productive Hours'.
  ls_t512w-kverg = '01'. ls_t512w-ktosl = 'MA01'.
  APPEND ls_t512w TO lt_t512w.

  INSERT zhcm_t512w FROM TABLE lt_t512w ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_T512W.|.
  WRITE: / 'Basic Pay:    M010 M020 M030'.
  WRITE: / 'Deductions:   ST01 SV01 AB01'.
  WRITE: / 'Time Types:   0050 0100 1000'.
