;;Can't believe it works but really it do.
;;Step 1. Count the number of clips in your joblist and set numberofclips to it
;;Step 2. make sure your joblist has the correct filename in this script (jobfile.txt)
;;Step 3. make sure it's the correct format E.G.:
;;1
;;00:00:00:00
;;00:00:20:00
;;2
;;00:00:30:00
;;etc...

#Persistent
#include tf.ahk

FileRead, backup1, joblist.txt
FileAppend, %backup1%, joblist_backup.txt


;;SETTING THIS IS VERY IMPORTANT!!!!!!!!!!!!!!
;;DO NOT FORGET TO SET THIS OR YOU *WILL* HAVE ISSUES!!
numberofclips = 0

tooltipmouseposx = 518
tooltipmouseposy = 700

mousecutx = 633
mousecuty = 518

escape::ExitApp

clipstart = 1337
clipend = 8008135
clips_to_cut = ERROR, Variable was not changed1.
clipsremoved = ERROR, Variable was not changed2.
CurrentFileContent = ERROR, file not read.
EditedFileContent = ERROR, Variable was not changed3.

cliptooltip(clipstart, clipend, clips_to_cut, numberofclips, clipsremoved)
{
tooltip,Clip start: (%clipstart%) `nClip end:  (%clipend%)`nTotal number of clips: (%numberofclips%)`nNumber of clips done: (%clips_to_cut%)
}

checkjoblistlength()
{
LineCount := TF_CountLines("joblist.txt")
If (LineCount >= 3) {
randomvariable := xd
}
else {
ExitApp
}
}

+f1::
SetTimer, CursorTimer, 100
CursorTimer:
CoordMode, mouse, Screen ; Coordinates are relative to the desktop (entire screen).
MouseGetPos, x_1, y_1, id_1, control_1
ToolTip, x %x_1% y %y_1%, % A_ScreenWidth-200, % A_ScreenHeight-200
return
return

+f2::
FatRemovedYet = 0
Loop, %numberofclips% {
jobcheck := TF_readLines("joblist.txt", 3, 3, 1)

If (jobcheck)
{

clipstart := TF_readLines("joblist.txt", 2, 2, 1)
clipend := TF_readLines("joblist.txt", 3, 3, 1)

Click, %mousecutx%, %mousecuty%
sleep 200
SendInput, %clipstart% {enter}
sleep 200
SendInput, +^k
sleep 200
Click, %mousecutx%, %mousecuty%
sleep 200
SendInput, %clipend% {enter}
sleep 200
SendInput, +^k
sleep 200
clips_to_cut+=1
MouseMove, %tooltipmouseposx%, %tooltipmouseposy%
cliptooltip(clipstart, clipend, clips_to_cut, numberofclips, clipsremoved)

;;remove first 3 lines of joblist
FileRead, CurrentFileContent, joblist.txt
EditedFileContent = 
Loop Parse, CurrentFileContent, `n
If (A_Index > 3)
	EditedFileContent .= EditedFileContent ? "`n" A_LoopField : A_LoopField
FileDelete, joblist.txt
FileAppend, %EditedFileContent%, joblist.txt
}

else {
ExitApp
}

}
return


+f3::
If (FatRemovedYet = 0) {
SendInput, +^{f10}
SendInput, {home}
SendInput, ^{down}
SendInput, ^{up}
SendInput, d
SendInput, +{del}

Loop, %clips_to_cut% {
SendInput, ^{down}
SendInput, d
SendInput, +{del}
clipsremoved+=1
MouseMove, %tooltipmouseposx%, %tooltipmouseposy%
cliptooltip(clipstart, clipend, clips_to_cut, numberofclips, clipsremoved)
}
}
else {
ExitApp
}
clips_to_cut = 0
FatRemovedYet = 1
return