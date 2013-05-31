$(function() {	
	$('#query').autocomplete({
		minLength: 2,
		source: function(request, response) {
		  $.getJSON('/search', function(data) {
        response($.map(data, function(item) {
          return { label: item.type, value: item.name, parent: item.type, id: item._id}
        }));
        
      });
		},

		focus: function(event, ui) {
			$('#query').val(ui.item.label);
			return false;
		},

		select: function(event, ui) {
		  alert(ui.item.id)
			return false;
		}
	})
	.data( "autocomplete" )._renderItem = function( ul, item ) {
		return $( "<li></li>" )
			.data( "item.autocomplete", item )
			.append( "<a> <span class='parent'>" + item.parent + ": </span><span class='value'>" + item.value + "</span></a>" )
			.appendTo( ul );
	};
});
