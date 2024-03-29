<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/common.js"></script>
<script type="text/javascript">
	$(function() 
	{
		var menu = '${menu}';
		
		/* ########################## Style ########################## */	
		$(".ct_btn01").css('cursor', 'pointer');
		$(".pageNavi > tbody > tr > td > a").css('cursor', 'pointer');
		$(".ct_list_pop > td:nth-child(1)").css('cursor', 'pointer');
		$(".ct_list_pop > td:nth-child(3)").css('cursor', 'pointer');
		$(".ct_list_pop > td:nth-child(5)").css('cursor', 'pointer');
		$(".ct_list_pop > td:nth-child(13) > a").css('cursor', 'pointer');
		/* ########################## Style ########################## */	
	
				
		/* ########################## Paging ########################## */
		$(".pageNavi > tbody > tr > td > a").on("click" , function() 
	 	{
			fncGetList($(this).attr('id'));
		}); 
		/* ########################## Paging ########################## */
		
		
		/* ########################## User ########################## */
		$(".ct_list_pop > td:nth-child(5)").on("click" , function() 
		{
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " ȸ����ȸ" );
	 		$(window.location).attr("href","/user/getUser?userId="+$(this).text().trim());
		}); 
		/* ########################## User ########################## */
		
		
		/* ########################## Product ########################## */				
		$(".ct_list_pop > td:nth-child(3)").on("click" , function() 
		{
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " ȸ����ȸ" );
			$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo="+$(this).attr('id')+"&menu=search");
	 		//$(window.location).attr("href","/user/getUser?userId="+$(this).text().trim());
		}); 
		/* ########################## Product ########################## */
		
		
		/* ########################## Purchase ########################## */
		$(".ct_list_pop > td:nth-child(1)").on("click" , function() 
		{
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " ȸ����ȸ" );
	 		$(window.location).attr("href","/purchase/getPurchase?tranNo="+$(this).attr('id'));
		}); 
		
		$(".ct_list_pop > td:nth-child(13) > a").on("click" , function() 
		{
			///purchase/updateTranCode?tranNo=${pur.tranNo}&tranCode=${pur.tranCode}&menu=purchase
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(11)" ) + " �����Ȳ" );
	 		$(window.location).attr("href","/purchase/updateTranCode?tranNo="+$(this).attr('id')+"&menu=purchase");
		}); 
		/* ########################## Purchase ########################## */
		
		
	});
</script>

<!DOCTYPE html>
<html>
	<head>
	<title>���� �����ȸ</title>
	<meta charset="euc-kr">
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	</head>

	<body bgcolor="#ffffff" text="#000000">
		<div style="width: 98%; margin-left: 10px;">
			<form name="detailForm" action="/purchase/listPurchase" method="post">
				<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
					<tr>
						<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
						<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="93%" class="ct_ttl01">���� �����ȸ</td>
								</tr>
							</table>
						</td>
						<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
					</tr>
				</table>
		
				<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
					<tr>
						<td colspan="13">��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
					</tr>
					<tr>
						<td class="ct_list_b" width="100">No</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">��ǰ��</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">ȸ��ID</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">ȸ����</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">��ȭ��ȣ</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">�����Ȳ</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">��������</td>
					</tr>
					<tr>
						<td colspan="13" bgcolor="808285" height="1"></td>
					</tr>
					<c:forEach var="pur" items="${list}">
					
						<c:set var="i" value="${i+1}"/>
						
						<tr class="ct_list_pop">
							<td align="center" id="${pur.tranNo}">
								<a style="color:#4285F4">
									${i}
								</a>
							</td>
							<td></td>
							<td align="left" id="${pur.purchaseProd.prodNo}">
								<a style="color:#4285F4">
									${pur.purchaseProd.prodName}
								</a>
							</td>
							<td></td>
							<td align="left">
								<a style="color:#4285F4">
									${pur.buyer.userId}
								</a>
							</td>
							<td></td>
							<td align="left">
								${pur.buyer.userName}
							</td>
							<td></td>
							<td align="left">${pur.receiverPhone}</td>
							<td></td>
							<td align="left">
								<c:choose>
									<c:when test="${pur.tranCode == '1'}">
										���� <b>���ſϷ�</b> �����Դϴ�.
									</c:when>
									<c:when test="${pur.tranCode == '2'}">
										���� <b>�����</b> �����Դϴ�.
									</c:when>
									<c:otherwise>
										���� <b>��ۿϷ�</b> �����Դϴ�.
									</c:otherwise>
								</c:choose>
							</td>
							<td></td>
							<td align="left">
								<c:if test="${pur.tranCode == '2'}">
									<a id="${pur.tranNo}" style="color:#4285F4" >
								  		���ǵ���
								  	</a>
								</c:if>
							</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="13" bgcolor="D6D7D6" height="1"></td>
					</tr>
				</table>
				<!--  ������ Navigator ���� -->
				<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pageNavi" style="margin-top:10px;">
					<tr>
						<td align="center">
						   <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
							${resultPage.paging}
				    	</td>
					</tr>
				</table>
				<!--  ������ Navigator �� -->
			</form>
		</div>
	</body>
</html>