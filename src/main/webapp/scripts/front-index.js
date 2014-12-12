$(document).ready(function(){
    $(".list-item").click(function() {
        var name = $(this).find(".name").text();
        $(".text-primary").text(name);
        if ($(".hide").length != 0) {
            $(".dialog").removeClass("hide");
        }
    });
    $("button.btn").click(function() {
        window.location.href = "grades.html";
    });
});