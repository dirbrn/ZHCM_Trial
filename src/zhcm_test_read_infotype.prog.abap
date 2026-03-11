*&---------------------------------------------------------------------*
*& Report ZHCM_TEST_READ_INFOTYPE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_TEST_READ_INFOTYPE.

DATA: lt_pa0000 TYPE TABLE OF zhcm_pa0000,
      lt_pa0001 TYPE TABLE OF zhcm_pa0001,
      lt_pa0002 TYPE TABLE OF zhcm_pa0002,
      lt_pa0003 TYPE TABLE OF zhcm_pa0003,
      lt_pa0007 TYPE TABLE OF zhcm_pa0007,
      lt_pa0008 TYPE TABLE OF zhcm_pa0008,
      lt_pa0041 TYPE TABLE OF zhcm_pa0041,
      ls_pa0002 TYPE zhcm_pa0002,
      ls_pa0008 TYPE zhcm_pa0008,
      lv_subrc  TYPE sysubrc.

START-OF-SELECTION.

  " Test 1: IT0002 Personal Data
  CLEAR: lt_pa0000, lt_pa0001, lt_pa0002,
         lt_pa0003, lt_pa0007, lt_pa0008, lt_pa0041.

  CALL FUNCTION 'ZHCM_HR_READ_INFOTYPE'
    EXPORTING
      iv_pernr        = '90000001'
      iv_infty        = '0002'
    IMPORTING
      ev_subrc        = lv_subrc
    TABLES
      et_pa0000       = lt_pa0000
      et_pa0001       = lt_pa0001
      et_pa0002       = lt_pa0002
      et_pa0003       = lt_pa0003
      et_pa0007       = lt_pa0007
      et_pa0008       = lt_pa0008
      et_pa0041       = lt_pa0041
    EXCEPTIONS
      not_found       = 1
      invalid_inftype = 2
      OTHERS          = 3.

  WRITE: / '=== IT0002 Personal Data - 90000001 ==='.
  IF sy-subrc = 0.
    LOOP AT lt_pa0002 INTO ls_pa0002.
      WRITE: / |PERNR: { ls_pa0002-pernr }|.
      WRITE: / |Name:  { ls_pa0002-nachn } { ls_pa0002-vorna }|.
      WRITE: / |DoB:   { ls_pa0002-gbdat }|.
      WRITE: / |Natl:  { ls_pa0002-natio }|.
    ENDLOOP.
  ELSE.
    WRITE: / |Fehler: SY-SUBRC = { sy-subrc }|.
  ENDIF.

  SKIP.

  " Test 2: IT0008 Basic Pay
  CLEAR: lt_pa0000, lt_pa0001, lt_pa0002,
         lt_pa0003, lt_pa0007, lt_pa0008, lt_pa0041.

  CALL FUNCTION 'ZHCM_HR_READ_INFOTYPE'
    EXPORTING
      iv_pernr        = '90000001'
      iv_infty        = '0008'
    IMPORTING
      ev_subrc        = lv_subrc
    TABLES
      et_pa0000       = lt_pa0000
      et_pa0001       = lt_pa0001
      et_pa0002       = lt_pa0002
      et_pa0003       = lt_pa0003
      et_pa0007       = lt_pa0007
      et_pa0008       = lt_pa0008
      et_pa0041       = lt_pa0041
    EXCEPTIONS
      not_found       = 1
      invalid_inftype = 2
      OTHERS          = 3.

  WRITE: / '=== IT0008 Basic Pay - 90000001 ==='.
  IF sy-subrc = 0.
    LOOP AT lt_pa0008 INTO ls_pa0008.
      WRITE: / |PERNR:  { ls_pa0008-pernr }|.
      WRITE: / |Grade:  { ls_pa0008-trfgr } / { ls_pa0008-trfst }|.
      WRITE: / |LGA01:  { ls_pa0008-lga01 } { ls_pa0008-bet01 }|.
      WRITE: / |LGA02:  { ls_pa0008-lga02 } { ls_pa0008-bet02 }|.
    ENDLOOP.
  ELSE.
    WRITE: / |Fehler: SY-SUBRC = { sy-subrc }|.
  ENDIF.

  SKIP.

  " Test 3: Exception Test
  CLEAR: lt_pa0000, lt_pa0001, lt_pa0002,
         lt_pa0003, lt_pa0007, lt_pa0008, lt_pa0041.

  CALL FUNCTION 'ZHCM_HR_READ_INFOTYPE'
    EXPORTING
      iv_pernr        = '90000001'
      iv_infty        = '9999'
    IMPORTING
      ev_subrc        = lv_subrc
    TABLES
      et_pa0000       = lt_pa0000
      et_pa0001       = lt_pa0001
      et_pa0002       = lt_pa0002
      et_pa0003       = lt_pa0003
      et_pa0007       = lt_pa0007
      et_pa0008       = lt_pa0008
      et_pa0041       = lt_pa0041
    EXCEPTIONS
      not_found       = 1
      invalid_inftype = 2
      OTHERS          = 3.

  WRITE: / '=== Exception Test - Infotyp 9999 ==='.
  CASE sy-subrc.
    WHEN 2. WRITE: / 'OK - INVALID_INFTYPE ausgeloest'.
    WHEN OTHERS. WRITE: / |Unerwarteter SUBRC: { sy-subrc }|.
  ENDCASE.
