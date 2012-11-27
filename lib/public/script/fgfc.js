$(document).ready(function() {
    $("#nav li").hover(
            function() {
                $(this).children("ul", this).fadeIn("fast");
                $(this).children("a", this).css({'background-color':'yellow', 'color':'blue'});
            },
            function() {
                $(this).children("a", this).css({'background-color':'#999999', 'color':'white'});
                $(this).children("ul", this).fadeOut("fast");
            }
            );
    $("#nav li").click(
            function() {
                $(this).children("a", this).css({'background-color':'#999999', 'color':'white'});
                $(this).children("ul", this).fadeOut("fast");
            }
            );

    $(".sub_menu_header").click(function() {
        var toggle_state = ($(this).next(".sub_menu").css('display')=="none");
//        $(".sub_menu").hide();
        if (toggle_state) {
//            $(this).find("span").html('-')
            $(this).find("span").css("background-image", "url(../images/minus.png)");
        } else {
//            $(this).find("span").html('+')
            $(this).find("span").css("background-image", "url(../images/plus.png)");
        }
        $(this).next(".sub_menu").toggle(toggle_state);
    });



    $("#samples li").click(function () {
        $("#samples li").removeClass().addClass("sampleAnchors");
        $(this).removeClass().addClass("sample-tab-selected");
        $(".sampleTabContent").hide();
        var elmt = $("a", this).attr("href");
        $(elmt).show();
        return false;
    });


    $(".sampleTabContent").hide();
    $(".sampleTabContent:first").show();
    $("#samples li").removeClass().addClass("sampleAnchors");
    $("#samples li:first").removeClass().addClass("sample-tab-selected");

    $(".alt_row tr:even").css({"background-color": "#cccccc", 'color':'gray'});
    $(".alt_row tr:odd").css({"background-color": "#EFF1F1", 'color':'blue'});
});

function popUp(url) {
    window.open (url,"mywindow","height=800px,width=690px,scrollbars=1");
}

function largePopUp(url) {
   window.open (url,"mywindow","height=900px,width=1050px,scrollbars=1");
}

