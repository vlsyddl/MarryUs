<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
   <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
    <style>
           * { margin: 0px; padding: 0px; box-sizing: border-box; }
        body {
            font-size: 17px;
            color: #333;
            line-height: 3;
        }

        .container-fluid {
            padding-left: 15px;
            padding-right: 15px;
            margin-left: auto;
            margin-right: auto;
        }
        .container {
            width: 1170px;
            padding-left: 15px;
            padding-right: 15px;
            margin-left: auto;
            margin-right: auto;    
        }


        table{
            border-spacing:50px;
            border-collapse: collapse;
            width: 1000px;
            text-align: center;
        }
        td, th { padding: 0px; }
        .table {
            width: 100%; 
            margin-bottom: 20px;
        }

         .table > tbody > tr {
            border-radius: 10px;
         }
        .table > tbody > tr > td, .table > tbody > tr > th {
            padding: 8px;
            vertical-align: top;
            border-top: 1px solid #ddd;
            line-height: 1.42;
        } 

        .table-striped > tbody > tr:nth-of-type(odd) {
            background-color: #f9f9f9; 
        }
        
        .table-bordered > tbody > tr > td {
            border-bottom: 1px solid #ddd;
        }

        .table-bordered > tbody > tr > th{
            background: #ccc9c9;
            color: #5c4c4c;
        }

        .table-hover > tbody > tr:hover {
            background-color: #d6d6d6;
        }



        .btn {
            padding: 6px 12px;
            border: 1px solid transparent;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:active {
            box-shadow: 0 3px 5px rgba(0, 0, 0, .125) inset;
        }
        .btn:focus, .btn:hover {
            color: #333;
        }
        .textstyle{
            color: #f9f9f9;
            font-weight: 700;
            border-radius: 3px;
            padding: 3px;
        }
        input, select{
            border-right:0px; border-top:0px; border-left:0px; border-bottom:1px solid #ccc9c9;
            line-height: 30px;
            font-size:15px;
        }
    </style>

</head>
<body>
	<c:import url="/common/importHeader.jsp" />
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



	 <table class="table-bordered container-fluid">
        <tr>
            <th>카테고리</th>
            <th>항목</th>
            <th>예산</th>
            <th>지출</th>
            <th></th>
        </tr>
        <tr>
                <td>혼수</td>
                <td>다리미</td>
                <td>50,000원</td>
                <td>33,000원</td>
                <td> <i class="far fa-trash-alt"><button></button></i></td>
        </tr>
        <tr>
                <td>
                    <select name="category">
                        <option value="">--카테고리--</option>
                        <option value="">혼수</option>
                        <option value="">예단, 예물</option>
                        <option value="">신혼집</option>
                        <option value="">스드메</option>
                    </select>
                </td>
                <td><input type="text" name="detail" placeholder="항목"></td>
                <td><input type="text" name="budget" placeholder="예산">원</td>
                <td>
                    <input type="text" name="expense" placeholder="지출">원
                </td>
                <td>
                    <i class="fas fa-pen"><button></button></i>
                </td>
        </tr>
    </table>
</body>
</html>