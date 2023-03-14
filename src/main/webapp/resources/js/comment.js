
	function get_comment(item) {
        
	    const li = $("<li>");
		li.attr("data-id", item.id);

	    const contents = "";
	    contents.addClass("contents");
	    contents.text(item.contents);
	    li.append(contents);

	    $("#clist").append(li);
	}

		$.ajax("/api/comment", {
			method : "GET",
			contentType:"application/json",
			dataType: 'json',
			success : result => {
				if(result.length > 0){
					$("#empty_list").addClass("empty_list");
				}else{
					$("#empty_list").removeClass("empty_list");
				};
				result.forEach(item => {
					get_comment(item);
				});

			console.log(result);
			},
			
		});