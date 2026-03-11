*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_T554S
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_T554S.

DATA: lt_t554s TYPE TABLE OF zhcm_t554s,
      ls_t554s TYPE zhcm_t554s,
      lv_lines TYPE i.

START-OF-SELECTION.

  " Clear existing test data
  DELETE FROM zhcm_t554s WHERE awart IS NOT INITIAL.

  " Absence Types (ABSCAT = 'A')
  ls_t554s = VALUE #( awart = '0100' langu = 'E' atext = 'Annual Leave'           ktart = '01' abscat = 'A' ). APPEND ls_t554s TO lt_t554s.
  ls_t554s = VALUE #( awart = '0200' langu = 'E' atext = 'Sick Leave'             ktart = '02' abscat = 'A' ). APPEND ls_t554s TO lt_t554s.
  ls_t554s = VALUE #( awart = '0300' langu = 'E' atext = 'Special Leave'          ktart = '03' abscat = 'A' ). APPEND ls_t554s TO lt_t554s.
  ls_t554s = VALUE #( awart = '0400' langu = 'E' atext = 'Parental Leave'         ktart = '05' abscat = 'A' ). APPEND ls_t554s TO lt_t554s.
  ls_t554s = VALUE #( awart = '0500' langu = 'E' atext = 'Unpaid Leave'           ktart = '03' abscat = 'A' ). APPEND ls_t554s TO lt_t554s.
  " Attendance Types (ABSCAT = 'P')
  ls_t554s = VALUE #( awart = '1000' langu = 'E' atext = 'Regular Attendance'     ktart = '  ' abscat = 'P' ). APPEND ls_t554s TO lt_t554s.
  ls_t554s = VALUE #( awart = '1100' langu = 'E' atext = 'Overtime'               ktart = '04' abscat = 'P' ). APPEND ls_t554s TO lt_t554s.
  ls_t554s = VALUE #( awart = '1200' langu = 'E' atext = 'Business Trip'          ktart = '  ' abscat = 'P' ). APPEND ls_t554s TO lt_t554s.
  ls_t554s = VALUE #( awart = '1300' langu = 'E' atext = 'Training'               ktart = '  ' abscat = 'P' ). APPEND ls_t554s TO lt_t554s.

  " Insert into DB
  INSERT zhcm_t554s FROM TABLE lt_t554s ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_T554S.|.
  WRITE: / 'Absence Types (A):'.
  WRITE: / '  0100 - Annual Leave'.
  WRITE: / '  0200 - Sick Leave'.
  WRITE: / '  0300 - Special Leave'.
  WRITE: / '  0400 - Parental Leave'.
  WRITE: / '  0500 - Unpaid Leave'.
  WRITE: / 'Attendance Types (P):'.
  WRITE: / '  1000 - Regular Attendance'.
  WRITE: / '  1100 - Overtime'.
  WRITE: / '  1200 - Business Trip'.
  WRITE: / '  1300 - Training'.
