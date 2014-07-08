$(document).ready(function () {
	if( $('#elm_electoral_regional_court_select').length ) {
		
		$('#elm_electoral_regional_court_select').change(function(){
			if( $(this).val() ) {
				window.location.assign('/processos-tre/'+$(this).val());
			}
		});
		
	}
});