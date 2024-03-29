<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../javascript/common.js"></script>
<script type="text/javascript" src="../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() 
	{
		var menu = '${menu}';
		
		/* ########################## Style ########################## */	
		$(".ct_btn01").css('cursor', 'pointer');
		$(".pageNavi > tbody > tr > td > a").css('cursor', 'pointer');
		$(".ct_list_pop > td:nth-child(3)").css('cursor', 'pointer');
		/* ########################## Style ########################## */	
		
		
		/* ########################## Paging ########################## */
		$(".pageNavi > tbody > tr > td > a").on("click" , function() 
	 	{
			fncGetList($(this).attr('id'));
		}); 
		/* ########################## Paging ########################## */
		
		
		/* ########################## Product ########################## */
		$(".ct_list_pop > td:nth-child(3)").on("click" , function() 
		{
			var stock = $(this).parent().children('td:nth-child(11)').attr('id');
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " ��ǰ��ȸ" );
			if(menu == "manage" || menu == "bsns")
			{
				$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo="+$(this).attr('id')+"&menu="+menu);
			}else
			{
				if(stock == 0)
				{
					alert("ǰ���� ��ǰ�Դϴ�.");
				}else
				{
					$(window.parent.frames["rightFrame"].document.location).attr("href","/product/getProduct?prodNo="+$(this).attr('id')+"&menu="+menu);
				}
			}
	 		
		}); 
		
		/* ########################## Product ########################## */
	});
</script>
<!DOCTYPE html>
	<html>
	<head>
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	<title>Insert title here</title>
	</head>	
	<body bgcolor="#ffffff" text="#000000">
	<form name="detailForm" method="post" action="/market/getMarket?marketNo=${market.marketNo}&menu=${menu}">
		<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
			<tr>
				<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"	width="15" height="37"></td>
				<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">
								<b>${market.marketName}</b>
							</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37">
					<img src="/images/ct_ttl_img03.gif"  width="12" height="37"/>
				</td>
			</tr>
		</table>
	
		<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">
					�Ұ�
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${market.marketIntro}</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">
					����� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<c:if test="${market.manaFlag == 'Y' }">
						���� ����� ���θ��Դϴ�.
					</c:if>
					<c:if test="${market.manaFlag == 'W' }">
						���� ���� ������� ���θ��Դϴ�.
					</c:if>
					<c:if test="${market.manaFlag == 'F' }">
						���� ��� �ߴܵ� ���θ��Դϴ�.
					</c:if>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		</table>
		<h3>�Ǹ����� ��ǰ</h3>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
			<tr>
				<td colspan="13" >��ü <b>${resultPage.totalCount}</b> �Ǽ�</td>
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
						${market.marketName}
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
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="17" height="23">
							<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
						</td>
						<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
							<a href="javascript:history.go(-1)">����</a>
						</td>
						<td width="14" height="23">
							<img src="/images/ct_btnbg03.gif" width="14" height="23">
						</td>
						<td width="30"></td>
					</tr>
				</table>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="pageNavi" style="margin-top:10px;">
			<tr>
				<td align="center">
					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/>
					${resultPage.paging}
		    	</td>
			</tr>
		</table>
	</form>
	</body>
</html>