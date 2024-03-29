function fncGetList(currentPage) 
{
	$("#currentPage").val(currentPage);
	$("form[name=detailForm]").submit();
}