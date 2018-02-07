+================================================
+
+ Holz-Her (COSMEC) Conquest 250 with OSAI 10 Controller, ATC
+
+================================================
+
+ Copyright : MIT License
+ Author : Sungkyong Un (00heights@gmail.com)
+ Versin : v1.0
+ Revision History
+   v1.0 Jan. 30, 2018 - First version
+
+================================================

POST_NAME = "Holz-Her C250 OSAI ATC (mm) v1 (*.xpi)"

FILE_EXTENSION = "xpi"

UNITS = "MM"

+-------------------------------------------------
+ Line terminating characters
+-------------------------------------------------

LINE_ENDING = "[13][10]"

+-------------------------------------------------
+ Block numbering
+-------------------------------------------------

LINE_NUMBER_START = 1
LINE_NUMBER_INCREMENT = 1
LINE_NUMBER_MAXIMUM = 999999

+================================================
+
+ Formatting for variables
+
+================================================

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.0]
VAR X_POSITION = [X|A|X|1.3]
VAR Y_POSITION = [Y|A|Y|1.3]
VAR Z_POSITION = [Z|A|Z|1.3]
VAR X_HOME_POSITION = [XH|A||1.3]
VAR Y_HOME_POSITION = [YH|A||1.3]
VAR Z_HOME_POSITION = [ZH|A||1.3]

+================================================
+
+ Block definitions for toolpath output
+
+================================================

+-------------------------------------------------
+ Commands output at the start of the file
+-------------------------------------------------

begin HEADER

"; File Name        : [TP_FILENAME]"
"; Post Processor   : Holz-Her C250 OSAI ATC (mm) v1 (*.xpi)"
"; PP Author        : Sungkyong Un (00heights@gmail.com)"
"; Work Piece Size  : X [XLENGTH], Y [YLENGTH], Z [ZLENGTH]"
"; Safe Z           : [SAFEZ]"
"; Z Reference      : [Z_ORIGIN]"
"; Origin Offset    : X [X_ORIGIN_POS], Y [Y_ORIGIN_POS]"
"; Home Position    : X [XH], Y [YH], Z [ZH]"
"; Tools            : [TOOLS_USED]"
"; Note             : [FILE_NOTES]"
"[N] G71        ; Unit = mm"
"[N] G40        ; Cutter Diameter Compensation Disable"
"[N] G90        ; Absolute Programming"
"[N] G27        ; Continuous Operation W/ Reduced Speed on Corners"
"[N] G17        ; Circular Interpolation and Cutter Diameter Compensation on 1st-2nd axes"
"[N] G80        ; Disable Canned Cycles"
"[N] M15        ; Spindle Stop"
"[N] M25        ; Drill Stop"
"[N] M12 M40    ; Spindle Up & Wait the operation completed"
"[N] G79 G0 Z0  ; Go to Absolute Zero"
"[N] M180       ; All Drills Up"
"[N] M413       ; Stop Pin 1 Up"
"[N] M423       ; Stop Pin 2 Up"
"[N] (DIS, [34]Load the work piece and press the start button[34])"
"[N] M0         ; Pause, Wait Start Button"
"[N] (DIS, [34] [34])"
"[N] M57        ; vacuum Pump 1 Start"
"[N] M50        ; Vacuum Zone 1 Lock"
"[N] M60        ; Vacuum zone 2 Lock"
"[N] M414 M40   ; Stop Pin 1 Down & Wait the operation completed"
"[N] M424 M40   ; Stop Pin 2 Down & Wait the operation completed"
"[N] (UOT,1,X0,Y0,Z0) ; Using Temporary Origin #1"
"[N] M6 T[T]    ; Change the Tool T"
"[N] h[T]       ; Tool Offset for Tool T"
"[N] M13 [S]    ; Start Spindle with Speed [S]"
"[N] (DLY,1)    ; Wait 1 sec."
"[N] M11        ; Spindle Down"
"[N] M116       ; Hood Down"
"; ----- End of HEADER -----"

+-------------------------------------------------
+ Commands output at toolchange
+-------------------------------------------------

begin TOOLCHANGE
"; ----- TOOLCHANGE -----"
"[N] G79 G0 Z0  ; Goto Absolute Zero Z"
"[N] M15        ; Spindle Stop"
"[N] M12 M40    ; Spindle Up, Wait the operation completed"
"[N] M25        ; Drill Stop"
"[N] M180       ; All Drills Up"
"[N] M6 T[T]    ; Change the TOOL T"
"[N] h[T]       ; Tool Offset for Tool T"
"[N] M13 [S]    ; Start Spindle with Speed [S]"
"[N] (DLY,1)    ; Wait 1 sec."
"[N] M11        ; Spindle Down"
"[N] M116       ; Hood Down"
"; ----- End of TOOLCHANGE -----"

+-------------------------------------------------
+ Commands output for rapid moves
+-------------------------------------------------

begin RAPID_MOVE

"[N] G0 [X] [Y] [Z]"

+-------------------------------------------------
+ Commands output for the first feed rate move
+-------------------------------------------------

begin FIRST_FEED_MOVE

"[N] G01 [X] [Y] [Z] [F]"

+-------------------------------------------------
+ Commands output for feed rate moves
+-------------------------------------------------

begin FEED_MOVE

"[N] [X] [Y] [Z]"

+-------------------------------------------------
+ Commands output at the end of the File
+-------------------------------------------------

begin FOOTER

"; ----- FOOTER -----"
"[N] G0 Z[SAFEZ]; Goto Safe Z"
"[N] M15        ; Spindle Stop"
"[N] M12 M40    ; Spindle Up, wait the operation completed"
"[N] M25        ; Drill Stop"
"[N] M180       ; All Drills Up"
"[N] G79 G0 X0 Y600 ; Go to Absolute Zero X, Y+600"
"[N] M58        ; Vacuum Zone 1 Release"
"[N] M68        ; Vacuum Zone 2 Release"
"[N] M67        ; Vacuum Pump 1 Stop"
"[N] M30        ; Program End"
