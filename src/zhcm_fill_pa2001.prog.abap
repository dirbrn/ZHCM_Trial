*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA2001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA2001.

DATA: lt_pa2001 TYPE TABLE OF zhcm_pa2001,
      ls_pa2001 TYPE zhcm_pa2001,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa2001 WHERE pernr LIKE '9%'.

  " 90000001 - Annual Leave
  ls_pa2001 = VALUE #(
    pernr = '90000001' begda = '20240610' endda = '20240614' seqnr = '000'
    subty = '0100' awart = '0100'
    abwtg = '5' stdaz = '40'
    kverb = 'X' bwtxt = 'Summer vacation' ). APPEND ls_pa2001 TO lt_pa2001.

  " 90000001 - Sick Leave
  ls_pa2001 = VALUE #(
    pernr = '90000001' begda = '20240201' endda = '20240202' seqnr = '000'
    subty = '0200' awart = '0200'
    abwtg = '2' stdaz = '16'
    kverb = ' ' bwtxt = 'Flu' ). APPEND ls_pa2001 TO lt_pa2001.

  " 90000002 - Annual Leave
  ls_pa2001 = VALUE #(
    pernr = '90000002' begda = '20240701' endda = '20240712' seqnr = '000'
    subty = '0100' awart = '0100'
    abwtg = '10' stdaz = '80'
    kverb = 'X' bwtxt = 'Holiday trip' ). APPEND ls_pa2001 TO lt_pa2001.

  " 90000003 - Special Leave
  ls_pa2001 = VALUE #(
    pernr = '90000003' begda = '20240315' endda = '20240315' seqnr = '000'
    subty = '0300' awart = '0300'
    abwtg = '1' stdaz = '8'
    kverb = ' ' bwtxt = 'Moving day' ). APPEND ls_pa2001 TO lt_pa2001.

  " 90000003 - Annual Leave
  ls_pa2001 = VALUE #(
    pernr = '90000003' begda = '20240801' endda = '20240819' seqnr = '000'
    subty = '0100' awart = '0100'
    abwtg = '14' stdaz = '112'
    kverb = 'X' bwtxt = 'Summer vacation' ). APPEND ls_pa2001 TO lt_pa2001.

  " 90000004 - Sick Leave
  ls_pa2001 = VALUE #(
    pernr = '90000004' begda = '20240305' endda = '20240307' seqnr = '000'
    subty = '0200' awart = '0200'
    abwtg = '3' stdaz = '24'
    kverb = ' ' bwtxt = 'Cold' ). APPEND ls_pa2001 TO lt_pa2001.

  INSERT zhcm_pa2001 FROM TABLE lt_pa2001 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA2001.|.
  WRITE: / '90000001 - Annual Leave 5d / Sick 2d'.
  WRITE: / '90000002 - Annual Leave 10d'.
  WRITE: / '90000003 - Special Leave 1d / Annual Leave 14d'.
  WRITE: / '90000004 - Sick Leave 3d'.
