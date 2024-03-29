<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript">

	//==> jQuery 적용 추가된 부분
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
		$( ".Depth03:contains('최근 본 상품')" ).on("click" , function() 
	 	{
			 popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
		});
		/* ########################## History ########################## */	
		
		
		
		
		/* ########################## User########################## */		 
		//==> 개인정보조회 Event 연결처리부분
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$( ".Depth03:contains('개인정보조회')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('개인정보조회')" ).html() );
			$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");
		});
		
		
		//==> 회원정보조회 Event 연결처리부분
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	 	$( ".Depth03:contains('회원정보조회')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('회원정보조회')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser");
		}); 
	 	/* ########################## User ########################## */	
	 	
	 	
	 	
	 	
	 	/* ########################## Product ########################## */	

	 	$( ".Depth03:contains('판매상품등록')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('판매상품등록')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","../product/addProductView.jsp");
		}); 

		
		var role = "${user.role}";
	 	if(role == "bsns")
	 	{
	 		$( ".Depth03:contains('판매상품관리')" ).on("click" , function() 
	 		{
				//Debug..
				//alert(  $( ".Depth03:contains('판매상품관리')" ) );
		 		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=bsns");
			}); 
	 	}else
	 	if(role == "admin")
		$( ".Depth03:contains('판매상품관리')" ).on("click" , function() {
			//Debug..
			//alert(  $( ".Depth03:contains('판매상품관리')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage");
		}); 
	 	
	 	$( ".Depth03:contains('상 품 검 색')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('상 품 검 색')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search");
		}); 
	 	/* ########################## Product ########################## */	
	 	
	 	
	 	
	 	
	 	/* ########################## Purchase ########################## */	
	 	$( ".Depth03:contains('구매이력조회')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('구매이력조회')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase");
		}); 
	 	/* ########################## Purchase ########################## */	
	 	
	 	
	 	
	 	
	 	/* ########################## Market ########################## */	
	 	$( ".Depth03:contains('입점 문의')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('입점 문의')" ) );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/market/addMarket");
		}); 
	 	
	 	$( ".Depth03:contains('입점 신청 조회')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".Depth03:contains('입점 신청 조회')" ) );
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
									개인정보조회
								</td>
							</tr>
						</c:if>
						<c:if test="${user.role == 'admin'}">
							<tr>
								<td class="Depth03" >
									회원정보조회
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
									판매상품등록
								</td>
							</tr>
							<tr>
								<td class="DepthEnd">&nbsp;</td>
							</tr>
							
							<c:if test="${user.role == 'admin'}">
								<tr>
									<td class="Depth03">
										판매상품관리
									</td>
								</tr>
								<tr>
									<td class="DepthEnd">&nbsp;</td>
								</tr>
							</c:if>
							<c:if test="${user.role == 'bsns'}">
								<tr>
									<td class="Depth03">
										판매상품관리
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
								상 품 검 색
							</td>
						</tr>
						<c:if test="${!empty user}">
							<c:if test="${user.role == 'user'}">
								<tr>
									<td class="Depth03">
										구매이력조회
									</td>
								</tr>
							</c:if>
							<tr>
								<td class="Depth03">
									개인정보조회
								</td>
							</tr>
						</c:if>
						<tr>
						<td class="DepthEnd">&nbsp;</td>
						</tr>
						<tr>
							<td class="Depth03">
								최근 본 상품
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
										입점 문의
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
										입점 신청 조회
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