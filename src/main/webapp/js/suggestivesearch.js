//function getuserNames(event)
//{
//	var username = $("#search").val();
//	alert(username);
//	
//	$.ajax({
//		url:"suggestivesearch",
//		type:"GET",
//		
//	})
//}
//

$(document).ready(function() {
  $('#search').keyup(function() {
    var search = $(this).val();
    
    $.ajax({
      url: '/suggestions',
      type: 'GET',
      data: { search: search },
      success: function(response) {
        // Clear previous suggestions
        $('#suggestions').empty();
        
        // Add new suggestions
        response.forEach(function(suggestion) {
          $('#suggestions').append('<option value="' + suggestion + '">');
        });
      }
    });
  });
});