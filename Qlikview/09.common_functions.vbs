'the below VBS functions package, can be imported (or referenced) into a QV Document
'and used within macros.

'function to send a task status mail 
sub SendMail ()
 on error resume next 
  
  
  
 
  
  Set gObjExcel=Nothing  
  Set objMsg = CreateObject("CDO.Message")  
  Set msgConf = CreateObject("CDO.Configuration")  
  
  ' Server Configuration  
  msgConf.Fields.Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2   
  msgConf.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "<server name>"   
  msgConf.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = <port>   
  msgConf.Fields.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1   
  msgConf.Fields.Update  
  
  ' Email  
  'task name could be a variable to keep a process, for which we want an alert. From and To address variables, keep the email addresses of the sender/recipient(s)
  objMsg.Subject = read_Var("task_name")&" status"  
  objMsg.To =read_Var("to_adrs")  
  objMsg.From = read_Var("from_adrs")
  
  
  'vErrMsg1 is a variable set within the process, that keeps error descriptions.
  if read_Var("vErrMsg1") = "No Error"  then
    txtBody ="Process "&task_name&" completed without errors."
  else
    txtBody = read_Var("vErrMsg1")
  end if 
    
  
  
  'assign body to the message    
  objMsg.HTMLBody =txtBody  
  
  Set objMsg.Configuration = msgConf  
  objMsg.Send  

  
  ' Clear objects  
  Set objMsg = nothing  
  Set msgConf = nothing  
  
  
end sub  

'functions to read a variable from a QV Document
function read_Var(varName)
	set Name1 = ActiveDocument.Variables(varName)
	read_var=Name1.GetContent.String
end function


'function to export a QV table in an excel file.
FUNCTION ExcelExport()
on error resume next
	'msgbox(read_Var("vSourcePath")&"_exports\"&read_var("export_filename"))
    'Set MyApp = CreateObject("QlikTech.QlikView")
    'Set myDoc = MyApp.OpenDoc (read_Var("vAppPath"))


 	set obj = ActiveDocument.GetSheetObject(read_var("objID") )	
 	
	obj.ExportBiff(read_Var("vSourcePath")&"_exports\"&read_var("export_filename"))
	'msgbox(read_Var("vSourcePath")&"_exports\"&read_var("export_filename"))
END FUNCTION

'function to save and close a QV Document
sub saveclose()
on error resume next   

	    ActiveDocument.save
	    ActiveDocument.closeDoc
	    ActiveDocument.GetApplication.Quit
end sub

