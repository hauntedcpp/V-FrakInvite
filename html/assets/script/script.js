let job
let recruter
let recID

$(document).ready(function() {
    $(".form").hide();
});

window.addEventListener('message', function(event) {

    job = event.data.job;
    recruter = event.data.recruter;
    recID = event.data.recID;

    if (event.data.action === "open") {
        $(".form").show();
        $('#title').text(event.data.title);
        $('#text').text(event.data.text);
        $('#accept').text(event.data.accept);
        $('#decline').text(event.data.cancel);
    } else if (event.data.action === "close") {
        $(".form").hide();
    }
});


$(document).keyup(function(e) {
    if (e.key === "Escape") {
        $.post('http://V-FrakInvite/CloseNUI', JSON.stringify({}));
        $('.form').hide();
   }
});

$(document).ready(function(){
    
    $('#decline').click(function(){
        $.post('http://V-FrakInvite/decline', JSON.stringify({
            recruter: recruter,
            job: job,
            recID: recID
        }), function(response) {
            console.log("Accept response:", response);
        });
        $.post('http://V-FrakInvite/CloseNUI', JSON.stringify({}));
    });

    $('#accept').click(function(){
        $.post('http://V-FrakInvite/accept', JSON.stringify({
            recruter: recruter,
            job: job,
            recID: recID
        }), function(response) {
            console.log("Accept response:", response);
        });
    });

    $.post('http://V-FrakInvite/CloseNUI', JSON.stringify({}));
})