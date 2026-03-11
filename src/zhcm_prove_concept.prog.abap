*&---------------------------------------------------------------------*
*& Report ZHCM_PROVE_CONCEPT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZHCM_PROVE_CONCEPT.
DATA: ls_result TYPE zshcmpayresult.

START-OF-SELECTION.

  " Aufruf eurer neuen Parser-Klasse
  zcl_hcm_json_parser=>get_payroll_result(
    EXPORTING
      iv_pernr  = '90000001'
      iv_fper   = '202401'
      iv_relid  = 'B2'
    IMPORTING
      es_result = ls_result
  ).

  " Prüfung der Ergebnistabelle (RT)
  IF ls_result-rt IS NOT INITIAL.
    WRITE: / 'Erfolg: Abrechnungs-Cluster (B2) erfolgreich entpackt!'.
    LOOP AT ls_result-rt INTO DATA(ls_rt).
      WRITE: / 'Lohnart:', ls_rt-lgart, 'Betrag:', ls_rt-betrg.
    ENDLOOP.

    " Prüfung der Arbeitsplatzdaten (WPBP)
    IF ls_result-wpbp IS NOT INITIAL.
      READ TABLE ls_result-wpbp INTO DATA(ls_wpbp) INDEX 1.
      WRITE: / 'Verknüpfte Planstelle aus Cluster:', ls_wpbp-plans.
    ENDIF.
  ELSE.
    WRITE: / 'Fehler: Kein Datensatz gefunden oder JSON-Mapping fehlgeschlagen.'.
  ENDIF.
