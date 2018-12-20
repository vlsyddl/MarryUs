<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Marry Us</title>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dc6291b36d6e91a7fc6b30e92a9171d3&libraries=services"></script>
    <c:import url="/common/importCss.jsp"/>
	 <c:import url="/common/importJs.jsp"/>
	 <script src="https://unpkg.com/sweetalert2@latest/dist/sweetalert2.all.js"></script>
    <link rel="stylesheet" href="<c:url value="/resources/css/wedding.css"/>">
</head>
<body>
	<c:import url="/common/importHeader.jsp" />
    <div id="wrap" class="wedding">
        <div class="sub_visual">
            <div class="titleBox">
                <h2>스.드.메</h2>
                <p>
                    스튜디오 &middot; 드레스 &middot; 메이크업
                </p>
            </div>
        </div>
        <section class="contents contents01">
            <div class="container">
                <div class="contentsTab">
                    <ul>
                        <li data-target="tab1"><a href="<c:url value='/service/sdme/companyList.do' />">업체리스트</a></li>
                        <li data-target="tab2" class="on"><a href="<c:url value='/service/sdme/auctionList.do' />">경매리스트</a></li>
                    </ul>
                    <div class="tabContents">
                        <div class="tab2 on">
                        <!-- Button trigger modal -->
                        <c:if test="${user.type eq 'mg'}">
							<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#insertAuctionModal">
							  역경매 신청하기
							</button>
                        </c:if>
						
						<!-- Modal -->
						<div class="modal fade insertModal" id="insertAuctionModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						        <h4 class="modal-title" id="myModalLabel">스.드.메 역경매 신청서</h4>
						      </div>
							  <div id="select">
							  	<div class="col-md-6">							  		
								  	<select id="choice" onchange="writeFormShow(this.options[this.selectedIndex].value)" class="form-control">
							            <option value="1">스튜디오</option>
							            <option value="2">드레스</option>
							            <option value="3">메이크업</option>
							        </select>
							  	</div>
							  </div>
							  <div id="studioForm">
						      <form action="writeStudio.do" onsubmit="return sformCheck()" name="sform"  method="post" enctype="multipart/form-data">
							      <div class="modal-body">
								        
								        <input type="hidden" name="memNo" value="${user.no}" />
								        <input type="hidden" id="aucTypeCheck" name="auctionType" value="s" />
							        	<h2 class="hopePlace">희망 위치</h2>	
								        <div class="form-group">
								        	<div class="col-md-6 place" >
								        		<select name="studioPlace" id="sido1" class="form-control"></select>
								        	</div>							        
								        	<div class="col-md-6 place">
								        		<select name="studioPlace" id="gugun1" class="form-control"></select>
								        	</div>							        
								        </div>
							        	<h2 class="studioOutdoor">야외촬영여부</h2>
								        <div class="form-group">
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioOutdoor" class="form-control" value="Y" id="studioOutdoorY"/>
								        			<label for="studioOutdoorY">예</label>
								        		</div>
								        	</div>
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioOutdoor" class="form-control" value="N" id="studioOutdoorN"/>
								        			<label for="studioOutdoorN">아니오</label>
								        		</div>
								        	</div>
							            </div>
							        	<h2 class="studioSnapshot">스냅샷촬영여부</h2>
								        <div class="form-group">
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioSnapshot" class="form-control" value="Y" id="studioSnapshotY"/>
								        			<label for="studioSnapshotY">예</label>
								        		</div>
								        	</div>
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioSnapshot" class="form-control" value="N" id="studioSnapshotN"/>
								        			<label for="studioSnapshotN">아니오</label>
								        		</div>
								        	</div>
								        </div>
							        	<h2 class="studioVideo">비디오촬영여부</h2>
								        <div class="form-group">
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioVideo" class="form-control" value="Y" id="studioVideoY"/>
								        			<label for="studioVideoY">예</label>
								        		</div>
								        	</div>
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioVideo" class="form-control" value="N" id="studioVideoN"/>
								        			<label for="studioVideoN">아니오</label>
								        		</div>
								        	</div>
								        </div>
							        	<h2 class="studioPickup">픽업여부</h2>
								        <div class="form-group">
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioPickup" class="form-control" value="Y" id="studioPickupY"/>
								        			<label for="studioPickupY">예</label>
								        		</div>
								        	</div>
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="studioPickup" class="form-control" value="N" id="studioPickupN"/>
								        			<label for="studioPickupN">아니오</label>
								        		</div>
								        	</div>
								        </div>
									  	<h2 class="studioBudget">희망 예산</h2>
									  	<div class="form-group">
									  		<div class="col-md-4">
									  			<input type="text" name="studioBudget" class="form-control"/>
									  		</div>
									  		<div class="col-md-8">
									  			<p style="padding-top: 7px;">
									  				만원
									  			</p>
									  		</div>
									  	</div>
									  	<h2 class="studioMore">희망 사항</h2>
									  	<div class="form-group">
									  		<div class="col-md-4">
									  			<input type="text" name="studioMore" class="form-control"/>
									  		</div>
									  	</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">신청</button>
							      </div>
	                         </form>
	                         </div>
							  <div id="dressForm">
						      <form action="writeDress.do" onsubmit="return dformCheck()" name="dform" method="post" enctype="multipart/form-data">
							      <div class="modal-body">
								        
								        <input type="hidden" name="memNo" value="${user.no}" />
								        <input type="hidden" name="auctionType" value="d" />
							        	<h2 class="hopePlace">희망 위치</h2>	
								        <div class="form-group">
								        	<div class="col-md-6 place">
								        		<select name="dressPlace" id="sido1" class="form-control"></select>
								        	</div>							        
								        	<div class="col-md-6 place">
								        		<select name="dressPlace" id="gugun1" class="form-control"></select>
								        	</div>							        
								        </div>
							        	<h2 class="dressNeckline">넥라인</h2>
								        <div class="form-group">
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="All" id="dressNecklineAll"/>
								        			<label for="dressNecklineAll">상관없음</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="Sweetheart"  id="dressNecklineSweetheart"/>
								        			<label for="dressNecklineSweetheart">스윗하트 넥</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="Scoop"  id="dressNecklineScoop"/>
								        			<label for="dressNecklineScoop">스쿱 넥</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="StraightAcross" id="dressNecklineStraightAcross"/>
								        			<label for="dressNecklineStraightAcross">일자 넥</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="V" id="dressNecklineV"/>
								        			<label for="dressNecklineV">브이 넥</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="Illusion" id="dressNecklineIllusion"/>
								        			<label for="dressNecklineIllusion">일루전 넥</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="Boat" id="dressNecklineBoat"/>
								        			<label for="dressNecklineBoat">보트 넥</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressNeckline" class="form-control" value="Halter" id="dressNecklineHalter"/>
								        			<label for="dressNecklineHalter">홀터 넥</label>
								        		</div>
								        	</div>
								        	
								        </div>
							        	<h2 class="dressType">드레스타입</h2>
								        <div class="form-group">
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressType" class="form-control" value="All" id="dressTypeAll"/>
								        			<label for="dressTypeAll">상관없음</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressType" class="form-control" value="Mermaid" id="dressTypeMermaid"/>
								        			<label for="dressTypeMermaid">머메이드 라인</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressType" class="form-control" value="ALine" id="dressTypeALine"/>
								        			<label for="dressTypeALine">A 라인</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressType" class="form-control" value="Empire" id="dressTypeEmpire"/>
								        			<label for="dressTypeEmpire">엠파이어 라인</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressType" class="form-control" value="Princess" id="dressTypePrincess"/>
								        			<label for="dressTypePrincess">프린세스 라인</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressType" class="form-control" value="Sheath" id="dressTypeSheath"/>
								        			<label for="dressTypeSheath">시스 라인</label>
								        		</div>
								        	</div>
								        	<div class="col-md-4">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="dressType" class="form-control" value="Bell" id="dressTypeBell"/>
								        			<label for="dressTypeBell">벨 라인</label>
								        		</div>
								        	</div>
								        </div>
							        	<h2 class="dressPrice">희망예산</h2>
								        <div class="form-group">
								        	<div class="col-md-4">
									  			<input type="text" name="dressPrice" class="form-control"/>
								        	</div>
									  		<div class="col-md-8">
									  			<p style="padding-top: 7px;">
									  				만원
									  			</p>
									  		</div>
								        </div>
									  	<h2 class="dressMore">희망 사항</h2>
									  	<div class="form-group">
									  		<div class="col-md-12">
									  			<input type="text" name="dressMore" class="form-control"/>
									  		</div>
									  	</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">신청</button>
							      </div>
	                         </form>
	                         </div>
	                         <div id="makeupForm">
						      <form action="writeMakeup.do" onsubmit="return mformCheck()" name="mform"  method="post" enctype="multipart/form-data">
							      <div class="modal-body">
								        <input type="hidden" name="memNo" value="${user.no}" />
								        <input type="hidden" name="auctionType" value="m" />
							        	<h2 class="mkuPlace">희망 위치</h2>	
								        <div class="form-group">
								        	<div class="col-md-6 place">
								        		<select name="mkuPlace" id="sido1" class="form-control"></select>
								        	</div>							        
								        	<div class="col-md-6 place">
								        		<select name="mkuPlace" id="gugun1" class="form-control"></select>
								        	</div>							        
								        </div>
							        	<h2 class=mkuMakeup>신부화장</h2>
								        <div class="form-group">
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="mkuMakeup" class="form-control" value="Y" id="mkuMakeupY"/>
								        			<label for="mkuMakeupY">예</label>
								        		</div>
								        	</div>
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="mkuMakeup" class="form-control" value="N" id="mkuMakeupN"/>
								        			<label for="mkuMakeupN">아니오</label>
								        		</div>
								        	</div>
								        </div>
							        	<h2 class="mkuMom">혼주화장</h2>
								        <div class="form-group">
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="mkuMom" class="form-control" value="Y" id="mkuMomY"/>
								        			<label for="mkuMomY">예</label>
								        		</div>
								        	</div>
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="mkuMom" class="form-control" value="N" id="mkuMomN"/>
								        			<label for="mkuMomN">아니오</label>
								        		</div>
								        	</div>
								        </div>
							        	<h2 class="mkuWorkout">출장희망</h2>
								        <div class="form-group">
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="mkuWorkout" class="form-control" value="Y" id="mkuWorkoutY"/>
								        			<label for="mkuWorkoutY">예</label>
								        		</div>
								        	</div>
								        	<div class="col-md-3">
								        		<div class="radio radio-custom radio-inline">
									        		<input type="radio" name="mkuWorkout" class="form-control" value="N" id="mkuWorkoutN"/>
								        			<label for="mkuWorkoutN">아니오</label>
								        		</div>
								        	</div>
								        </div>
									  	<h2 class="mkuBudget">희망 예산</h2>
									  	<div class="form-group">
									  		<div class="col-md-4">
									  			<input type="text" name="mkuBudget" class="form-control"/>
									  		</div>
									  		<div class="col-md-8">
									  			<p style="padding-top: 7px;">
									  				만원
									  			</p>
									  		</div>
									  	</div>
									  	<h2 class="mkuMore">희망 사항</h2>
									  	<div class="form-group">
									  		<div class="col-md-4">
									  			<input type="text" name="mkuMore" class="form-control"/>
									  		</div>
									  	</div>
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							        <button type="submit" class="btn btn-primary">신청</button>
							      </div>
	                         </form>
	                         </div>
						    </div>
						  </div>
						</div>
                        
                   <table class="table table-hover serviceTable">
                   		<colgroup>
                   			<col width="10%"/>
                   			<col width="*"/>
                   			<col width="10%"/>
                   			<col width="10%"/>
                   			<col width="10%"/>
                   			<col width="10%"/>
                   		</colgroup>
                   		<thead>
                            <tr>
                                <th>경매번호</th>
                                <th>경매신청인</th>
                                <th>경매타입</th>
                                <th>경매상태</th>
                                <th>역경매 시작일</th>
                                <th>역경매 종료일</th>
                            </tr>                   			
                   		</thead>
                   		<tbody>                   			
                         <c:forEach var="s" items="${sdmeAuctionList}">
                            <tr class="itemBox" data-href="${s.auctionNo}" data-type="${s.auctionType}", data-no="${s.member.no}">
                                <td>${s.auctionNo}</td>
                                <td>${s.member.name}</td>
                                <c:if test="${s.auctionType eq 's'}">
                                <td>스튜디오</td>
                                </c:if>
                                <c:if test="${s.auctionType eq 'd'}">
                                <td>드레스</td>
                                </c:if>
                                <c:if test="${s.auctionType eq 'm'}">
                                <td>메이크업</td>
                                </c:if>
