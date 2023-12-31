REPORT ZDCHECKBOX_SCREEN_LINE_BLOCK.

SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE T1.
PARAMETERS: P_D1 TYPE I OBLIGATORY,
            P_D2 TYPE I OBLIGATORY.
SELECTION-SCREEN END OF BLOCK B1.

SELECTION-SCREEN SKIP 2.

SELECTION-SCREEN BEGIN OF BLOCK B2 WITH FRAME TITLE T2.
SELECTION-SCREEN BEGIN OF LINE.

SELECTION-SCREEN POSITION 05.
PARAMETERS P_CB1 AS CHECKBOX.
SELECTION-SCREEN COMMENT 07(08) TEXT-001.

SELECTION-SCREEN POSITION 20.
PARAMETERS P_CB2 AS CHECKBOX.
SELECTION-SCREEN COMMENT 22(08) TEXT-002.

SELECTION-SCREEN POSITION 35.
PARAMETERS P_CB3 AS CHECKBOX.
SELECTION-SCREEN COMMENT 37(08) TEXT-003.

SELECTION-SCREEN POSITION 50.
PARAMETERS P_CB4 AS CHECKBOX.
SELECTION-SCREEN COMMENT 52(08) TEXT-004.

SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK B2.

DATA LV_V1 TYPE I.
INITIALIZATION.
T1 = 'ENTER VALUE IN INPUT FIELDS'.
T2 = 'CHOOSE THE CHECK FOR APPROPERIATE ACTION'.


IF P_CB1 = 'X'.
  LV_V1 = P_D1 + P_D2.
  WRITE:/ 'SUM RESULT IS -->',LV_V1.
ENDIF.

IF P_CB2 = 'X'.
  LV_V1 = P_D1 - P_D2.
  WRITE:/ 'SUBSTRACTION RESULT IS -->',LV_V1.
ENDIF.

IF P_CB3 = 'X'.
  LV_V1 = P_D1 * P_D2.
  WRITE:/ 'PRODUCT RESULT IS -->',LV_V1.
ENDIF.

IF P_CB4 = 'X'.
  LV_V1 = P_D1 / P_D2.
  WRITE:/ 'DIVISION RESULT IS -->',LV_V1.
ENDIF.
