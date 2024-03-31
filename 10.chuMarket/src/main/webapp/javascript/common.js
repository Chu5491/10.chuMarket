function fncGetList(currentPage) 
{
	$("#currentPage").val(currentPage);
	$("form[name=detailForm]").submit();
}

function previewImg(input) 
{
	if (input.files && input.files[0]) 
	{
		var reader = new FileReader();
		reader.onload = function(e) 
		{
			document.getElementById('preview').src = e.target.result;
	 	};
	 	
		reader.readAsDataURL(input.files[0]);
	}else 
	{
	  document.getElementById('preview').src = "";
	}
}