<%--                                 <td>${s.auctionType}</td> --%>
                                <c:if test="${s.auctionStatus eq 'ing'}">
                                <td>진행중</td>
                                </c:if>
                                <c:if test="${s.auctionStatus eq 'done'}">
                                <td>마감</td>
                                </c:if>
<%--                                 <td>${s.auctionStatus}</td> --%>
                                <td><fmt:formatDate value="${s.auctionSdate}" pattern="yyyy-MM-dd" /></td>
                                <td><fmt:formatDate value="${s.auctionEdate}" pattern="yyyy-MM-dd" /></td>
                            </tr>
						</c:forEach>
                   		</tbody>
                    </table>
                      <nav>
		                    	<div class="text-center">
		                    	<ul class="pagination">
								<li><a
								<c:choose>
							      <c:when test="${beginPage!=1}">href="auctionList.do?pageNo=${beginPage-1}"</c:when>
							      <c:otherwise>href="#"</c:otherwise>
							    </c:choose>
								aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
								<c:forEach var="i" begin="${beginPage}" end="${endPage}">
									<li><a
									<c:choose>
							   		<c:when test='${requestScope["javax.servlet.forward.request_uri"].substring(20) eq "/search.json"}'>
							    	href="<c:url value='search.json?pageNo=${i-1}&type=${result.type}&content=${result.content}' />"
							    </c:when>
								
							    <c:otherwise>
							     href="auctionList.do?pageNo=${i}"
							     </c:otherwise>
							      </c:choose>>
		
										${i}</a></li>
							</c:forEach>
		
							<li><a
								<c:choose>
							      	<c:when test="${endPage != lastPage}"> href="weddingHall.do?pageNo=${endPage+1}" </c:when>
							    	<c:otherwise>href="#"</c:otherwise>
						    	</c:choose>
								aria-label="Next"> <span aria-hidden="true">&raquo;</span>
							</a></li>
							</ul>
						 </nav>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <c:import url="/common/importSideBar.jsp" />
    <c:import url="/common/importFooter.jsp" />


