$( document ).ready(function() {
  var selector = $(".selector")

  var minVal = parseFloat(selector.attr("min"));

  var maxVal = parseFloat(selector.attr("max"));

  $("#min-val").val(minVal);

  $("#max-val").val(maxVal);

  $( "#amounts" ).html("$" + Math.round(minVal).toFixed(2) + " - $" + Math.round(maxVal).toFixed(2) );

  $(".selector").slider({
  	range: true,
    min: minVal,
    max: maxVal,
    values: [ minVal, maxVal ],
    slide: function( event, ui ) {
      $("#min-val").val(ui.values[ 0 ]);
      $("#max-val").val(ui.values[ 1 ]);
      $( "#amounts" ).html("$" + Math.round(ui.values[ 0 ]).toFixed(2) + " - $" + Math.round(ui.values[ 1 ]).toFixed(2) );
    }
  });
});
