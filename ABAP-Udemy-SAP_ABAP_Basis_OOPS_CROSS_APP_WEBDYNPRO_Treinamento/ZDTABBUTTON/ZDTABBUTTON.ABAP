REPORT ZDTABBUTTON.

SELECTION-SCREEN BEGIN OF TABBED BLOCK TB1 FOR 15 LINES.
  SELECTION-SCREEN TAB (10) T1 USER-COMMAND ONE.
  SELECTION-SCREEN TAB (10) T2 USER-COMMAND TWO.
SELECTION-SCREEN END OF BLOCK TB1.

SELECTION-SCREEN BEGIN OF SCREEN 1001 AS SUBSCREEN.
PARAMETERS: P_D1 TYPE STRING,
            P_D2 TYPE STRING,
            P_D3 TYPE STRING.

SELECTION-SCREEN SKIP 3.
PARAMETERS P_D4 TYPE STRING.

DATA LV_V1 TYPE STRING.

SELECTION-SCREEN SKIP 2.
  SELECTION-SCREEN PUSHBUTTON 6(10) PB1 USER-COMMAND FULL.
  SELECTION-SCREEN PUSHBUTTON 30(10) PB2 USER-COMMAND CLEAR.
  SELECTION-SCREEN PUSHBUTTON 54(10) PB3 USER-COMMAND EXIT.
SELECTION-SCREEN END OF SCREEN 1001.
SELECTION-SCREEN BEGIN OF SCREEN 1002 AS SUBSCREEN.
  SELECTION-SCREEN BEGIN OF BLOCK B2 WITH FRAME TITLE TT1.
  PARAMETERS: PP_D1 TYPE I DEFAULT '1' OBLIGATORY,
              PP_D2 TYPE I DEFAULT '1' OBLIGATORY.
  SELECTION-SCREEN END OF BLOCK B2.

SELECTION-SCREEN SKIP 2.

SELECTION-SCREEN BEGIN OF BLOCK B1 WITH FRAME TITLE TT2.
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
PARAMETERS P_CB4 AS CHECKBOX DEFAULT 'X'.
SELECTION-SCREEN COMMENT 52(08) TEXT-004.

SELECTION-SCREEN END OF LINE.
SELECTION-SCREEN END OF BLOCK B1.

SELECTION-SCREEN END OF SCREEN 1002.

INITIALIZATION.
TB1-ACTIVETAB = 'TWO'.
TB1-DYNNR = 1002.
TB1-PROG = SY-REPID.
T1 = 'HELLO'.
T2 = 'BYE'.
PB1 = 'FULL NAME'.
PB2 = 'CLEAR'.
PB3 = 'EXIT'.
TT1 = 'ENTER VALUE IN INPUT FIELDS'.
TT2 = 'CHOOSE THE CHECK FOR APPROPERIATE ACTION'.

IF P_CB1 = 'X'.
  LV_V1 = PP_D1 + PP_D2.
  WRITE:/ 'SUM RESULT IS -->',LV_V1.
ENDIF.

IF P_CB2 = 'X'.
  LV_V1 = PP_D1 - PP_D2.
  WRITE:/ 'SUBSTRACTION RESULT IS -->',LV_V1.
ENDIF.

IF P_CB3 = 'X'.
  LV_V1 = PP_D1 * PP_D2.
  WRITE:/ 'PRODUCT RESULT IS -->',LV_V1.
ENDIF.

IF P_CB4 = 'X'.
  LV_V1 = PP_D1 / PP_D2.
  WRITE:/ 'DIVISION RESULT IS -->',LV_V1.
ENDIF.

AT SELECTION-SCREEN.
CASE SY-DYNNR.
  WHEN 1000.
    CASE SY-UCOMM.
      WHEN 'ONE'.
        TB1-DYNNR = 1001.
           WHEN 'FULL'.
    CONCATENATE P_D1 P_D2 P_D3 INTO P_D4 SEPARATED BY SPACE.
  WHEN 'CLEAR'.
    CLEAR: P_D1, P_D2, P_D3, P_D4.
  WHEN 'EXIT'.
    LEAVE PROGRAM.
        WHEN 'TWO'.
          TB1-DYNNR = 1002.
          ENDCASE.
ENDCASE.
