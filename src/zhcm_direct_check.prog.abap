*&---------------------------------------------------------------------*
*& Report ZHCM_DIRECT_CHECK
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_DIRECT_CHECK.

DATA: lv_org_text  TYPE zhcm_hrp1000-stext,
      lv_pos_text  TYPE zhcm_hrp1000-stext.

PARAMETERS: p_pernr TYPE zhcm_pa0001-pernr DEFAULT '90000001'.

START-OF-SELECTION.

  " 1. Mitarbeiter-Basisdaten (PA)
  SELECT SINGLE a~pernr, a~ename, b~gbdat
    FROM zhcm_pa0001 AS a
    INNER JOIN zhcm_pa0002 AS b ON a~pernr = b~pernr
    WHERE a~pernr = @p_pernr
      AND a~endda >= @sy-datum AND a~begda <= @sy-datum
    INTO @DATA(ls_person).

  IF sy-subrc <> 0.
    WRITE: / 'Fehler: Mitarbeiter nicht gefunden.'.
  ELSE.
    WRITE: / |Mitarbeiter: { ls_person-pernr } { ls_person-ename }|.
    WRITE: / |Geburtstag:  { ls_person-gbdat }|.
  ENDIF.

  " 2. Planstelle (PLANS) → HRP1000 Text
  SELECT SINGLE h1000~stext
    FROM zhcm_pa0001 AS p1
    INNER JOIN zhcm_hrp1000 AS h1000
      ON  h1000~objid = p1~plans
      AND h1000~otype = 'S'
    WHERE p1~pernr  = @p_pernr
      AND p1~endda >= @sy-datum
      AND p1~begda <= @sy-datum
      AND h1000~endda >= @sy-datum
      AND h1000~begda <= @sy-datum
    INTO @lv_pos_text.

  IF sy-subrc = 0.
    WRITE: / |Planstelle:  { lv_pos_text }|.
  ELSE.
    WRITE: / 'Keine Planstelle gefunden.'.
  ENDIF.

  " 3. Orgeinheit (ORGEH) → HRP1000 Text
  SELECT SINGLE h1000~stext
    FROM zhcm_pa0001 AS p1
    INNER JOIN zhcm_hrp1000 AS h1000
      ON  h1000~objid = p1~orgeh
      AND h1000~otype = 'O'
    WHERE p1~pernr  = @p_pernr
      AND p1~endda >= @sy-datum
      AND p1~begda <= @sy-datum
      AND h1000~endda >= @sy-datum
      AND h1000~begda <= @sy-datum
    INTO @lv_org_text.

  IF sy-subrc = 0.
    WRITE: / |Abteilung:   { lv_org_text }|.
  ELSE.
    WRITE: / 'Keine Abteilung gefunden.'.
  ENDIF.
