<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/common.js"></script>
<script type="text/javascript">
	$(function() 
	{
		var detailForm = $("form[name=detailForm]");
		
		/* ########################## Style ########################## */	
		$(".ct_btn01").css('cursor', 'pointer');
		/* ########################## Style ########################## */	
		
		
		/* ########################## Market ########################## */
		$( ".ct_btn01:contains('������û')" ).on("click" , function() 
	 	{
			////////// ������û Ŭ�� �� //////////
			//Form ��ȿ�� ����
		 	var name  = $("#marketName");
			var intro = $("#marketIntro");
			var addr  = $("#marketAddr");

			if(name.val() == null || name.val().length<1)
			{
				alert("��ȣ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				name.focus();
				return;
			}
			if(intro.val() == null || intro.val().length<1)
			{
				alert("�Ұ��� �ݵ�� �Է��Ͽ��� �մϴ�.");
				intro.focus();
				return;
			}
			if(addr.val() == null || addr.val().length<1)
			{
				alert("����� �ּҴ� �ݵ�� �Է��ϼž� �մϴ�.");
				addr.focus();
				return;
			}
			
			detailForm.attr('action','/market/addMarket').submit();
		}); 
		
		$( ".ct_btn01:contains('���')" ).on("click" , function() 
		{
			if($(this).text().trim() == '���')
			{
				detailForm.each(function()
				{
					this.reset();
				});
			}else
			{
				 if (!confirm("��� ���� �� ������ �ʱ�ȭ�Ǹ�, ���û �� �ٽ� �ۼ��ϼž� �մϴ�. \n����Ͻðڽ��ϱ�?")) 
				 {
					 
				 } else 
				 {
					//alert("/market/deleteMarket?marketNo=${market.marketNo}");
					detailForm.attr('action','/market/deleteMarket?marketNo=${market.marketNo}').submit();
				 }
			}
		});
		
		$( ".ct_btn01:contains('����')" ).on("click" , function() 
		{
			history.go(-1);
		});
		/* ########################## Market ########################## */
	});
</script>

<!DOCTYPE html>
<html>
	<head>
	<title>������û</title>
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	</head>
	<body bgcolor="#ffffff" text="#000000">
		<form name="detailForm" method="post">
		<input type="hidden" name="userId" value="${user.userId}"/>
			<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
				<tr>
					<td width="15" height="37">
						<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
					</td>
					<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">������û</td>
								<td width="20%" align="right">&nbsp;</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37">
						<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
					</td>
				</tr>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
				<c:if test="${!empty market}">
					<tr>
						<td height="1" colspan="3" bgcolor="D6D6D6"></td>
					</tr>
					<tr>
						<td width="104" class="ct_write">
							��û��ȣ
							<imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
						</td>
						<td bgcolor="D6D6D6" width="1"></td>
						<td class="ct_write01">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="105">
										${market.marketNo}
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:if>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">
						��û�� ���̵� 
						<imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105">
									${user.userId}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">
						��ȣ�� 
						<imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<c:if test="${!empty market}">
									<td width="105">
										${market.marketName}
									</td>
								</c:if>
								<c:if test="${empty market}">
									<td width="105">
										<input type="text" name="marketName" id="marketName" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
									</td>
								</c:if>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">
						�Ұ� 
						<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<c:if test="${!empty market}">
									<td width="105">
										${market.marketIntro}
									</td>
								</c:if>
								<c:if test="${empty market}">
									<td width="105">
										<input type="text" id="marketIntro" name="marketIntro" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
									</td>
								</c:if>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">
						����� �ּ� 
						<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<c:if test="${!empty market}">
									<td width="105">
										${market.marketAddr}
									</td>
								</c:if>
								<c:if test="${empty market}">
									<td width="105">
										<input type="text" id="marketAddr" name="marketAddr" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
									</td>
								</c:if>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<c:if test="${!empty market }">
					<tr>
						<td width="104" class="ct_write">
							��û ��Ȳ
							<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
						</td>
						<td bgcolor="D6D6D6" width="1"></td>
						<td class="ct_write01">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<c:if test="${market.manaFlag == 'W'}">
										<td width="105">
											���� �����
										</td>
									</c:if>
									<c:if test="${market.manaFlag == 'Y'}">
										<td width="105">
											���οϷ� [��������]
										</td>
									</c:if>
									<c:if test="${market.manaFlag == 'F'}">
										<td width="105">
											�������� [���� �Ұ���]
										</td>
									</c:if>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="1" colspan="3" bgcolor="D6D6D6"></td>
					</tr>
				</c:if>
			</table>
			<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
				<tr>
					<td width="53%"></td>
					<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<c:if test="${!empty market }">
							<tr>
								<td width="17" height="23">
									<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
									�������
								</td>
								<td width="14" height="23">
									<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
								</td>
								
								<td width="17" height="23">
									<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									����
								</td>
								<td width="14" height="23">
									<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
								</td>
							</tr>
						</c:if>
						<c:if test="${empty market }">
							<tr>
								<td width="17" height="23">
									<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
									������û
								</td>
								<td width="14" height="23">
									<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
								</td>
								
								<td width="17" height="23">
									<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									���
								</td>
								<td width="14" height="23">
									<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
								</td>
							</tr>
						</c:if>
					</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>