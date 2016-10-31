(function($){
	$(document).ready(function(){
		// update :name param on redirect for api
		$("button#demo_agent_call").click(function(e){
			window.location.href = $(this).data("path").replace("/name", "/" + $("input#api_agent_name").val())
		})	
	})
})(jQuery)