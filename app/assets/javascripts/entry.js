$( document ).ready(function() {
  $('#create-entry').submit(function(e) {
    e.preventDefault();

    $("#entry-form-submit button").hide();

    var request = $.ajax({
	  url: "/entries",
	  method: "POST",
	  data: {entry_params: $('#create-entry').serialize()}
	});

	request.done(function(response) {
	  	$('#submit-button-here').append(response);
	  });
  });
});