<script>
var options = {
        'speed' : 500,				 		//스피드
        'initTop' : 300, 					//기본top위치
        'alwaysTop' : false,				// true
        'default_x' : false 				//레이어가 붙는 아이디 
    }
    $('#sideBar').Floater(options);
    
$('document').ready(function() {
	 var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	  var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	   var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	   var area3 = ["대덕구","동구","서구","유성구","중구"];
	   var area4 = ["광산구","남구","동구",     "북구","서구"];
	   var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	   var area6 = ["남구","동구","북구","중구","울주군"];
	   var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	   var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	   var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	   var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	   var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	   var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	   var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	   var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	   var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	   var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	 

	 // 시/도 선택 박스 초기화

	 $(".place > select").each(function() {
	  $selsido = $(this);
	  $.each(eval(area0), function() {
	   $selsido.append("<option value='"+this+"'>"+this+"</option>");
	  });
	  $selsido.parent().next().children().append("<option value=''>구/군 선택</option>");
	 });

	 

	 // 시/도 선택시 구/군 설정

	 $(".place > select").change(function() {
	  var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
	  var $gugun = $(this).parent().next().children(); // 선택영역 군구 객체
	  $("option",$gugun).remove(); // 구군 초기화

	  if(area == "area0")
	   $gugun.append("<option value=''>구/군 선택</option>");
	  else {
	   $.each(eval(area), function() {
	    $gugun.append("<option value='"+this+"'>"+this+"</option>");
	   });
	  }
	 });


	});

