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
		$( ".ct_btn01:contains('검색')" ).on("click" , function() 
	 	{
			//Debug..
			//alert(  $( ".ct_btn01:contains('검색')" ) );
			fncGetList(1);
		}); 
		/* ########################## Search ########################## */
		
		
		/* ########################## Product ########################## */
		$(".ct_list_pop > td:nth-child(3)").on("click" , function() 
		{
			var stock = $(this).parent().children('td:nth-child(11)').attr('id');
			//Debug..
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " 상품조회" );
			if(menu == "manage" || menu == "bsns")
			{
				$(window.parent.frames["rightFrame"].document.location).attr("href","product/getProduct?prodNo="+$(this).attr('id')+"&menu="+menu);
			}else
			{
				if(stock == 0)
				{
					alert("품절된 상품입니다.");
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
			//alert(  $( ".ct_list_pop > td:nth-child(3)" ) + " 상품조회" );
	 		$(window.parent.frames["rightFrame"].document.location).attr("href","/market/getMarket?marketNo="+$(this).attr('id')+"&menu="+menu);
		}); 
		/* ########################## Product ########################## */
	});
</script>

<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>상품 목록조회</title>
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
									${menu =='search' ? '상품 목록조회' : '상품 관리'}
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
						<option value="no" ${! empty search.searchCondition && search.searchCondition == 'no' ? 'selected' : ""}>상품번호</option>
						<option value="name" ${! empty search.searchCondition && search.searchCondition == 'name' ? 'selected' : ""}>상품명</option>
						<option value="price" ${! empty search.searchCondition && search.searchCondition == 'price' ? 'selected' : ""}>상품가격</option>
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
								검색
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
				<td colspan="13" >전체 <span style="color:red;">${resultPage.totalCount}</span> 건수, 현재 <span style="color:red;">${resultPage.currentPage}</span> 페이지</td>
			</tr>
			<tr>
				<td class="ct_list_b" width="100">No</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">상품명</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b" width="150">가격</td>
				<td class="ct_line02"></td>
				<td class="ct_list_b">등록일</td>	
				<td class="ct_line02"></td>
				<td class="ct_list_b">쇼핑몰</td>	
				<td class="ct_line02"></td>
				<td class="ct_list_b">현재상태</td>	
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
							재고없음
						</c:if>
						<c:if test="${prod.prodStock > 0}">
							<c:if test="${menu != 'manage' || menu != 'bsns'}">
								<c:if test="${prod.prodStock <= 5}">
									품절임박 [ ${prod.prodStock} 개 남음 ]
								</c:if>
								<c:if test="${prod.prodStock > 5}">
									판매중
								</c:if>
							</c:if>
							<c:if test="${menu == 'manage' || menu == 'bsns'}">
								재고 : ${prod.prodStock} 개 남음
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
