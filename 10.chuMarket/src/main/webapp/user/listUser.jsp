<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/common.js"></script>
<script type="text/javascript">
	$(function() 
	{
		/* ########################## Style ########################## */	
		$(".ct_btn01").css('cursor', 'pointer');
		$(".pageNavi > tbody > tr > td > a").css('cursor', 'pointer');
		$(".ct_list_pop > td:nth-child(3)").css('cursor', 'pointer');
		/* ########################## Style ########################## */	
		
	
		
		/* ########################## User ########################## */
		$( ".ct_btn01:contains('�˻�')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".ct_btn01:contains('�˻�')" ) );
			fncGetList(1);
		}); 
		
		$(".pageNavi > tbody > tr > td > a").on("click" , function() 
	 	{
			fncGetList($(this).attr('id'));
		}); 
		
		$(".ct_list_pop > td:nth-child(3)").on("click" , function() 
		{
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " ȸ��������ȸ" );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId="+$(this).text().trim());
		}); 
		/* ########################## User ########################## */
	});
</script>
<html>
	<head>
		<title>ȸ�� �����ȸ</title>
		<link rel="stylesheet" href="/css/admin.css" type="text/css">
	</head>

	<body bgcolor="#ffffff" text="#000000">
	
	<div style="width:98%; margin-left:10px;">
	
	<form name="detailForm" action="/user/listUser" method="post">
	
	<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
		<tr>
			<td width="15" height="37">
				<img src="/images/ct_ttl_img01.gif" width="15" height="37">
			</td>
			<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="93%" class="ct_ttl01">ȸ�� �����ȸ</td>
					</tr>
				</table>
			</td>
			<td width="12" height="37">
				<img src="/images/ct_ttl_img03.gif" width="12" height="37">
			</td>
		</tr>
	</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td align="right">
				<select name="searchCondition" class="ct_input_g" style="width:80px">
					<option 
						value="0" ${! empty search.searchCondition && search.searchCondition == 0 ? "selected" : "" }>
						ȸ��ID
					</option>
					<option 
						value="1" ${! empty search.searchCondition && search.searchCondition == 1 ? "selected" : "" }>
						ȸ����
					</option>
				</select>
				<input type="text" name="searchKeyword"  value="${search.searchKeyword }" 
					class="ct_input_g" style="width:200px; height:19px" >
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
			<td colspan="11" >��ü <span style="color:red;">${resultPage.totalCount}</span> �Ǽ�, ���� <span style="color:red;">${resultPage.currentPage}</span> ������</td>
		</tr>
		<tr>
			<td class="ct_list_b" width="100">No</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">ȸ��ID</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b" width="150">ȸ����</td>
			<td class="ct_line02"></td>
			<td class="ct_list_b">�̸���</td>		
		</tr>
		<tr>
			<td colspan="11" bgcolor="808285" height="1"></td>
		</tr>
			<c:set var="i" value="0"/>
			<c:forEach var="user" items="${list}">
				<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center">${i}</td>
					<td></td>
					<td align="left">
						<a id="${user.userId}"style="color:#4285F4">
							${user.userId }
						</a>
					</td>
					<td></td>
					<td align="left">${user.userName }</td>
					<td></td>
					<td align="left">${user.email }
					</td>		
				</tr>
				<tr>
					<td colspan="11" bgcolor="D6D7D6" height="1"></td>
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