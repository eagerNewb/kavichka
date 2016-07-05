// jQuery(document).ready(function() {
    // $(document).on('load',function(){
    //     $('.iframe-obj').css("background","#f5f5f5");  
    // });
// });
jQuery(document).ready(function() {
    var x=$('#initial').html();
    $('#add').click(function(){
        $('body').append(x);
    });
    $(document).on('load','.abc',function(){
        alert('started');
    });
});