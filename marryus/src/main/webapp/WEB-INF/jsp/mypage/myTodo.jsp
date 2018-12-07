<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>

    <!--Default installation-->
    <link rel="stylesheet" href="<c:url value='/resources/todo/jquery/jquery-ui.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/bootstrap/css/bootstrap.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/dist/lobilist.min.css'/>" />

    <!--Installation using bower. Preferred!!! -->
    <!--<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/jquery-ui/themes/ui-lightness/jquery-ui.min.css"/>-->
    <!--<link rel="stylesheet" href="bower_components/lobilist/dist/lobilist.min.css"/>-->
    <link rel="stylesheet" href="<c:url value='/resources/todo/lobibox/css/lobibox.min.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/todo/highlight/github.css'/>" />
   <%--  <link rel="stylesheet" href="<c:url value='/resources/todo/demo/demo.css'/>" /> --%>
   
   <script>
    $(function () {
        $('#todo-lists-basic-demo').lobiList({
            lists: [
                {
                    id: 'todo',
                    title: 'TODO',
                    defaultStyle: 'lobilist-info',
                    items: [
                        {
                            title: '${todo[0].todoCheck}',
                            description: 'Thunder fulfilled travellers folly, wading, lake.',
                            dueDate: '2015-01-31'
                        },
                        {
                            title: 'Periods pride',
                            description: 'Accepted was mollis',
                            done: true
                        },
                        {
                            title: 'Flags better burns pigeon',
                            description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank treacherously darkling.'
                        },
                        {
                            title: 'Accepted was mollis',
                            description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank treacherously darkling.',
                            dueDate: '2015-02-02'
                        }
                    ]
                },
                {
                    id: 'doing',
                    title: 'DOING',
                    items: [
                        {
                            title: 'Composed trays',
                            description: 'Hoary rattle exulting suspendisse elit paradises craft wistful. Bayonets allures prefer traits wrongs flushed. Tent wily matched bold polite slab coinage celerities gales beams.'
                        },
                        {
                            title: 'Chic leafy'
                        },
                        {
                            title: 'Guessed interdum armies chirp writhes most',
                            description: 'Came champlain live leopards twilight whenever warm read wish squirrel rock.',
                            dueDate: '2015-02-04',
                            done: true
                        }
                    ]
                }
            ]
        });
    });
</script>
    
   
</head>
<body>
<header>
	<div class="container">
		<div class="row">
			<div class="logo col-md-3">
				<a href="<c:url value="/main/main.do"/>"><img
					src="<c:url value="/resources/img/logo.png"/>" alt=""
					class="img-responsive center-block"></a>
			</div>
			<nav class="gnb col-md-9">
			<div class="gnb_top cf">
				<ul class="cf">
					<li><a href="<c:url value='/signup/signupPro.do' />">회원가입</a></li>
					<!-- 로그인, 로그아웃 -->
					<c:if test="${user.email eq null}">
						<li><a href="#" data-toggle="modal" data-target="#loginModal">로그인</a></li>
					</c:if>
					<c:if test="${user.email ne null}">
					
							<li>${user.name}님이로그인 하셨습니다.</li>
					
						<li><a href="<c:url value='/main/logout.do' />"> 로그아웃</a></li>
					</c:if>
					<li><a href="<c:url value="/mypage/mywedding.do"/>">마이페이지</a></li>
					<li><a href="#"><i class="far fa-bell"></i></a></li>
				</ul>
			</div>
			<div class="gnb_bot cf">
				<ul class="cf">
					<li><a href="<c:url value="/service/weddingHall.do"/>">웨딩홀</a></li>
					<li><a href="#">스&middot;드&middot;메</a></li>
					<li><a href="#">허니문</a></li>
					<li><a href="#">예물</a></li>
					<li><a href="#">추가서비스</a></li>
				</ul>
			</div>
			</nav>
		</div>
	</div>
	<span class="gnbBar"></span> 
