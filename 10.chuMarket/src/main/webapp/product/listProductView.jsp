<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

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
		$(".ct_list_pop > td:nth-child(3)").css('cursor', 'pointer');
		$(".ct_list_pop > td:nth-child(9)").css('cursor', 'pointer');
		/* ########################## Style ########################## */	
		
		
		/* ########################## Paging ########################## */
		$(".pageNavi > tbody > tr > td > a").on("click" , function() 
	 	{
			fncGetList($(this).attr('id'));
		}); 
		/* ########################## Paging ########################## */
		
		
		/* ########################## Search ########################## */
		$( ".ct_btn01:contains('�˻�')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".ct_btn01:contains('�˻�')" ) );
			fncGetList(1);
		}); 
		/* ########################## Search ########################## */
		
		
		/* ########################## Product ########################## */
		$(".ct_list_pop > td:nth-child(3)").on("click" , function() 
		{
			var stock = $(this).parent().children('td:nth-child(11)').attr('id');
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " ��ǰ��ȸ" );
			if(menu == "manage" || menu == "bsns")
			{
				$(window.parent.frames["rightFrame"].document.location).attr("href","product/getProduct?prodNo="+$(this).attr('id')+"&menu="+menu);
			}else
			{
				if(stock == 0)
				{
					alert("ǰ���� ��ǰ�Դϴ�.");
				}else
				{
					$(window.parent.frames["rightFrame"].document.location).attr("href","product/getProduct?prodNo="+$(this).attr('id')+"&menu="+menu);
				}
			}
	 		
		}); 
		
		$(".ct_list_pop > td:nth-child(9)").on("click" , function() 
		{
			///market/getMarket?marketNo=${prod.market.marketNo}&menu=${menu}
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " ��ǰ��ȸ" );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/market/getMarket?marketNo="+$(this).attr('id')+"&menu="+menu);
		}); 
		/* ########################## Product ########################## */
	});
</script>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>��ǰ �����ȸ</title>
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	</head>
	<body bgcolor="#ffffff" text="#000000">
	<div style="width:98%; margin-left:10px;">
	<form name="detailForm" action="/product/listProduct?menu=${menu}" method="post">
		<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
			<tr>
				<td width="15" height="37">
					<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
				</td>
				<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">
								<c:if test="${! empty menu}">
									${menu =='search' ? '��ǰ �����ȸ' : '��ǰ ����'}
								</c:if>
							</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37">
					<img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
				</td>
			</tr>
		</table>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
			<tr>
				<td align="right">
					<select name="searchCondition" class="ct_input_g" style="width:80px">
						<option value="no" ${! empty search.searchCondition && search.searchCondition == 'no' ? 'selected' : ""}>��ǰ��ȣ</option>
						<option value="name" ${! empty search.searchCondition && search.searchCondition == 'name' ? 'selected' : ""}>��ǰ��</option>
						<option value="price" ${! empty search.searchCondition && search.searchCondition == 'price' ? 'selected' : ""}>��ǰ����</option>
					</select>
					<input type="text" name="searchKeyword"  class="ct_input_g" style="width:200px; height:19px" value="${search.searchKeyword}" />
				</td>
				<td align="right" width="70">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23">
							</td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
								�˻�
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23">
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
			<tr>
				<td colspan="13" >��ü <span style="color:red;">${resultPage.totalCount}</span> �Ǽ�, ���� <span style="color:red;">${resultPage.currentPage}</span> ������</td>
			</tr>
			<tr>
				<td class="ct_list_b" width="100">No</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">��ǰ��</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">����</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b">�����</td>	
				<td class="ct_line02"></td>
				<td class="ct_list_b">���θ�</td>	
				<td class="ct_line02"></td>
				<td class="ct_list_b">�������</td>	
			</tr>
			<tr>
				<td colspan="13" bgcolor="808285" height="1"></td>
			</tr>
			<c:forEach var="prod" items="${list}" >
				<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center">${i}</td>
					<td></td>
					<td align="left" id="${prod.prodNo}">
						<a style="color:#4285F4">
							${prod.prodName}
						</a>
					</td>
					<td></td>
					<td align="left">${prod.price}</td>
					<td></td>
					<td align="left">${prod.regDate}</td>
					<td></td>
					<td align="left" id="${prod.market.marketNo}">
						<a style="color:#4285F4">
							${prod.market.marketName}
						</a>
					</td>
					<td></td>
					<td align="left" id="${prod.prodStock}">
						<c:if test="${prod.prodStock <= 0}">
							������
						</c:if>
						<c:if test="${prod.prodStock > 0}">
							<c:if test="${menu != 'manage' || menu != 'bsns'}">
								<c:if test="${prod.prodStock <= 5}">
									ǰ���ӹ� [ ${prod.prodStock} �� ���� ]
								</c:if>
								<c:if test="${prod.prodStock > 5}">
									�Ǹ���
								</c:if>
							</c:if>
							<c:if test="${menu == 'manage' || menu == 'bsns'}">
								��� : ${prod.prodStock} �� ����
							</c:if>
						</c:if>
					</td>	
				</tr>
				<tr>
					<td colspan="13"z bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- PageNavigation Start... -->
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pageNavi" style="margin-top:10px;">
			<tr>
				<td align="center">
				   <input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage }"/>
					${resultPage.paging}
		    	</td>
			</tr>
		</table>
		<!-- PageNavigation End... -->
		
	</form>
	</div>
	</body>
</html>
