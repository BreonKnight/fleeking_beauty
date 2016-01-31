$(document).ready(function() {
	console.log("Sanity check is working!");
	
	$('#hotbut').on("click", function (e) {
	console.log("THAT'S HOT");
	});

	$('#notbut').on("click", function (e) {
	console.log("THAT'S NOT. Ew.");
	});

});