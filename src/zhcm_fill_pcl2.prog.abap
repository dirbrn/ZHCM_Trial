*&---------------------------------------------------------------------*
*& Report ZHCM_FILL_PCL2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_FILL_PCL2.

DATA: lt_pcl2 TYPE TABLE OF zhcm_pcl2,
      ls_pcl2 TYPE zhcm_pcl2,
      lv_lines TYPE i.

START-OF-SELECTION.

  DELETE FROM zhcm_pcl2 WHERE pernr LIKE '9%'.

  " 90000001 - B2 Time Evaluation Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000001'. ls_pcl2-relid = 'B2'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"zeitarten":[{"lgart":"0050","anzhl":8.50},{"lgart":"0100","anzhl":168.00}],"ZL":[{"lgart":"1000","anzhl":168.00}],"RT":[{"lgart":"M010","betrg":3500.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  " 90000001 - RD Payroll Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000001'. ls_pcl2-relid = 'RD'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"brutto":3500.00,"netto":2450.00,"lohnarten":[{"lgart":"M010","betrg":3500.00},{"lgart":"ST01","betrg":-630.00},{"lgart":"SV01","betrg":-420.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  " 90000002 - B2 Time Evaluation Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000002'. ls_pcl2-relid = 'B2'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"zeitarten":[{"lgart":"0050","anzhl":2.00},{"lgart":"0100","anzhl":160.00}],"ZL":[{"lgart":"1000","anzhl":160.00}],"RT":[{"lgart":"M010","betrg":3200.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  " 90000002 - RD Payroll Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000002'. ls_pcl2-relid = 'RD'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"brutto":3200.00,"netto":2240.00,"lohnarten":[{"lgart":"M010","betrg":3200.00},{"lgart":"ST01","betrg":-576.00},{"lgart":"SV01","betrg":-384.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  " 90000003 - B2 Time Evaluation Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000003'. ls_pcl2-relid = 'B2'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"zeitarten":[{"lgart":"0050","anzhl":0.00},{"lgart":"0100","anzhl":176.00}],"ZL":[{"lgart":"1000","anzhl":176.00}],"RT":[{"lgart":"M010","betrg":4500.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  " 90000003 - RD Payroll Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000003'. ls_pcl2-relid = 'RD'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"brutto":4500.00,"netto":3150.00,"lohnarten":[{"lgart":"M010","betrg":4500.00},{"lgart":"ST01","betrg":-810.00},{"lgart":"SV01","betrg":-540.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  " 90000004 - B2 Time Evaluation Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000004'. ls_pcl2-relid = 'B2'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"zeitarten":[{"lgart":"0050","anzhl":4.00},{"lgart":"0100","anzhl":160.00}],"ZL":[{"lgart":"1000","anzhl":160.00}],"RT":[{"lgart":"M010","betrg":2800.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  " 90000004 - RD Payroll Jan 2024
  CLEAR ls_pcl2.
  ls_pcl2-pernr = '90000004'. ls_pcl2-relid = 'RD'.
  ls_pcl2-pabrj = '2024'. ls_pcl2-pabrp = '01'.
  ls_pcl2-clustd = '{"brutto":2800.00,"netto":1960.00,"lohnarten":[{"lgart":"M010","betrg":2800.00},{"lgart":"ST01","betrg":-504.00},{"lgart":"SV01","betrg":-336.00}]}'.
  APPEND ls_pcl2 TO lt_pcl2.

  INSERT zhcm_pcl2 FROM TABLE lt_pcl2 ACCEPTING DUPLICATE KEYS.

  lv_lines = sy-dbcnt.
  WRITE: / |{ lv_lines } records inserted into ZHCM_PCL2.|.
  WRITE: / '90000001 - B2 + RD Jan 2024'.
  WRITE: / '90000002 - B2 + RD Jan 2024'.
  WRITE: / '90000003 - B2 + RD Jan 2024'.
  WRITE: / '90000004 - B2 + RD Jan 2024'.
