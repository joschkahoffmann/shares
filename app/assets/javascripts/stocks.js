var init_stock_lookup;

init_stock_lookup= function() {
	$('#stock-lookup-form').on('ajax:before', function(event, data, status){
		showSpinner();
	});

	$('#stock-lookup-form').on('ajax:after', function(event, data, status){
		hideSpinner();
	});	
	
	$('#stock-lookup-form').on('ajax:success', function(event, data, status) {
		$('#stock-lookup').replaceWith(data);
		init_stock_lookup();
	});


	$('#stock-lookup-form').on('ajax:error', function(event, xhr, status, error) {
		hideSpinner();
		$('#search-resuts').replaceWith("");
		$('#stock-lookup-errors').replaceWith("<p style= 'color:red'><strong>Stock was not found.<strong><p>");
	})
}

$(document).ready(function() {
	init_stock_lookup();
})