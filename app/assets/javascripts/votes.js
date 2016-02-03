$(document).ready(function() {
	console.log("Sanity check is working!");

	$('#hotbut').on("click", function (e) {
		p_id = $('#current_img').attr('data-place');
		p_url = $('#current_img').attr('src');
		$.ajax({
			method: "POST",
			url: "/vote",
			// contentType: "application/json; charset=utf-8",
			dataType: 'json',
			data: {upvote: true, place_id: p_id, photourl: p_url},
			success: function (newImg) {
				imgUrl = newImg.url;
				imgPlace = newImg.place;
				$('#current_img').replaceWith(generatePhoto(imgUrl, imgPlace));
			}
		});
	});

	$('#notbut').on("click", function (e) {
		p_id = $('#current_img').attr('data-place')
		p_url = $('#current_img').attr('src')
		$.ajax({
			method: "POST",
			url: "/vote",
			dataType: 'json',
			data: {downvote: true, place: p_id, photourl: p_url},
			success: function (newImg) {
				imgUrl = newImg.url;
				imgPlace = newImg.place;
				$('#current_img').replaceWith(generatePhoto(imgUrl, imgPlace));
			}
		});
	});

	function generatePhoto(imgUrl, imgPlace) {
		replacement_image ="<img src='"+imgUrl+"'"+" data-place='"+imgPlace+"'"+" id='"+"current_img"+"'"+" height='"+"400"+"'"+" width='"+"400"+"'"+"/>";
		return replacement_image;
	}
	
});





