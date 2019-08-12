^w::
  MouseGetPos,,,guideUnderCursor
  WinGetTitle, Title, ahk_id %guideUnderCursor%
  Msgbox, %Title%
Return

esc::exitapp