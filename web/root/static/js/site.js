// var $site = function () {
// 	function getCandidates(party_id) {
// 		$.ajax({
// 			url: '/admin/election_campaign/filter_candidate/'+party_id,
// 			dataType: 'html',
// 			success: function (result) {
// 				console.log(result)
// 				if( result ) {
// 					$('#candidates').html(result);
// 				} else {
// 					$('#candidates').html('');
// 					alert('Nenhum candidato cadastrado');
// 				}
// 			},
// 			error: function (err) {
// 				console.log(err);
// 			},
// 		});
// 	}
// 
//     return {
// 		getCandidates: getCandidates
//     };
// }();

$(document).ready(function () {
	
	if( $('#elm_electoral_regional_court_select').length ) {
		
		$('#elm_electoral_regional_court_select').change(function(){
			window.location.assign('/processos-tre/'+$(this).val());
		});
		
	}
});