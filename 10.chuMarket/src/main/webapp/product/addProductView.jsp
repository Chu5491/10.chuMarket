<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="../javascript/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js"></script>
<script type="text/javascript" src="../javascript/common.js"></script>
<script type="text/javascript">
	$(function() 
	{
		var detailForm = $("form[name=detailForm]");
		
		/* ########################## Style ########################## */	
		$(".ct_btn01").css('cursor', 'pointer');
		/* ########################## Style ########################## */	
		
		
		/* ########################## Product ########################## */
		$( ".ct_btn01:contains('���')" ).on("click" , function() 
	 	{
			////////// ��Ϲ�ư Ŭ�� �� //////////
			//Debug..
			//alert(  $( ".ct_btn01:contains('���')" ) );
	 		//Form ��ȿ�� ����
		 	var name = $("#prodName");
			var detail = $("#prodDetail");
			var manuDate = $("#manuDate");
			var price = $("#price");
			var stock = $("#prodStock");
			
			if(name.val() == null || name.val().length<1)
			{
				alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				name.focus();
				return;
			}
			if(detail.val() == null || detail.val().length<1)
			{
				alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				detail.focus();
				return;
			}
			if(manuDate.val() == null || manuDate.val().length<1)
			{
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				manuDate.focus();
				return;
			}
			if(price.val() == null || price.val().length<1)
			{
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				price.focus();
				return;
			}
			if(stock.val() == null || stock.val() < 1)
			{
				alert("������ �ݵ�� 1�� �̻� �Է��ϼž� �մϴ�.");
				stock.focus();
				return;
			}
			detailForm.attr('action','/product/addProduct').submit();
		}); 
		
		$( ".ct_btn01:contains('���')" ).on("click" , function() 
		{
			////////// ��ҹ�ư Ŭ�� �� //////////
			detailForm.each(function()
			{
				this.reset();
			});
		});
		
		$( "#prodStock" ).keyup(function() 
		{
			////////// ���� �Է� �� //////////
			var value = $(this).val();
			if(value > 100)
			{
				alert('�ִ� 100�� ���� ����� �� �ֽ��ϴ�!!');	
				$("#prodStock").val(100);
			}
		});
		/* ########################## Product ########################## */
	});
	
</script>

<!DOCTYPE html>
<html>
	<head>
	<title>��ǰ���</title>
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
	</head>
	<body bgcolor="#ffffff" text="#000000">
		<form name="detailForm" method="post" enctype="multipart/form-data">
			<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
				<tr>
					<td width="15" height="37">
						<img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
					</td>
					<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">��ǰ���</td>
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
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">
						��ǰ�� 
						<imgsrc="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="105">
									<c:if test="${empty prod }">
										<input type="text" name="prodName" id="prodName" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">
									</c:if>
									<c:if test="${! empty prod }">
										${prod.prodName }
									</c:if>
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
						��ǰ������ 
						<img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<c:if test="${empty prod }">
							<input type="text" name="prodDetail" id="prodDetail" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10" minLength="6"/>
						</c:if>
						<c:if test="${! empty prod }">
							${prod.prodDetail }
						</c:if>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">
						�������� 
						<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<c:if test="${empty prod }">
							<input type="text" name="manuDate" id="manuDate" readonly="readonly" class="ct_input_g" style="width: 100px; height: 19px"	maxLength="10" minLength="6"/>
							&nbsp;
							<img src="/images/ct_icon_date.gif" width="15" height="15" onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
						</c:if>
						<c:if test="${! empty prod }">
							${prod.manuDate }
						</c:if>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">���� 
						<img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
					</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<c:if test="${empty prod }">
							<input type="text" name="price" id="price" class="ct_input_g" style="width: 100px; height: 19px" maxLength="10">&nbsp;��
						</c:if>
						<c:if test="${! empty prod }">
							${prod.price }
						</c:if>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">��ǰ�̹���</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<img id="preview"/>
						<c:if test="${empty prod }">
							<input type="file" name="file" id="file" class="ct_input_g" onchange="javascript:previewImg(this);"/>
						</c:if>
						<c:if test="${! empty prod }">
							${prod.fileName }
						</c:if>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
				<tr>
					<td width="104" class="ct_write">����</td>
					<td bgcolor="D6D6D6" width="1"></td>
					<td class="ct_write01">
						<c:if test="${empty prod }">
							<input type="text" name="prodStock" id="prodStock" class="ct_input_g" style="width: 50px; height: 19px" maxLength="13"
								/> 
							��
						</c:if>
						<c:if test="${! empty prod }">
							${prod.prodStock } ��
						</c:if>
					</td>
				</tr>
				<tr>
					<td height="1" colspan="3" bgcolor="D6D6D6"></td>
				</tr>
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
							<c:if test="${empty prod }">
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"  style="padding-top: 3px;">
									���
								</td>
							</c:if>
							<c:if test="${! empty prod }">
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
									<a href="/product/listProduct?menu=manage">Ȯ��</a>
								</td>
							</c:if>
								<td width="14" height="23">
									<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
								</td>
								<td width="30"></td>
								<td width="17" height="23">
									<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
								</td>
							<c:if test="${empty prod }">
								<td background="/images/ct_btnbg02.gif" class="ct_btn01"	 style="padding-top: 3px;">
									���
								</td>
							</c:if>
							<c:if test="${! empty prod }">
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
									<a href="../product/addProductView.jsp;">�߰����</a>
								</td>
							</c:if>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
							</td>
						</tr>
					</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>