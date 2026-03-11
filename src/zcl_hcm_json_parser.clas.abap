class ZCL_HCM_JSON_PARSER definition
  public
  final
  create public .

public section.

  class-methods GET_PAYROLL_RESULT
    importing
      value(IV_PERNR) type Z_PERNR
      value(IV_FPER) type Z_FPPER
      value(IV_RELID) type Z_RELID
    exporting
      !ES_RESULT type ZSHCMPAYRESULT .
protected section.
private section.

  class-methods _BUILD_SRTFD_KEY
    importing
      value(IV_PERNR) type Z_PERNR
      value(IV_SEQNR) type Z_CDSEQ
    returning
      value(RV_SRTFD) type Z_SRTFD .
ENDCLASS.



CLASS ZCL_HCM_JSON_PARSER IMPLEMENTATION.


METHOD get_payroll_result.
  DATA: lv_srtfd TYPE z_srtfd,
        lv_json  TYPE string,
        lv_seqnr TYPE z_cdseq. " Explizite Deklaration mit deinem Datenelement

  " 1. Schritt: Navigation über das Verzeichnis
  SELECT SINGLE seqnr
    FROM zhcm_rgdir
    WHERE pernr = @iv_pernr
      AND pabrj = @iv_fper(4)
      AND pabrp = @iv_fper+4(2)
      AND srtza = 'A'
    INTO @lv_seqnr. " Hier jetzt ohne @DATA

  IF sy-subrc = 0.
    " 2. Schritt: Den kryptischen Key SRTFD intern bauen lassen
   lv_srtfd = _build_srtfd_key( iv_pernr = iv_pernr
                                 iv_seqnr = lv_seqnr ).

*     3. Schritt: Den JSON-Payload aus der Cluster-Tabelle lesen
    SELECT SINGLE clustd FROM zhcm_pcl2
      WHERE relid = @iv_relid
        AND srtfd = @lv_srtfd
      INTO @lv_json.

    IF sy-subrc = 0 AND lv_json IS NOT INITIAL.
*       4. Schritt: Deserialisierung in die Deep Structure
      /ui2/cl_json=>deserialize(
        EXPORTING json = lv_json
        CHANGING  data = es_result ).
    ENDIF.
 ENDIF.
ENDMETHOD.


METHOD _build_srtfd_key.
  " Realitäts-Check: PERNR(8) + SEQNR(5) bündig im CHAR 40 Feld
  rv_srtfd = |{ iv_pernr }{ iv_seqnr WIDTH = 5 ALIGN = RIGHT PAD = '0' }|.
ENDMETHOD.
ENDCLASS.