</header>
    <div id="wrap" class="mypage">
        <nav class="myPageNav">
            <div class="container">
                    <ul>
                        <li class="on">
                            <a href="<c:url value='/mypage/mywedding.do'/>">
                                    <img src="img/hall_ico.png" alt="" class="img-responsive center-block">
                                My Wedding
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myTodo.do'/>">
                                    <img src="img/chk_ico.png" alt="" class="img-responsive center-block">
                                Check List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myAuction.do?memNo=${user.no}&auctionType=v'/>">
                                <img src="img/auction_ico.png" alt="" class="img-responsive center-block">
                                Auction List
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/myBudget.do'/>">
                                <img src="img/budget_ico.png" alt="" class="img-responsive center-block">
                                Budget Spent
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value='/mypage/likeCompany.do?memNo=${user.no}'/>">
                                <img src="img/bookmark_ico.png" alt="" class="img-responsive center-block">
                                Bookmark
                            </a>
                        </li>


                    </ul>
            </div>
        </nav>





	


<div class="container">
    <div id="lobilist">
        <!--Examples-->
        <div id="lobilist-examples">
            <h1>Examples</h1>
            <hr>
            <!--Basic example-->
            <div>
                <div class="bs-example">
                    <h4>Basic example</h4>
                    <div id="todo-lists-basic-demo"></div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--Default installation-->


		<script type="text/javascript" src="<c:url value="/resources/todo/jquery/jquery.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/jquery/jquery-ui.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/jquery/jquery.ui.touch-punch-improved.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/bootstrap/js/bootstrap.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/dist/lobilist.js"/>" charset="utf-8"></script>


	 
	 
	 
  <%--   <script src="<c:url value='/resources/todo/jquery/jquery.min.js'/>"></script>
<script src="/resources/todo/jquery/jquery-ui.min.js"></script>
<script src="/resources/todo/jquery/jquery.ui.touch-punch-improved.js"></script>
<script src="/resources/todo/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/todo/dist/lobilist.js"></script>
 --%>
<!--Installation using bower. Preferred!!! -->
<!--<script src="bower_components/jquery/dist/jquery.min.js"></script>-->
<!--<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>-->
<!--<script src="bower_components/jquery-ui-touch-punch-improved/jquery.ui.touch-punch-improved.js"></script>-->
<!--<script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>-->
<!--<script src="bower_components/lobilist/dist/lobilist.min.js"></script>-->

	<script type="text/javascript" src="<c:url value="/resources/todo/lobibox/js/lobibox.min.js"/>" charset="utf-8"></script>
		<script type="text/javascript" src="<c:url value="/resources/todo/highlight/highlight.pack.js"/>" charset="utf-8"></script>
	<%-- 	<script type="text/javascript" src="<c:url value="/resources/todo/demo/demo.js"/>" charset="utf-8"></script> --%>
	
	<script>
	/**
 * Created by Zura on 4/5/2016.
 */
 
 
 <%-- 


	<input type="text" name="todoContent" />
	<select name="todoCategory">
		<option>--카테고리--</option>
		<option value="w">결혼</option>
		<option value="wk">웨딩 페키지</option>
		<option value="ㅇㅇ">어라</option>
	</select>
	<select name="todoSchedule">
		<option>--시기--</option>
		<option value="1">4달~3달</option>
		<option value="2">3달~1달</option>
		<option value="3">1달~결혼식</option>
	</select>
	<input type="submit">작성하기</input>
	


	<c:forEach var="t" items="${todo}">
		${t.todoSchedule}
		${t.todoContent}
		${t.todoDday}
		${t.todoCategory}
		${t.todoNo}
		${t.memNo}
		${t.todoCheck}
		${t.todoDelete}
		${t.todoSchedule}
	</c:forEach> --%>
 
 
 
