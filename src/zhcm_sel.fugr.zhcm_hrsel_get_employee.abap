FUNCTION zhcm_hrsel_get_employee.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_PERNR) TYPE  Z_PERNR OPTIONAL
*"     VALUE(IV_WERKS) TYPE  Z_WERKS OPTIONAL
*"     VALUE(IV_PERSG) TYPE  Z_PERSG OPTIONAL
*"     VALUE(IV_PERSK) TYPE  Z_PERSK OPTIONAL
*"     VALUE(IV_BEGDA) TYPE  BEGDA OPTIONAL
*"     VALUE(IV_ENDDA) TYPE  ENDDA OPTIONAL
*"     VALUE(IV_STAT2) TYPE  Z_STAT2 OPTIONAL
*"  EXPORTING
*"     VALUE(EV_SUBRC) TYPE  SYSUBRC
*"     VALUE(EV_COUNT) TYPE  INT4
*"  TABLES
*"      ET_EMPLOYEES STRUCTURE  ZHCM_PA0001
*"  EXCEPTIONS
*"      NOT_FOUND
*"      INVALID_SELECTION
*"----------------------------------------------------------------------
TYPES: tt_pernr TYPE TABLE OF z_pernr WITH DEFAULT KEY.

  DATA: lv_begda   TYPE begda,
        lv_endda   TYPE endda,
        lt_pernr   TYPE tt_pernr,
        lt_result  TYPE TABLE OF zhcm_pa0001,
        ls_emp     TYPE zhcm_pa0001.

  " Mindestens ein Selektionsparameter muss gesetzt sein
  IF iv_pernr IS INITIAL AND iv_werks IS INITIAL
 AND iv_persg IS INITIAL AND iv_persk IS INITIAL
 AND iv_stat2 IS INITIAL.
    RAISE invalid_selection.
  ENDIF.

  " Default date range
  lv_begda = COND #( WHEN iv_begda IS INITIAL
                     THEN '00010101' ELSE iv_begda ).
  lv_endda = COND #( WHEN iv_endda IS INITIAL
                     THEN '99991231' ELSE iv_endda ).

  ev_subrc = 0.
  ev_count = 0.
  CLEAR et_employees.

  " Selektion auf PA0001
  SELECT *
    FROM zhcm_pa0001
    WHERE begda <= @lv_endda
      AND endda >= @lv_begda
      AND ( @iv_pernr IS INITIAL OR pernr = @iv_pernr )
      AND ( @iv_werks IS INITIAL OR werks = @iv_werks )
      AND ( @iv_persg IS INITIAL OR persg = @iv_persg )
      AND ( @iv_persk IS INITIAL OR persk = @iv_persk )
    INTO TABLE @et_employees.

  IF sy-subrc <> 0.
    ev_subrc = 4.
    RAISE not_found.
  ENDIF.

  " Stat2-Filter nachgelagert via PA0000
 IF iv_stat2 IS NOT INITIAL.

    SELECT pernr
      FROM zhcm_pa0000
      WHERE stat2  = @iv_stat2
        AND begda <= @lv_endda
        AND endda >= @lv_begda
      INTO TABLE @lt_pernr.

    CLEAR lt_result.
    LOOP AT et_employees INTO ls_emp.
      READ TABLE lt_pernr WITH KEY table_line = ls_emp-pernr
        TRANSPORTING NO FIELDS.
      IF sy-subrc = 0.
        APPEND ls_emp TO lt_result.
      ENDIF.
    ENDLOOP.

    " ET_EMPLOYEES neu befüllen
    REFRESH et_employees.
    LOOP AT lt_result INTO ls_emp.
      APPEND ls_emp TO et_employees.
    ENDLOOP.

  ENDIF.

  DESCRIBE TABLE et_employees LINES ev_count.

  IF ev_count = 0.
    ev_subrc = 4.
    RAISE not_found.
  ENDIF.

ENDFUNCTION.
