$(function() {	
	$('#query').autocomplete({
		minLength: 1,
		source: function(request, response) {
		  $.getJSON('/search', {query: request.term}, function(data) {
        response($.map(data, function(item) {
          return { label: item.type, value: item.name, category: item.category, id: item._id}
        }));
        
      });
		},

		focus: function(event, ui) {
			$('#query').val(ui.item.value);
			return false;
		},

		select: function(event, ui) {
		  $("#query_food_id").val(ui.item.id)
		  $("#search_form").submit();
			return false;
		}
	})
	.data( "autocomplete" )._renderItem = function( ul, item ) {
	  var cat = item.category ? item.category : item.value;
		return $( "<li></li>" )
			.data( "item.autocomplete", item )
			.append( "<a> <span class='parent'>" + cat + ": </span><span class='value'>" + item.value + "</span></a>" )
			.appendTo( ul );
	};
  
});
