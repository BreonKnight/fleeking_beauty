$(document).ready(function() {
	console.log("Sanity check is working!");

	$('#hotbut').on("click", function (e) {
		p_id = $('#current_img').attr('value')
		p_url = $('#current_img').attr('src')
		$.ajax({
			method: "POST",
			url: "/vote/create",
			data: {upvote: true, place: p_id, photourl: p_url},
			success: function (e) {
			}
		});
	});

	$('#notbut').on("click", function (e) {
		p_id = $('#current_img').attr('value')
		p_url = $('#current_img').attr('src')
		$.ajax({
			method: "POST",
			url: "/vote/create",
			data: {downvote: true, place: p_id, photourl: p_url},
			success: function (e) {
			}
		});
	});
	
});