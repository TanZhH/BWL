/**
 * Created by CWZZ on 2016/12/5.
 *
 */

$(document).ready(
    function () {
        $("#pageId").val(1);
        var pageSize = 3;
        var pages = 0;
        var total = $("#total").val();
        if (total % pageSize == 0) {
            pages = total / pageSize;
        } else {
            pages = Math.floor(total / pageSize + 1);
        }
        $("#sumSpan").html(pages);
        for (var i = 1; i <= pageSize; i++) {//首页显示
            if (i <= total)
                $("#tr_" + i).css("display", "");
        }
        
        $("#first").click(
            function () {
                showPage(1,total,pageSize);
            }
        )
        
        $("#last").click(
            function () {
                showPage(pages,total,pageSize);
            }
        )
        
        $("#back").click(
            function () {
                var page = $("#pageId").val();
                var currentPage = parseInt(page) - 1;
                if (page == 1) {
                    alert("已经是第一页了！");
                }
                else {
                    showPage(currentPage,total,pageSize);
                }
            }
        )
        
        $("#next").click(
            function () {
                var page = $("#pageId").val();
                var currentPage = parseInt(page) + 1;
                if (page == pages) {
                    alert("已经是最后一页了！");
                }
                else {

                    showPage(currentPage,total,pageSize);
                }
            }
        )



    }
)

function hide(total) {
    for (var i = 1; i <= total; i++) {
        $("#tr_" + i).css("display", "none");
    }
}

function showPage(currentPage, total, pageSize) {
    hide(total);
    var start = (currentPage - 1) * pageSize;
    var end = currentPage * pageSize;
    for (var i = start + 1; i <= end; i++) {
        if(i<=total)
        $("#tr_" + i).css("display", "");
    }
    $("#pageSpan").html(currentPage);
    $("#pageId").val(currentPage);
}