$(function () {
    Lobibox.notify.DEFAULTS = $.extend({}, Lobibox.notify.DEFAULTS, {
        size: 'mini',
        // delay: false,
        position: 'right top'
    });
    alert(JSON.stringify(`${todo}`));
    //Basic example
    $('#todo-lists-basic-demo').lobiList({
        lists: [
            {
                id: 'todo',
                title: '${todo[0].todoSchedule}',
                defaultStyle: 'lobilist-info',
                items: [
	                    {
	                        title: '${todo[i].todoContent}',
	                        description: '${todo[i].todoContent}',
	                        dueDate: '${todo[i].todoDday}'
	                    },
                    {
                        title: 'Periods pride',
                        description: 'Accepted was mollis',
                        done: true
                    },
                    {
                        title: 'Flags better burns pigeon',
                        description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank treacherously darkling.'
                    },
                    {
                        title: 'Accepted was mollis',
                        description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank treacherously darkling.',
                        dueDate: '2015-02-02'
                    }
                ]
            },
            {
                title: 'DOING',
                items: [
                    {
                        title: 'Composed trays',
                        description: 'Hoary rattle exulting suspendisse elit paradises craft wistful. Bayonets allures prefer traits wrongs flushed. Tent wily matched bold polite slab coinage celerities gales beams.'
                    },
                    {
                        title: 'Chic leafy'
                    },
                    {
                        title: 'Guessed interdum armies chirp writhes most',
                        description: 'Came champlain live leopards twilight whenever warm read wish squirrel rock.',
                        dueDate: '2015-02-04',
                        done: true
                    }
                ]
            }
        ]
    });
    //Custom datepicker
    $('#todo-lists-demo-datepicker').lobiList({
        lists: [
            {
                title: 'TODO',
                defaultStyle: 'lobilist-info',
                items: [
                    {
                        title: 'Floor cool cinders',
                        description: 'Thunder fulfilled travellers folly, wading, lake.',
                        dueDate: '2015-01-31'
                    }
                ]
            }
        ],
        afterListAdd: function(lobilist, list){
            var $dueDateInput = list.$el.find('form [name=dueDate]');
            $dueDateInput.datepicker();
        }
    });
    // Event handling
    (function () {
        var list;

        $('#todo-lists-initialize-btn').click(function () {
            list = $('#todo-lists-demo-events')
                .lobiList({
                    init: function () {
                        Lobibox.notify('default', {
                            msg: 'init'
                        });
                    },
                    beforeDestroy: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeDestroy'
                        });
                    },
                    afterDestroy: function () {
                        Lobibox.notify('default', {
                            msg: 'afterDestroy'
                        });
                    },
                    beforeListAdd: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeListAdd'
                        });
                    },
                    afterListAdd: function () {
                        Lobibox.notify('default', {
                            msg: 'afterListAdd'
                        });
                    },
                    beforeListRemove: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeListRemove'
                        });
                    },
                    afterListRemove: function () {
                        Lobibox.notify('default', {
                            msg: 'afterListRemove'
                        });
                    },
                    beforeItemAdd: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeItemAdd'
                        });
                    },
                    afterItemAdd: function () {
                        console.log(arguments);
                        Lobibox.notify('default', {
                            msg: 'afterItemAdd'
                        });
                    },
                    beforeItemUpdate: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeItemUpdate'
                        });
                    },
                    afterItemUpdate: function () {
                        console.log(arguments);
                        Lobibox.notify('default', {
                            msg: 'afterItemUpdate'
                        });
                    },
                    beforeItemDelete: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeItemDelete'
                        });
                    },
                    afterItemDelete: function () {
                        Lobibox.notify('default', {
                            msg: 'afterItemDelete'
                        });
                    },
                    beforeListDrop: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeListDrop'
                        });
                    },
                    afterListReorder: function () {
                        Lobibox.notify('default', {
                            msg: 'afterListReorder'
                        });
                    },
                    beforeItemDrop: function () {
                        Lobibox.notify('default', {
                            msg: 'beforeItemDrop'
                        });
                    },
                    afterItemReorder: function () {
                        Lobibox.notify('default', {
                            msg: 'afterItemReorder'
                        });
                    },
                    afterMarkAsDone: function () {
                        Lobibox.notify('default', {
                            msg: 'afterMarkAsDone'
                        });
                    },
                    afterMarkAsUndone: function () {
                        Lobibox.notify('default', {
                            msg: 'afterMarkAsUndone'
                        });
                    },
                    styleChange: function(list, oldStyle, newStyle){
                        console.log(arguments);
                        Lobibox.notify('default', {
                            msg: 'styleChange: Old style - "'+oldStyle+'". New style - "'+ newStyle +'"'
                        });
                    },
                    titleChange: function(list, oldTitle, newTitle){
                        console.log(arguments);
                        Lobibox.notify('default', {
                            msg: 'titleChange: Old title - "'+oldTitle+'". New title - "'+ newTitle + '"'
                        });
                    },
                    lists: [
                        {
                            title: 'TODO',
                            defaultStyle: 'lobilist-info',
                            items: [
                                {
                                    title: 'Floor cool cinders',
                                    description: 'Thunder fulfilled travellers folly, wading, lake.',
                                    dueDate: '2015-01-31'
                                },
                                {
                                    title: 'Periods pride',
                                    description: 'Accepted was mollis',
                                    done: true
                                },
                                {
                                    title: 'Flags better burns pigeon',
                                    description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank ' +
                                    'treacherously darkling.'
                                },
                                {
                                    title: 'Accepted was mollis',
                                    description: 'Rowed cloven frolic thereby, vivamus pining gown intruding strangers prank ' +
                                    'treacherously darkling.',
                                    dueDate: '2015-02-02'
                                }
                            ]
                        }
                    ]
                })
                .data('lobiList');
        });

        $('#todo-lists-destroy-btn').click(function () {
            list.destroy();
        });
    })();
    // Custom controls
    $('#todo-lists-demo-controls').lobiList({
        lists: [
            {
                title: 'TODO',
                defaultStyle: 'lobilist-info',
                controls: ['edit', 'styleChange'],
                items: [
                    {
                        title: 'Floor cool cinders',
                        description: 'Thunder fulfilled travellers folly, wading, lake.',
                        dueDate: '2015-01-31'
                    }
                ]
            },
            {
                title: 'Disabled custom checkboxes',
                defaultStyle: 'lobilist-danger',
                controls: ['edit', 'add', 'remove'],
                useLobicheck: false,
                items: [
                    {
                        title: 'Periods pride',
                        description: 'Accepted was mollis',
                        done: true
                    }
                ]
            },
            {
                title: 'Controls disabled',
                controls: false,
                items: [
                    {
                        title: 'Composed trays',
                        description: 'Hoary rattle exulting suspendisse elit paradises craft wistful. ' +
                        'Bayonets allures prefer traits wrongs flushed. Tent wily matched bold polite slab coinage ' +
                        'celerities gales beams.'
                    }
                ]
            },
            {
                title: 'Disabled todo edit/remove',
                enableTodoRemove: false,
                enableTodoEdit: false,
                items: [
                    {
                        title: 'Composed trays',
                        description: 'Hoary rattle exulting suspendisse elit paradises craft wistful. ' +
                        'Bayonets allures prefer traits wrongs flushed. Tent wily matched bold polite slab coinage ' +
                        'celerities gales beams.'
                    }
                ]
            }
        ]
    });
    // Disabled drag & drop
    $('#todo-lists-demo-sorting').lobiList({
        sortable: false,
        lists: [
            {
                title: 'TODO',
                defaultStyle: 'lobilist-info',
                controls: ['edit', 'styleChange'],
                items: [
                    {
                        title: 'Floor cool cinders',
                        description: 'Thunder fulfilled travellers folly, wading, lake.',
                        dueDate: '2015-01-31'
                    }
                ]
            },
            {
                title: 'Controls disabled',
                controls: false,
                items: [
                    {
                        title: 'Composed trays',
                        description: 'Hoary rattle exulting suspendisse elit paradises craft wistful. Bayonets allures prefer traits wrongs flushed. Tent wily matched bold polite slab coinage celerities gales beams.'
                    }
                ]
            }
        ]
    });

    $('#actions-by-ajax').lobiList({
        actions: {
            load: 'demo/example1/load.json',
            insert: 'demo/example1/insert.php',
            delete: 'demo/example1/delete.php',
            update: 'demo/example1/update.php'
        },
        afterItemAdd: function(){
            console.log(arguments);
        }
    });
});



	
</script>
	
	
</body>
</html>