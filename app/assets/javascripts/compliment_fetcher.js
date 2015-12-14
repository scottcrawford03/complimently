$(document).ready(function() {
  $('.compliment_fetcher').click(function(){
    getDemCompliments()
  })

  function getDemCompliments() {
    $.ajax({
     method: "GET",
     url: "/api/compliments",
     dataType: "json",
     success: function(data) {
       updateCompliment(data);
     },
     error: function() {
              alert("Compliments are out of commission at the minute");
            }
    });
  }

  function updateCompliment(data) {
    $('.user_compliments').text(data.compliment)
  }
})
