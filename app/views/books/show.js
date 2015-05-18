$(".modal-content").html("<%= escape_javascript(render 'show') %>");
$(".n-modal").modal("show");