*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZHCM_C_ABS_MAP..................................*
DATA:  BEGIN OF STATUS_ZHCM_C_ABS_MAP                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZHCM_C_ABS_MAP                .
CONTROLS: TCTRL_ZHCM_C_ABS_MAP
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZHCM_C_ABS_MAP                .
TABLES: ZHCM_C_ABS_MAP                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
