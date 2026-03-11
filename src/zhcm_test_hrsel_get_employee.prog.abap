*&---------------------------------------------------------------------*
*& Report ZHCM_TEST_HRSEL_GET_EMPLOYEE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_TEST_HRSEL_GET_EMPLOYEE.

DATA: lt_employees TYPE TABLE OF zhcm_pa0001,
      ls_emp       TYPE zhcm_pa0001,
      lv_subrc     TYPE sysubrc,
      lv_count     TYPE int4.

START-OF-SELECTION.

  " Test 1: Alle Mitarbeiter Personalbereich 9001
  CALL FUNCTION 'ZHCM_HRSEL_GET_EMPLOYEE'
    EXPORTING
      iv_werks         = '9001'
    IMPORTING
      ev_subrc         = lv_subrc
      ev_count         = lv_count
    TABLES
      et_employees     = lt_employees
    EXCEPTIONS
      not_found        = 1
      invalid_selection = 2
      OTHERS           = 3.

  WRITE: / '=== Alle Mitarbeiter Werks 9001 ==='.
  WRITE: / |Gefunden: { lv_count }|.
  LOOP AT lt_employees INTO ls_emp.
    WRITE: / |{ ls_emp-pernr } { ls_emp-ename }|.
  ENDLOOP.

  SKIP.

  " Test 2: Nur aktive Mitarbeiter (STAT2 = 3)
  CLEAR lt_employees.
  CALL FUNCTION 'ZHCM_HRSEL_GET_EMPLOYEE'
    EXPORTING
      iv_werks         = '9001'
      iv_stat2         = '3'
    IMPORTING
      ev_subrc         = lv_subrc
      ev_count         = lv_count
    TABLES
      et_employees     = lt_employees
    EXCEPTIONS
      not_found        = 1
      invalid_selection = 2
      OTHERS           = 3.

  WRITE: / '=== Aktive Mitarbeiter Werks 9001 (STAT2=3) ==='.
  WRITE: / |Gefunden: { lv_count }|.
  LOOP AT lt_employees INTO ls_emp.
    WRITE: / |{ ls_emp-pernr } { ls_emp-ename }|.
  ENDLOOP.

  SKIP.

  " Test 3: Exception Test - keine Kriterien
  CLEAR lt_employees.
  CALL FUNCTION 'ZHCM_HRSEL_GET_EMPLOYEE'
    IMPORTING
      ev_subrc         = lv_subrc
      ev_count         = lv_count
    TABLES
      et_employees     = lt_employees
    EXCEPTIONS
      not_found        = 1
      invalid_selection = 2
      OTHERS           = 3.

  WRITE: / '=== Exception Test - keine Kriterien ==='.
  CASE sy-subrc.
    WHEN 2. WRITE: / 'OK - INVALID_SELECTION ausgeloest'.
    WHEN OTHERS. WRITE: / |Unerwarteter SUBRC: { sy-subrc }|.
  ENDCASE.
