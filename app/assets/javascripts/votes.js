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
			dataType: 'json',
			data: {upvote: true, place: p_id, photourl: p_url},
			success: function (newImg) {
				imgUrl = newImg.url;
				imgPlace = newImg.place;
				replacement_image ="<img src='"+imgUrl+"'"+" value='"+imgPlace+"'"+" id='"+"current_img"+"'"+" height='"+"350"+"'"+" width='"+"350"+"'"+"/>";
				console.log("Replacing", replacement_image);
				$('#current_img').replaceWith(replacement_image);
			}
		});
	});

	$('#notbut').on("click", function (e) {
		p_id = $('#current_img').attr('value')
		p_url = $('#current_img').attr('src')
		$.ajax({
			method: "POST",
			url: "/vote",
			dataType: 'json',
			data: {downvote: true, place: p_id, photourl: p_url},
			success: function (newImg) {
				imgUrl = newImg.url;
				imgPlace = newImg.place;
				replacement_image ="<img src='"+imgUrl+"'"+" value='"+imgPlace+"'"+" id='"+"current_img"+"'"+" height='"+"350"+"'"+" width='"+"350"+"'"+"/>";
				console.log("Replacing", replacement_image);
				$('#current_img').replaceWith(replacement_image);
			}
		});
	});
	
});