FUNCTION ZHCM_HR_READ_INFOTYPE.
*"----------------------------------------------------------------------
*"*"Lokale Schnittstelle:
*"  IMPORTING
*"     VALUE(IV_PERNR) TYPE  Z_PERNR
*"     VALUE(IV_INFTY) TYPE  Z_INFTY
*"     VALUE(IV_BEGDA) TYPE  BEGDA OPTIONAL
*"     VALUE(IV_ENDDA) TYPE  ENDDA OPTIONAL
*"  EXPORTING
*"     VALUE(EV_SUBRC) TYPE  SYSUBRC
*"  TABLES
*"      ET_PA0000 STRUCTURE  ZHCM_PA0000
*"      ET_PA0001 STRUCTURE  ZHCM_PA0001
*"      ET_PA0002 STRUCTURE  ZHCM_PA0002
*"      ET_PA0003 STRUCTURE  ZHCM_PA0003
*"      ET_PA0007 STRUCTURE  ZHCM_PA0007
*"      ET_PA0008 STRUCTURE  ZHCM_PA0008
*"      ET_PA0041 STRUCTURE  ZHCM_PA0041
*"  EXCEPTIONS
*"      NOT_FOUND
*"      INVALID_INFTYPE
*"----------------------------------------------------------------------
 DATA: lv_begda TYPE begda,
        lv_endda TYPE endda.

  " Default date range
  lv_begda = COND #( WHEN iv_begda IS INITIAL
                     THEN '00010101' ELSE iv_begda ).
  lv_endda = COND #( WHEN iv_endda IS INITIAL
                     THEN '99991231' ELSE iv_endda ).

  ev_subrc = 0.
  CLEAR: et_pa0000, et_pa0001, et_pa0002,
         et_pa0003, et_pa0007, et_pa0008, et_pa0041.

  CASE iv_infty.

    WHEN '0000'.
      SELECT * FROM zhcm_pa0000 INTO TABLE et_pa0000
        WHERE pernr = iv_pernr
          AND begda <= lv_endda
          AND endda >= lv_begda.
      IF sy-subrc <> 0. ev_subrc = 4. RAISE not_found. ENDIF.

    WHEN '0001'.
      SELECT * FROM zhcm_pa0001 INTO TABLE et_pa0001
        WHERE pernr = iv_pernr
          AND begda <= lv_endda
          AND endda >= lv_begda.
      IF sy-subrc <> 0. ev_subrc = 4. RAISE not_found. ENDIF.

    WHEN '0002'.
      SELECT * FROM zhcm_pa0002 INTO TABLE et_pa0002
        WHERE pernr = iv_pernr
          AND begda <= lv_endda
          AND endda >= lv_begda.
      IF sy-subrc <> 0. ev_subrc = 4. RAISE not_found. ENDIF.

    WHEN '0003'.
      SELECT * FROM zhcm_pa0003 INTO TABLE et_pa0003
        WHERE pernr = iv_pernr
          AND begda <= lv_endda
          AND endda >= lv_begda.
      IF sy-subrc <> 0. ev_subrc = 4. RAISE not_found. ENDIF.

    WHEN '0007'.
      SELECT * FROM zhcm_pa0007 INTO TABLE et_pa0007
        WHERE pernr = iv_pernr
          AND begda <= lv_endda
          AND endda >= lv_begda.
      IF sy-subrc <> 0. ev_subrc = 4. RAISE not_found. ENDIF.

    WHEN '0008'.
      SELECT * FROM zhcm_pa0008 INTO TABLE et_pa0008
        WHERE pernr = iv_pernr
          AND begda <= lv_endda
          AND endda >= lv_begda.
      IF sy-subrc <> 0. ev_subrc = 4. RAISE not_found. ENDIF.

    WHEN '0041'.
      SELECT * FROM zhcm_pa0041 INTO TABLE et_pa0041
        WHERE pernr = iv_pernr
          AND begda <= lv_endda
          AND endda >= lv_begda.
      IF sy-subrc <> 0. ev_subrc = 4. RAISE not_found. ENDIF.

    WHEN OTHERS.
      RAISE invalid_inftype.

  ENDCASE.

ENDFUNCTION.
