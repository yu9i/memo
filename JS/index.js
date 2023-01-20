$(document).ready(function(){
    //add memo
    $('#addmemo').click(function(){
        $('.beforeadd').css("display", "none");
        $('.afteradd').css("display", "block");
        $('.showmemo').css("display", "none");
    });
    
    $('.back').click(function(){
        $('.beforeadd').css("display", "block");
        $('.afteradd').css("display", "none");
        $('.showmemo').css("display", "none");
    });

    $('.close').click(function(){
        $('.beforeadd').css("display", "block");
        $('.afteradd').css("display", "none");
        $('.showmemo').css("display", "none");
    });

    $('.memo-detail').click(function(){
        $('#memodetail').html($(this).html());
        $('.showmemo').css("display", "block");
        $('.beforeadd').css("display", "none");
        $('.afteradd').css("display", "none");
    });
});
