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
	
	function filterCandidates(param) {
		$.ajax({
			url: "/filter_promise_select",
			data:{filter: param},
			dataType: 'html',
			success: function( result ) {
				$("#elm_candidate_id").html(result);
				console.log(result);
			},
			error: function( err ) {
				console.log(err);
			},
			complete: function() {
				$('#elm_candidate_id').removeAttr('disabled');
			}
		});
	}
	
	function filterCategory(param) {
		$.ajax({
			url: "/filter_category_select",
			data:{candidate_id: param},
			dataType: 'html',
			success: function (result) {
				$("#elm_category_id").html(result);
			},
			error: function (err) {
				console.log(err);
			},
		});
	}
	
	return {
		getCandidates: getCandidates,
		filterCandidates: filterCandidates,
		filterCategory: filterCategory
	}
	
}();

$(document).ready(function () {
	
	$('.disabled').attr('disabled', 'disabled');
	
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
	
	var $candidate 	= $('#elm_candidate_id');
	var $state		= $('#elm_state_id');
	var $category	= $('#elm_category_id');
	
	if( $candidate.length && $state.length && $category.length ) {
		$state.change(function(){
			if($(this).val()) {
				$site.filterCandidates($(this).val());
				$site.filterCategory();
			}
		});
		
		$candidate.change(function(){
			$site.filterCategory($(this).val());
		});
	}
	
	
	
//	tag do GA	

	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
		(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	ga('create', 'UA-54191625-1', 'auto');
	ga('send', 'pageview');
	
});