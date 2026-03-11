*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PA2002
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PA2002.

DATA: lt_pa2002 TYPE TABLE OF zhcm_pa2002,
      ls_pa2002 TYPE zhcm_pa2002,
      lv_lines  TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pa2002 WHERE pernr LIKE '9%'.

  " 90000001 - Overtime
  ls_pa2002 = VALUE #(
    pernr = '90000001' begda = '20240115' endda = '20240115' seqnr = '000'
    subty = '1100' awart = '1100'
    anzhl = '3' beguz = '170000' enduz = '200000'
    bwtxt = 'Project deadline' ). APPEND ls_pa2002 TO lt_pa2002.

  " 90000001 - Business Trip
  ls_pa2002 = VALUE #(
    pernr = '90000001' begda = '20240220' endda = '20240221' seqnr = '000'
    subty = '1200' awart = '1200'
    anzhl = '16' beguz = '080000' enduz = '170000'
    bwtxt = 'Customer visit Hamburg' ). APPEND ls_pa2002 TO lt_pa2002.

  " 90000002 - Overtime
  ls_pa2002 = VALUE #(
    pernr = '90000002' begda = '20240122' endda = '20240122' seqnr = '000'
    subty = '1100' awart = '1100'
    anzhl = '2' beguz = '170000' enduz = '190000'
    bwtxt = 'Month end closing' ). APPEND ls_pa2002 TO lt_pa2002.

  " 90000003 - Training
  ls_pa2002 = VALUE #(
    pernr = '90000003' begda = '20240410' endda = '20240412' seqnr = '000'
    subty = '1300' awart = '1300'
    anzhl = '24' beguz = '090000' enduz = '170000'
    bwtxt = 'SAP S4HANA Training' ). APPEND ls_pa2002 TO lt_pa2002.

  " 90000004 - Business Trip
  ls_pa2002 = VALUE #(
    pernr = '90000004' begda = '20240515' endda = '20240515' seqnr = '000'
    subty = '1200' awart = '1200'
    anzhl = '8' beguz = '080000' enduz = '170000'
    bwtxt = 'Onboarding Munich' ). APPEND ls_pa2002 TO lt_pa2002.

  " 90000004 - Overtime
  ls_pa2002 = VALUE #(
    pernr = '90000004' begda = '20240620' endda = '20240620' seqnr = '000'
    subty = '1100' awart = '1100'
    anzhl = '4' beguz = '170000' enduz = '210000'
    bwtxt = 'Go live support' ). APPEND ls_pa2002 TO lt_pa2002.

  INSERT zhcm_pa2002 FROM TABLE lt_pa2002 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PA2002.|.
  WRITE: / '90000001 - Overtime 3h / Business Trip 16h'.
  WRITE: / '90000002 - Overtime 2h'.
  WRITE: / '90000003 - Training 24h'.
  WRITE: / '90000004 - Business Trip 8h / Overtime 4h'.
