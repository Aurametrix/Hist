$(function() {
  $('form a.add_child').click(function() {
    var assoc   = $(this).attr('data-association');
    var content = $('#' + assoc + '_fields_template').html();
    var regexp  = new RegExp('new_' + assoc, 'g');
    var new_id  = new Date().getTime();

$(function() {
  $('form a.remove_child').live('click', function() {
    var hidden_field = $(this).prev('input[type=hidden]')[0];
    if(hidden_field) {
      hidden_field.value = '1';
    }
    $(this).parents('.fields').hide();
    return false;
  });
});

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
		  alert(ui.item.id)
			return false;
		}
	})
	.data( "autocomplete" )._renderItem = function( ul, item ) {
		return $( "<li></li>" )
			.data( "item.autocomplete", item )
                        .append( "<a> <span class='parent'>" + cat + ": </span><span class='value'>" + item.value + "</span></a>" )
			.appendTo( ul );
	};
});
