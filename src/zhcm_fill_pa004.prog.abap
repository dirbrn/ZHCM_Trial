*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA004
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA004.


DATA: lt_pa0041 TYPE TABLE OF zhcm_pa0041,
      ls_pa0041 TYPE zhcm_pa0041,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa0041 WHERE pernr LIKE '9%'.

  ls_pa0041 = VALUE #(
    pernr = '90000001' begda = '20230101' endda = '99991231' seqnr = '000'
    dar01 = '01' dat01 = '20230101'
    dar02 = '02' dat02 = '20230101'
    dar03 = '04' dat03 = '20230630' ). APPEND ls_pa0041 TO lt_pa0041.

  ls_pa0041 = VALUE #(
    pernr = '90000002' begda = '20230301' endda = '99991231' seqnr = '000'
    dar01 = '01' dat01 = '20230301'
    dar02 = '02' dat02 = '20230301'
    dar03 = '04' dat03 = '20230831' ). APPEND ls_pa0041 TO lt_pa0041.

  ls_pa0041 = VALUE #(
    pernr = '90000003' begda = '20220601' endda = '99991231' seqnr = '000'
    dar01 = '01' dat01 = '20220601'
    dar02 = '02' dat02 = '20180101'
    dar03 = '05' dat03 = '20240601' ). APPEND ls_pa0041 TO lt_pa0041.

  ls_pa0041 = VALUE #(
    pernr = '90000004' begda = '20240101' endda = '99991231' seqnr = '000'
    dar01 = '01' dat01 = '20240101'
    dar02 = '02' dat02 = '20240101'
    dar03 = '04' dat03 = '20240630' ). APPEND ls_pa0041 TO lt_pa0041.

  ls_pa0041 = VALUE #(
    pernr = '90000005' begda = '20210901' endda = '20231231' seqnr = '000'
    dar01 = '01' dat01 = '20210901'
    dar02 = '02' dat02 = '20150101'
    dar03 = '03' dat03 = '20210901' ). APPEND ls_pa0041 TO lt_pa0041.

  INSERT zhcm_pa0041 FROM TABLE lt_pa0041 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA0041.|.
  WRITE: / '90000001 - Entry 01.01.2023'.
  WRITE: / '90000002 - Entry 01.03.2023'.
  WRITE: / '90000003 - Entry 01.06.2022'.
  WRITE: / '90000004 - Entry 01.01.2024'.
  WRITE: / '90000005 - Entry 01.09.2021'.