//디테일 모달
function detail(auctionNo, auctionType, no){
	var modal = $("#detailModal")
	var slideBox = $(".slideBox")
	console.log("auctionNo === "+ auctionNo);
	console.log("auctionType === "+ auctionType);
	console.log("memNo === "+ no);
	slideBox.find("ul").html("")
	$.ajax({
		url : "<c:url value='/service/sdme/auctionDetail.json' />",
		method : "POST",
		data : {
			"auctionNo" : auctionNo,
			"auctionType" : auctionType,
			"memNo" : no
			},
		cache : false
	}).done(function(data){
		console.log(data);
		$(".modal-title").html(data.memName + "님의 역경매 신청내역입니다.");
		var html = "";
		if( auctionType == "s") {
			console.log("auctionType s ======" + auctionType);
			console.log("auctionNo s ======" + auctionNo);
			html += '<dl class="memName">';
			html += '<dt>이름 : </dt>';
			html += '<dd>'+data.memName+'</dd>';
			html += '</dl>';
			html += '<dl class="studioPlace">';
			html += '<dt>희망장소 : </dt>';
			html += '<dd>'+data.studio.studioPlace+'</dd>';
			html += '</dl>';
			html += '<dl class="studioOutdoor">';
			html += '<dt>야외촬영여부 : </dt>';
			if (data.studio.studioOutdoor == "Y") {
				html += '<dd>가능</dd>';
			} else {
				html += '<dd>불가능</dd>';
			}
			html += '</dl>';
			html += '<dl class="studioSnapshot">';
			html += '<dt>스냅샷촬영여부 : </dt>';
			if (data.studio.studioSnapshot == "Y") {
				html += '<dd>가능</dd>';
			} else {
				html += '<dd>불가능</dd>';
			}
			html += '</dl>';
			html += '<dl class="studioVideo">';
			html += '<dt>비디오촬영여부 : </dt>';
			if (data.studio.studioVideo == "Y") {
				html += '<dd>가능</dd>';
			} else {
				html += '<dd>불가능</dd>';
			}
			html += '</dl>';
			html += '<dl class="studioPickup">';
			html += '<dt>픽업여부 : </dt>';
			if (data.studio.studioPickup == "Y") {
				html += '<dd>가능</dd>';
			} else {
				html += '<dd>불가능</dd>';
			}
			html += '</dl>';
			html += '<dl class="studioBudget">';
			html += '<dt>예상견적 : </dt>';
			console.log("studioBudget!!! ======== " + data.studio.studioBudget);
			html += '<dd>'+data.studio.studioBudget+'만원</dd>';
			html += '</dl>';
			html += '<dl class="studioMore">';
			html += '<dt>희망사항 : </dt>';
			html += '<dd>'+data.studio.studioMore+'</dd>';
			html += '</dl>';
		} else if ( auctionType == "d") {
			console.log("auctionType d ======" + auctionType);
			console.log("auctionNo  d======" + auctionNo);
			html += '<h4 style="color:blue">';
			html += '넥라인과 드레스 타입은 선호하는 스타일을 보고자 하는 것입니다.<br>';
			html += '심각하게 고민하지 않으셔도 신부님과 어울리는 여러 아름다운 드레스를 만나보실 수 있습니다.';
			html += '</h4>';
			html += '<dl class="memName">';
			html += '<dt>이름 : </dt>';
			html += '<dd>'+data.memName+'</dd>';
			html += '</dl>';
			html += '<dl class="dressPlace">';
			html += '<dt>희망장소 : </dt>';
			html += '<dd>'+data.dress.dressPlace+'</dd>';
			html += '</dl>';
			html += '<dl class="neckline">';
			html += '<dt>넥라인 : </dt>';
			if (data.dress.dressNeckline == "All") {
				html += '<dd>상관없음</dd>';
			} else if (data.dress.dressNeckline == "Sweetheart") {
				html += '<dd>스윗하트 넥</dd>';
			} else if (data.dress.dressNeckline == "Scoop") {
				html += '<dd>스쿱 넥</dd>';
			} else if (data.dress.dressNeckline == "StraightAcross") {
				html += '<dd>일자 넥</dd>';
			} else if (data.dress.dressNeckline == "V") {
				html += '<dd>브이 넥</dd>';
			} else if (data.dress.dressNeckline == "Illusion") {
				html += '<dd>일루젼 넥</dd>';
			} else if (data.dress.dressNeckline == "Boat") {
				html += '<dd>보트 넥</dd>';
			} else {
				html += '<dd>홀터 넥</dd>';
			}
			html += '</dl>';
			html += '<dl class="dressType">';
			html += '<dt>드레스타입 : </dt>';
			if (data.dress.dressType == "All") {
				html += '<dd>상관없음</dd>';
			} else if (data.dress.dressType == "Mermaid") {
				html += '<dd>머메이드 라인</dd>';
			} else if (data.dress.dressType == "ALine") {
				html += '<dd>A 라인</dd>';
			} else if (data.dress.dressType == "Empire") {
				html += '<dd>엠파이어 라인</dd>';
			} else if (data.dress.dressType == "Princess") {
				html += '<dd>프린세스 라인</dd>';
			} else if (data.dress.dressType == "Sheath") {
				html += '<dd>시스 라인</dd>';
			} else {
				html += '<dd>벨 라인</dd>';
			}
			html += '</dl>';
			html += '<dl class="budget">';
			html += '<dt>예상견적 : </dt>';
			html += '<dd>'+data.dress.dressPrice+'만원</dd>';
			html += '</dl>';
			html += '<dl class="dressMore">';
			html += '<dt>희망사항 : </dt>';
			html += '<dd>'+data.dress.dressMore+'</dd>';
			html += '</dl>';
		} else if ( auctionType == "m" ) {
			console.log("auctionType m ======" + auctionType);
			console.log("auctionNo m ======" + auctionNo);
			html += '<dl class="memName">';
			html += '<dt>이름 : </dt>';
			html += '<dd>'+data.memName+'</dd>';
			html += '</dl>';
			html += '<input type="hidden" name="auctionNo" value="'+data.auctionNo+'"/>';
			html += '<dl class="makeup">';
			html += '<dt>신부화장여부 : </dt>';
			if (data.makeup.mkuMakeup == "Y") {
				html += '<dd>가능</dd>';
			} else {
				html += '<dd>불가능</dd>';
			}
			html += '</dl>';	
			html += '<dl class="mom">';
			html += '<dt>혼주화장여부 : </dt>';
			if (data.makeup.mkuMom == "Y") {
				html += '<dd>가능</dd>';
			} else {
				html += '<dd>불가능</dd>';
			}
			html += '</dl>';	
			html += '<dl class="workout">';
			html += '<dt>출장여부 : </dt>';
			if (data.makeup.mkuWorkout == "Y") {
				html += '<dd>가능</dd>';
			} else {
				html += '<dd>불가능</dd>';
			}
			html += '</dl>';	
			html += '<dl class="budget">';
			html += '<dt>예상견적 : </dt>';
			html += '<dd>'+data.makeup.mkuBudget+'만원</dd>';
			html += '</dl>';	
			html += '<dl class="more">';
			html += '<dt>희망사항 : </dt>';
			html += '<dd>'+data.makeup.mkuMore+'</dd>';
			html += '</dl>';
		}
		$(".infoBox").html(html);
		$(".selectTenderModal").attr("data-href", auctionNo);
		$(".selectTenderModal").attr("data-auctype", auctionType);
		$(".selectTenderModal").attr("disabled", true);

		loginCheck(auctionType);
		
	}).fail(function (){
		console.log("요청에 실패했으니까 열심히 좀 해봐라^^");
	});
};

