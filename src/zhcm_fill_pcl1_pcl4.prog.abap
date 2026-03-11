*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PCL1_PCL4
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PCL1_PCL4.

DATA: lt_pcl1  TYPE TABLE OF zhcm_pcl1,
      ls_pcl1  TYPE zhcm_pcl1,
      lt_pcl4  TYPE TABLE OF zhcm_pcl4,
      ls_pcl4  TYPE zhcm_pcl4,
      lv_lines TYPE i,
      lv_json  TYPE string.

START-OF-SELECTION.

  " ---- PCL1 - Raw Time Events ----
  DELETE FROM zhcm_pcl1 WHERE pernr LIKE '9%'.

  " 90000001
  CLEAR ls_pcl1.
  ls_pcl1-pernr = '90000001'. ls_pcl1-relid = 'B1'.
  ls_pcl1-pabrj = '2024'. ls_pcl1-pabrp = '01'.
  lv_json = '{"events":[' &&
    '{"date":"20240108","time":"075500","type":"P10"},' &&
    '{"date":"20240108","time":"163000","type":"P20"},' &&
    '{"date":"20240109","time":"080000","type":"P10"},' &&
    '{"date":"20240109","time":"170000","type":"P20"}' &&
    ']}'.
  ls_pcl1-clustd = lv_json.
  APPEND ls_pcl1 TO lt_pcl1.

  " 90000002
  CLEAR ls_pcl1.
  ls_pcl1-pernr = '90000002'. ls_pcl1-relid = 'B1'.
  ls_pcl1-pabrj = '2024'. ls_pcl1-pabrp = '01'.
  lv_json = '{"events":[' &&
    '{"date":"20240108","time":"090000","type":"P10"},' &&
    '{"date":"20240108","time":"180000","type":"P20"}' &&
    ']}'.
  ls_pcl1-clustd = lv_json.
  APPEND ls_pcl1 TO lt_pcl1.

  " 90000003 - missing clock out
  CLEAR ls_pcl1.
  ls_pcl1-pernr = '90000003'. ls_pcl1-relid = 'B1'.
  ls_pcl1-pabrj = '2024'. ls_pcl1-pabrp = '01'.
  lv_json = '{"events":[' &&
    '{"date":"20240108","time":"073000","type":"P10","status":"open"}' &&
    ']}'.
  ls_pcl1-clustd = lv_json.
  APPEND ls_pcl1 TO lt_pcl1.

  INSERT zhcm_pcl1 FROM TABLE lt_pcl1 ACCEPTING DUPLICATE KEYS.
  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PCL1.|.
  WRITE: / '90000001 - 4 raw time events'.
  WRITE: / '90000002 - 2 raw time events'.
  WRITE: / '90000003 - 1 raw time event (open)'.

  " ---- PCL4 - Audit Log ----
  DELETE FROM zhcm_pcl4 WHERE pernr LIKE '9%'.

  " 90000001 - Change Log
  CLEAR ls_pcl4.
  ls_pcl4-pernr = '90000001'. ls_pcl4-relid = 'CD'.
  ls_pcl4-pabrj = '2024'. ls_pcl4-pabrp = '01'.
  lv_json = '{"changes":[' &&
    '{"date":"20240101","user":"ADMIN","infty":"0001",' &&
    '"field":"KOSTL","old":"1000","new":"2000"},' &&
    '{"date":"20240115","user":"ADMIN","infty":"0008",' &&
    '"field":"BET01","old":"3200","new":"3500"}' &&
    ']}'.
  ls_pcl4-clustd = lv_json.
  APPEND ls_pcl4 TO lt_pcl4.

  " 90000002 - Change Log
  CLEAR ls_pcl4.
  ls_pcl4-pernr = '90000002'. ls_pcl4-relid = 'CD'.
  ls_pcl4-pabrj = '2024'. ls_pcl4-pabrp = '01'.
  lv_json = '{"changes":[' &&
    '{"date":"20240301","user":"HRADMIN","infty":"0002",' &&
    '"field":"NACHN","old":"Schmitt","new":"Schmidt"}' &&
    ']}'.
  ls_pcl4-clustd = lv_json.
  APPEND ls_pcl4 TO lt_pcl4.

  " 90000003 - Audit Log
  CLEAR ls_pcl4.
  ls_pcl4-pernr = '90000003'. ls_pcl4-relid = 'AL'.
  ls_pcl4-pabrj = '2024'. ls_pcl4-pabrp = '01'.
  lv_json = '{"audits":[' &&
    '{"date":"20240601","user":"SYSTEM","action":"HIRE",' &&
    '"infty":"0000","massn":"01"},' &&
    '{"date":"20240801","user":"HRADMIN","action":"TRANSFER",' &&
    '"infty":"0001","kostl":"3000"}' &&
    ']}'.
  ls_pcl4-clustd = lv_json.
  APPEND ls_pcl4 TO lt_pcl4.

  INSERT zhcm_pcl4 FROM TABLE lt_pcl4 ACCEPTING DUPLICATE KEYS.
  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PCL4.|.
  WRITE: / '90000001 - 2 change log entries'.
  WRITE: / '90000002 - 1 change log entry'.
  WRITE: / '90000003 - 2 audit log entries'.
