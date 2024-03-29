<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() 
	{
		/* ########################## Style ########################## */	
		$(".Depth03").css('cursor', 'pointer');
		/* ########################## Style ########################## */	
		
		
		
		/* ########################## Main ########################## */
		$( ".Depth03:contains('Model2 MVC Shop')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('Model2 MVC Shop')" ) );
	 		$(window.parent.document.location).attr("href","/");
		}); 
		/* ########################## Main ########################## */
		
		
		
		
	 	/* ########################## login / logout ########################## */	
	 	$( ".Depth03:contains('login')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('login')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/loginView.jsp");
		}); 
		
		$( ".Depth03:contains('logout')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('logout')" ) );
	 		$(window.parent.document.location).attr("href","/user/logout");
		}); 
	 	/* ########################## login / logout ########################## */	
	});
</script>
<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">

</head>

<body topmargin="0" leftmargin="0">
 
<table width="100%" height="50" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="800" height="30" class="Depth03" ><h2>Model2 MVC Shop</h2></td>
    <td height="30" >&nbsp;</td>
  </tr>
  <tr>
    <td height="20" align="right" background="/images/img_bg.gif">
	    <table width="200" border="0" cellspacing="0" cellpadding="0">
	        <tr> 
	          <td width="115" class="Depth03">
		          <c:if test="${empty user}">
		          	login
		          </c:if>
	          </td>
	          <td width="14">&nbsp;</td>
	          <td width="56" class="Depth03">
	          	<c:if test="${!empty user}">
		         logout
		        </c:if>
	          </td>
	        </tr>
	    </table>
    </td>
    <td height="20" background="/images/img_bg.gif">&nbsp;</td>
  </tr>
</table>

</body>
</html>