function loginCheck(type) {
	
	$.ajax({
		url : '<c:url value="/service/sdme/loginCheck.json" />',
		method : 'POST',
		data : {
			"memNo" : $("#memCheckNo").val(),
			"comInfoType" : type
		},
		cache : false
	}).done(function (data) {
		if ( data.type == "mc" && data.comInfo.comInfoType == type ) {
			$(".selectTenderModal").attr("disabled", false);
		}
		console.log("왔다링~~");
	});
};


function selectAuction(auctionNo) {
	$.ajax({
		url : '<c:url value="/service/sdme/auctionCheck.json" />',
		method : "POST",
		data : "auctionNo=" + auctionNo,
		cache : false
	}).done(function (data) {
		var html = "";
		console.log("data.auctionNo" + data.auctionNo);
		html += '<input type="hidden" name="auctionNo" value="'+data.auctionNo+'" />'
		
		$(".auction-no").html(html);
	});
};

function selectComInfo(memNo, comInfoType) {
	console.log("selectComInfo로 왔다.");
	$.ajax({
		url : '<c:url value="/service/sdme/comInfoCheck.json" />',
		method : "POST",
		data : {
			"memNo" : memNo,
			"comInfoType" : comInfoType
		},
		cache : false
	}).done(function (data) {
		var html = "";
		console.log("제발 왔다고 해줘....");
		console.log(data);
		console.log("data.comInfoNo"+data.comInfoNo);
		html += '<input type="hidden" id="tenderComInfoNo" name="comInfoNo" value="'+data.comInfoNo+'" />'
		
		$(".comInfo-no").html(html);
	});
};

