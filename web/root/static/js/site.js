var $site = function(){
	function getCandidates(candidate_id) {
		
		if(candidate_id) {
			$.ajax({
				url: "/perfil-candidato/"+candidate_id,
				dataType: 'html',
				success: function (result) {
					$('.modal-body').html(result);
				},
				error: function (err) {
					console.log(err);
				},
				complete: function () {
					$('#modalCandidato').modal({show:true})
				}
			});
		}
	}
	
	return {
		getCandidates: getCandidates
	}
}();


$(document).ready(function () {
	if( $('#elm_electoral_regional_court_select').length ) {
		
		$('#elm_electoral_regional_court_select').change(function(){
			if( $(this).val() ) {
				window.location.assign('/processos-tre/'+$(this).val());
			}
		});
		
	}
	
	if( $('#modalCandidato').length ) {
		$('.profile_candidate').click(function() {
			$site.getCandidates($(this).attr('id'));
		});
	}
	
});