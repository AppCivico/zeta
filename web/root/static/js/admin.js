var $admin = function () {
	
	function getCandidates(party_id) {
		$.ajax({
			url: '/admin/election_campaign/filter_candidate/'+party_id,
			dataType: 'html',
			success: function (result) {
				if( result ) {
					$('#candidates').html(result);
				} else {
					$('#candidates').html('');
					alert('Nenhum candidato cadastrado');
				}
			},
			error: function (err) {
				console.log(err);
			},
		});
	}

	function getElectionCampaigns(position_id) {
		$.ajax({
			url: '/admin/coalition/filter_election_campaign',
			dataType: 'html',
			data: { political_position_id: position_id },
			success: function (result) {
				console.log(result)
				if( result ) {
					$('#coalition').html(result);
				} else {
					$('#coalition').html('');
					alert('Nenhuma campanha eleitoral cadastrada');
				}
			},
			error: function (err) {
				console.log(err);
			},
			complete: function() {
				if($('#elm_state_id').length) {
					$('#elm_state_id').on('change', function () {
						$address.get_cities($(this).val());
					});
				}
			}
		});
	}

	return {
		getCandidates: getCandidates,
		getElectionCampaigns: getElectionCampaigns
    };
}();

$(document).ready(function () {
	
	if( $('#candidates').length ) {
		$('#elm_political_party').change(function(){
			$admin.getCandidates($(this).val());
		});
	}
	
	if( $('#elm_political_position_id').length ) {
		$('#elm_political_position_id').change(function() {
			$admin.getElectionCampaigns($(this).val());
		});
	}

});