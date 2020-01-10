'the following code can be entered
'in a QV Document (within the VBS code section)
'in order to reference a library of common VBS Functions, saved in a central location
'the functions then, can be called from the QV Document as if they were local.

Call IncludeCommon
Sub IncludeCommon
 Dim objFSO, file, str
 Set objFSO = CreateObject("Scripting.FileSystemObject")
 Set file = objFSO.OpenTextFile("<path>\common_functions.vbs")
 str = file.ReadAll
 file.Close
 ExecuteGlobal str
End Sub

