$(document).ready(function() {
	console.log("Sanity check is working!");

	$('#hotbut').on("click", function (e) {
		p_id = $('#current_img').attr('value');
								// .data('place-id')
		p_url = $('#current_img').attr('src');
		$.ajax({
			method: "POST",
			url: "/vote",
			// contentType: "application/json; charset=utf-8",
			data: {upvote: true, place: p_id, photourl: "ok"},
			dataType: 'json',
			success: function (e) {
				console.log(e);
				
			}
		});
	});

	$('#notbut').on("click", function (e) {
		p_id = $('#current_img').attr('value')
		p_url = $('#current_img').attr('src')
		$.ajax({
			method: "POST",
			url: "/vote",
			data: {downvote: true, place: p_id, photourl: p_url},
			success: function (e) {
				console.log(e);
			}
		});
	});
	
});