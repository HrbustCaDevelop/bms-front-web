//对当前链接父菜单高亮显示
$(document).ready(function() {
        var currLink = window.location.pathname + window.location.search;
        var curNode = $(".active");
        //选取所有的菜单项
        var TreeNode = $(".treelist");
        if ( currLink != webroot + "/system/" ) {
                TreeNode.each(function() {
                        if (hasLink($(this))) {
                                curNode.removeClass("active");
                                $(this).addClass("active");
                                $(this).addClass("open");
                                $(this).find("span.arrow").addClass("open");
                                return false;
                        }
                });
        }
        //菜单查找方法
        function hasLink(obj) {
                var myNav = obj.find("a"), i;
                for(i = 0; i < myNav.length; i++) {
                        var links = myNav.eq(i).attr("href");
                        if(links.indexOf(currLink) != -1 || currLink.indexOf(links) != -1) { return true; }
                }
                return false;
        }
        //dynamic current year generation
        var today;
        today = new Date();
        var year = today.getYear();
        if (year < 1900) year = year + 1900;
        $(".currentYear").text(year);
});