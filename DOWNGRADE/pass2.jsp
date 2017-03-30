<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<%@page language="Java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<title>Replace Selected Textarea Elements &mdash; CKEditor Sample</title> 
<meta content="text/html; charset=utf-8" http-equiv="content-type"/> 
<script type="text/javascript"> 
function popup(){ 
   var valdd = document.getElementsByName("abcd"); 
   var inputval = valdd[0].value; 
   alert(inputval); 
   if( confirm('팝업을 띄우시겠습니까?') ){           
             window.open('poptest.jsp?abcd='+inputval, 'pop', "width=800, height=500"); 
   } 
} 
</script> 
</head> 
<body> 
<jsp:include flush="true" page="pass.jsp" /> 
<br/> 
<a href="javascript_:popup();">팝업</a> 
</body> 
</html> 