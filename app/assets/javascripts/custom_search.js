$( document ).ready(function() {
  var selector = $(".selector")

  var minVal = parseFloat(selector.attr("min"));

  var maxVal = parseFloat(selector.attr("max"));

  $("#min-val").val(minVal);

  $("#max-val").val(maxVal);

  $(".selector").slider({
  	range: true,
    min: minVal,
    max: maxVal,
    values: [ minVal, maxVal ],
    slide: function( event, ui ) {
      $("#min-val").val(ui.values[ 0 ]);
      $("#max-val").val(ui.values[ 1 ]);
    }
  });
});
