<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	//==> jQuery ���� �߰��� �κ�
	$(function() 
	{
		/* ########################## Style ########################## */	
		$(".Depth03").css('cursor', 'pointer');
		
		$(".Depth03").hover(function() 
		{
			$(this).css('font-size','20px');
		},function() 
		{
			$(this).css('font-size','12px');
		});
		/* ########################## Style ########################## */	
		
		
		
		
		/* ########################## History ########################## */	
		$( ".Depth03:contains('�ֱ� �� ��ǰ')" ).on("click" , function() 
	 	{
			 popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
		/* ########################## History ########################## */	
		
		
		
		
		/* ########################## User########################## */		 
		//==> ����������ȸ Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$( ".Depth03:contains('����������ȸ')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('����������ȸ')" ).html() );
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
		});
		
		
		//==> ȸ��������ȸ Event ����ó���κ�
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$( ".Depth03:contains('ȸ��������ȸ')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('ȸ��������ȸ')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
		}); 
	 	/* ########################## User ########################## */	
	 	
	 	
	 	
	 	
	 	/* ########################## Product ########################## */	

	 	$( ".Depth03:contains('�ǸŻ�ǰ���')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('�ǸŻ�ǰ���')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","../product/addProductView.jsp");
		}); 

		
		var role = "${user.role}";
	 	if(role == "bsns")
	 	{
	 		$( ".Depth03:contains('�ǸŻ�ǰ����')" ).on("click" , function() 
	 		{
				//Debug..
				//alert(  $( ".Depth03:contains('�ǸŻ�ǰ����')" ) );
		 		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=bsns");
			}); 
	 	}else
	 	if(role == "admin")
		$( ".Depth03:contains('�ǸŻ�ǰ����')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('�ǸŻ�ǰ����')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
		}); 
	 	
	 	$( ".Depth03:contains('�� ǰ �� ��')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('�� ǰ �� ��')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	/* ########################## Product ########################## */	
	 	
	 	
	 	
	 	
	 	/* ########################## Purchase ########################## */	
	 	$( ".Depth03:contains('�����̷���ȸ')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('�����̷���ȸ')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
		}); 
	 	/* ########################## Purchase ########################## */	
	 	
	 	
	 	
	 	
	 	/* ########################## Market ########################## */	
	 	$( ".Depth03:contains('���� ����')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('���� ����')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/market/addMarket");
		}); 
	 	
	 	$( ".Depth03:contains('���� ��û ��ȸ')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('���� ��û ��ȸ')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/market/listMarket");
		}); 
	 	/* ########################## Market ########################## */	
	});	
	
</script>

<html>
	<head>
		<meta charset="EUC-KR">
		<title>Model2 MVC Shop</title>
		<link href="/css/left.css" rel="stylesheet" type="text/css">
	</head>
	
	<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >
		<table width="159" border="0" cellspacing="0" cellpadding="0">
		
			<!--menu 01 line-->
			<tr>
				<td valign="top"> 
					<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
						<tr>
						<!--menu 01 line-->
						<c:if test="${!empty user}">
							<tr>
								<td class="Depth03">
									����������ȸ
								</td>
							</tr>
						</c:if>
						<c:if test="${user.role == 'admin'}">
							<tr>
								<td class="Depth03" >
									ȸ��������ȸ
								</td>
							</tr>
						</c:if>
						<tr>
							<td class="DepthEnd">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
			
			<!--menu 02 line-->
			<c:if test="${user.role == 'admin'|| user.role == 'bsns'}">
				<tr>
					<td valign="top"> 
						<table  border="0" cellspacing="0" cellpadding="0" width="159">
							<tr>
								<td class="Depth03">
									�ǸŻ�ǰ���
								</td>
							</tr>
							<tr>
								<td class="DepthEnd">&nbsp;</td>
							</tr>
							
							<c:if test="${user.role == 'admin'}">
								<tr>
									<td class="Depth03">
										�ǸŻ�ǰ����
									</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
							</c:if>
							<c:if test="${user.role == 'bsns'}">
								<tr>
									<td class="Depth03">
										�ǸŻ�ǰ����
									</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
							</c:if>
						</table>
					</td>
				</tr>
			</c:if>
		
			<!--menu 03 line-->
			<tr>
				<td valign="top">
					<table  border="0" cellspacing="0" cellpadding="0" width="159">
						<tr>
							<td class="Depth03">
								�� ǰ �� ��
							</td>
						</tr>
						<c:if test="${!empty user}">
							<c:if test="${user.role == 'user'}">
								<tr>
									<td class="Depth03">
										�����̷���ȸ
									</td>
								</tr>
							</c:if>
							<tr>
								<td class="Depth03">
									����������ȸ
								</td>
							</tr>
						</c:if>
						<tr>
						<td class="DepthEnd">&nbsp;</td>
						</tr>
						<tr>
							<td class="Depth03">
								�ֱ� �� ��ǰ
							</td>
						</tr>
						<c:if test="${!empty user}">
							<c:if test="${user.role == 'user' || user.role == 'bsns'}">
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="Depth03">
										���� ����
									</td>
								</tr>
							</c:if>
						</c:if>
						<c:if test="${!empty user}">
							<c:if test="${user.role == 'admin'}">
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
								<tr>
									<td class="Depth03">
										���� ��û ��ȸ
									</td>
								</tr>
							</c:if>
						</c:if>
					</table>
				</td>
			</tr>
		
		</table>
	</body>
</html>