$(function(){
	$(".itemBox").click(function(e){
		  e.preventDefault();
		  detail($(this).data("href"), $(this).data("type"), $(this).data("no"));
	      $('#detailModal').modal('show');
	  });

});

$(function(){
	$(".selectTenderModal").click(function(e){
		  e.preventDefault();
		  selectAuction($(this).data("href"));
		  selectComInfo($("#memCheckNo").val(), $(this).data("auctype"));
	      $('#detailModal').modal('hide');
	      $('#insertTenderModal').modal('show');
	    
	  });

});

 $("#dressForm").hide();
 $("#makeupForm").hide();

function writeFormShow(index) {
            if (index == 1) {
                $("#studioForm").show();
                $("#dressForm").hide();
                $("#makeupForm").hide();
            } else if (index == 2) {
                $("#studioForm").hide();
                $("#dressForm").show();
                $("#makeupForm").hide();
            } else {
                $("#studioForm").hide();
                $("#dressForm").hide();
                $("#makeupForm").show();
            }
			index = 1;
        };
        
        
        
        
        
        
        
        
        
        function doAction(){   
    	    var f = document.auctionForm
    	    
    	    if(f.tenderTitle.value == "" ){
    	        alert("제목을 입력해주세요")
    	        f.tenderTitle.focus()
    	        return false
    	    }
    	    
    	    if(f.tenderInfo.value == ""){
    	        alert("소개를 입력해주세요")
    	        f.tenderInfo.focus()
    	        return false
    	    }
    	    if(f.tenderBudget.value == ""){
    	        alert("희마예산을 입력하세요")
    	        f.tenderBudget.focus()    
    	        return false
    	    }
    	    
    	    Swal({
    	    	  position: 'center',
    	    	  type: 'success',
    	    	  title: '입찰이 완료되었습니다. 감사합니다.',
    	    	  showConfirmButton: false,
    	    	  timer: 11000
    	    	})
    	}
    	
    	
    	function sformCheck(){   
    		
    	    var d = document.sform
    	    
    	    if(d.studioBudget.value == "" ){
    	        alert("의견사항을 적어주세요")
    	        d.studioBudget.focus()
    	        return false
    	    }
    	    if(d.studioMore.value == "" ){
    	        alert("희망 예산을 적어주세요")
    	        d.studioMore.focus()
    	        return false
    	    }
    	    Swal({
    	    	  position: 'center',
    	    	  type: 'success',
    	    	  title: '역경매 신청이 완료되었습니다. 감사합니다.',
    	    	  showConfirmButton: false,
    	    	  timer: 11000
    	    	})
    	}
    	function dformCheck(){   
    		
    	    var d = document.dform
    	    
    	    if(d.dressPrice.value == "" ){
    	        alert("의견사항을 적어주세요")
    	        d.dressPrice.focus()
    	        return false
    	    }
    	    if(d.dressMore.value == "" ){
    	        alert("희망 예산을 적어주세요")
    	        d.dressMore.focus()
    	        return false
    	    }
    	    Swal({
    	    	  position: 'center',
    	    	  type: 'success',
    	    	  title: '역경매 신청이 완료되었습니다. 감사합니다.',
    	    	  showConfirmButton: false,
    	    	  timer: 11000
    	    	})
    	}
    	function mformCheck(){   
    		
    	    var d = document.mform
    	    
    	    if(d.mkuBudget.value == "" ){
    	        alert("의견사항을 적어주세요")
    	        d.mkuBudget.focus()
    	        return false
    	    }
    	    if(d.mkuMore.value == "" ){
    	        alert("희망 예산을 적어주세요")
    	        d.mkuMore.focus()
    	        return false
    	    }
    	    Swal({
    	    	  position: 'center',
    	    	  type: 'success',
    	    	  title: '역경매 신청이 완료되었습니다. 감사합니다.',
    	    	  showConfirmButton: false,
    	    	  timer: 11000
    	    	})
    	}


  
  
  </script>
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog  modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"></h4>
      </div>
      <div class="modal-body">
		      <input type="hidden" id="memCheckNo" name="memNo" value="${user.no}" />
        <div class="infoBox">
            <dl class="memName">
                <dt>이름 : </dt>
                <dd></dd>
            </dl>
        </div>
        <div class="contentsBox">

        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary selectTenderModal">입찰하기</button>
      </div>
    </div>
  </div>
