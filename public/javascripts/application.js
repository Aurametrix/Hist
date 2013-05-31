$(function() {
	var projects = [
		{
			value: 'headache',
			label: 'pain in the head',
			desc: 'pain in head and neck area',
			icon: 'headache_32x32.png',
			parent: 'symptom'
		},
		{
			value: 'Running',
			label: 'running',
			desc: 'moving fast',
			icon: 'running_32x32.png',
			parent: 'activity'
		},
		{
			value: 'apple',
			label: 'raw apple',
			desc: 'round fruit',
			icon: 'apple_32x32.png',
			parent: 'fruit'
		},
	];

	$('#query').autocomplete({
		minLength: 0,
		source: projects,
		focus: function(event, ui) {
			$('#query').val(ui.item.label);
			return false;
		},
		select: function(event, ui) {
			$('#query').val(ui.item.label);
			$('#query-id').val(ui.item.value);
			$('#query-description').html(ui.item.desc);
			$('#query-icon').attr('src', 'images/' + ui.item.icon);

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
