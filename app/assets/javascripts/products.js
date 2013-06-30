function remove_fields (link) {
	$(link).siblings("input[type=hidden]").val(1);
	$(link).parent(".remove").hide();
}

function add_fields(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g");
	$(link).parent().append(content.replace(regexp, new_id));
}