</div>

	<div class="modal fade insertModal" id="insertTenderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog  modal-lg">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel"></h4>
	      	</div>
				<form action="writeTender.do"  method="post" name="auctionForm" onsubmit="return doAction()" enctype="multipart/form-data">
				      <div class="modal-body" id="sdmAu">
				      <div class="form-group">
				      <input type="hidden" name="memNo" value="${user.no}" />
					  	</div>
					  	<div class="auction-no">
					  	</div>
					  	<div class="comInfo-no">
					  	</div>
					  	<h2>서비스 제목</h2>
					  	<div class="form-group">
					  		<div class="col-md-12">
					  			<input class="form-control" type="text" id="tenderTitle" name="tenderTitle" class="form-control" placeholder="제목을 입력해 주세요" />
					  		</div>
					  	</div><br>
					  	<h2>서비스 소개</h2>
					  	<div class="form-group">
					  		<div class="col-md-12">	
					  			<textarea  name="tenderInfo" id="tenderInfo" class="wish form-control" rows="3" cols="30" placeholder="내용을 입력해 주세요" ></textarea>
					  		</div>
					  	</div><br>
					  	
					  	<h2>입찰 예산(만원)</h2>
					  	<div class="form-group">
					  		<div class="col-md-4">
					  			<input class="form-control" type="text" id="tenderBudget" name="tenderBudget" class="form-control" placeholder="예산을 입력해 주세요" />
					  		</div>
					  	</div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-primary">입찰하기</button>
				      </div>
				</form>
	    </div>
	  </div>
	</div>
</body>
</html>