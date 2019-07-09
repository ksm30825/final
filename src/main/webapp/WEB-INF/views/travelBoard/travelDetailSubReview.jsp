<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	
	#reviewBtnArea {
		text-align: right;
		margin-bottom: 1em;
	}
	.button.is-info, .tag.is-danger {
		border-radius: 10px;
	}
	
	.reviewTableArea {
		width: 100%;
	}
	#reviewTableArea {
		width: 100%;
	}
	#reviewTable {
		width: 100%;
	}
	#reviewTable th {
		background: rgb(198, 151, 217);
		color: white;
		padding: 0.5em;
		text-align: center !important;
		border: 1px solid rgb(198, 151, 217);
	}
	#reviewTable td {
		padding: 0.5em;
		text-align: center !important;
		border: 1px solid lightgray;
	}
	
	.paging {
		width: 70%;
		margin: 1.5em;
	}
	.pagination-list {
		justify-content: center !important;
	}
	.button {
		border-radius: 10px; 
	}
	
	.reviewContentArea{
		padding: 1em;
	}
	
</style>
<body>
	<!-- 서브메뉴 본문(구매리뷰) -->
	<section class="section" id="detailSub" style="padding-top: 0;">
		<div id="detailSubContent" align="center">
			<div id="reviewBtnArea">
				<c:choose>
					<c:when test="${ !empty loginUser && detailTb.buyStatus eq 'Y' && detailTb.writeStatus eq 'N' }">
						<a class="button is-info" data-target="#myModal" onclick="reviewForm()">리뷰작성</a>
					</c:when>
					<c:when test="${ !empty loginUser && detailTb.buyStatus eq 'Y' && detailTb.writeStatus eq 'Y' }">
						<a class="button is-info" data-target="#myModal" onclick="reviewModify()">리뷰수정</a>
					</c:when>
				</c:choose>
			</div>
			
			<div id="reviewTableArea">
				
				<table id="reviewTable">
					<thead>
						<tr>
							<th width="10%">No</th>
							<th width="20%">평점</th>
							<th width="50%">리뷰</th>
							<th width="20%">작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${ fn:length(trList) > 0 }">
								<c:forEach var="review" items="${ trList }" varStatus="st">
									<tr>
										<td>${ st.count }</td>
										<td>
										<c:forEach var="i" begin="1" end="5" step="1">
											<c:choose>
												<c:when test="${ i <= review.grade }">
													<a class="starImg" style="cursor: default;"><i class="fas fa-star"></i></a>
												</c:when>
												<c:otherwise>
													<a class="starImg" style="cursor: default;"><i class="far fa-star"></i></a>
												</c:otherwise>
											</c:choose>
										</c:forEach>
										</td>
										<!--  -->
										<td>
											${ review.reviewContent }
											<c:if test="${ review.memberId eq loginUser.memberId }">
												&nbsp;<a class="tag is-danger" onclick="deleteReview(${ review.reviewId })">리뷰삭제</a>
											</c:if>
										</td>
										<td>${ review.userName }</td>
									</tr>
								</c:forEach>
								
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="4">구매 리뷰가 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
				
				<!-- 페이징 -->
				<div class="paging" align="center">
					<nav class="pagination is-rounded" role="navigation" aria-label="pagination">
					<ul class="pagination-list">
						<!-- 이전버튼 -->
						<c:if test="${ pi.currentPage <= 1 }">
							<li><a class="pagination-previous">이전</a></li>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="previous" value="selectTourReview.tb">
							<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<li><a class="pagination-previous" onclick="reviewSelect(currentPage)">이전</a></li>
						</c:if>
						<!--  -->
						
						<!-- 숫자버튼 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<li><a class="pagination-link" aria-label="Goto page 1" onclick="reviewSelect(${ p })">${ p }</a></li>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="number" value="">
								<c:param name="currentPage" value="${ p }"/>
								</c:url>
								<li><a class="pagination-link" aria-label="Goto page 1" onclick="reviewSelect(${ p })">${ p }</a></li>
							</c:if>
						</c:forEach>
						<!--  -->
						
						<!-- 다음 버튼 -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<li><a class="pagination-next">다음</a></li>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="next" value="reviewSelect()">
							<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
							</c:url>
							<li><a class="pagination-next" onclick="reviewSelect(currentPage)">다음</a></li>
						</c:if>
					</ul>
				</nav>
				</div>
				
			</div>
		</div>
		
		
	</section>
	
	<!-- 리뷰용 모달 -->
	<div class="modal" id="myModal">
	    <div class="modal-background"></div>
	    <div class="modal-card">
	    
			<header class="modal-card-head">
				<p class="modal-card-title"><i class="fas fa-sticky-note"></i>&nbsp;<a id="modalTitle">구매리뷰 작성하기</a></p>
				<button class="cancel delete"></button>
			</header>
			<input type="number" id="reviewId" value="" hidden="hidden">
			<section class="modal-card-body">
				<div class="starArea" align="center">
					<span class="title is-5">별점 : </span>
					<a class="starImg" score="1"><i class="far fa-star"></i></a>
					<a class="starImg" score="2"><i class="far fa-star"></i></a>
					<a class="starImg" score="3"><i class="far fa-star"></i></a>
					<a class="starImg" score="4"><i class="far fa-star"></i></a>
					<a class="starImg" score="5"><i class="far fa-star"></i></a>
				</div>
				
				<div class="reviewContentArea" align="center">
					<textarea rows="10" cols="50" placeholder="리뷰 내용을 작성해주세요." style="resize: none" id="reviewContent"></textarea>
				</div>
			</section>
		
			<footer class="modal-card-foot" style="justify-content: center">
				<a class="button is-primary" id="insertReview">리뷰작성</a>
				<a class="button cancel">취소하기</a>
			</footer>
		
	    </div>
	</div>
<script>

	
	//리뷰작성 모달창 띄우기
	function reviewForm() {
		$('#myModal').toggleClass('is-active').removeAttr('style');
		
		var grade = Number(0);
		
		//리뷰 별점매기기
		$(".starImg").click(function() {
			$(this).parent().children('a').removeClass();
			$(this).parent().children('a').addClass("starImg");
			
			$(this).parent().children().children().attr('data-prefix', 'far');
			
			$(this).prevAll().children().attr('data-prefix', 'fas');
			$(this).children().attr('data-prefix', 'fas');
			
			grade = Number($(this).attr("score"));
		});
		
		$("#insertReview").click(function() {
			var trvId = ${ detailTb.trvId };
			var memberId = $("#loginId").val();
			
			var reviewContent = $("#reviewContent").val();
			
			$.ajax({
				url : "insertReview.tb",
				data : {trvId : trvId, memberId : memberId, grade : grade, reviewContent : reviewContent},
				success : function(data) {
					alert("리뷰작성 처리");
					$('#myModal').removeClass('is-active');
					
					location.href="pointReserve.po?memberId=" + data.memberId +"&code=" + data.reviewId + "&reserveType=20&rPoint=50";
				}
			});
		})
		
		$(".cancel").click(function(){
			$('#myModal').removeClass('is-active');
        });
	}
	
	//리뷰 삭제
	function deleteReview(reviewId) {
		
		var memberId = $("#loginId").val();
		
		$.ajax({
			url : "deliteReview.tb",
			data : {reviewId : reviewId, memberId : memberId},
			success : function(data) {
				alert(data.string);
				
				location.href="travelDetailForm.tb?trvId=" + ${ detailTb.trvId };
			}
		})
	}
	
	
	//리뷰 수정 모달창 띄우기
	function reviewModify() {
		$("#modalTitle").text("구매리뷰 수정하기");
		
		$('#myModal').toggleClass('is-active').removeAttr('style');
		
		var trvId = ${ detailTb.trvId };
		var memberId = $("#loginId").val();
		
		//자신이 작성한 리뷰 내용 검색해오기
		$.ajax({
			url : "myTourReviewSearch.tb",
			data : {trvId : trvId, memberId : memberId},
			success : function(data) {
				$("#reviewId").val(data.reviewId);
				$("#reviewContent").val(data.reviewContent);
				
				$(".starArea > a").remove();
				
				var grade = data.grade;
				
				for(var i = 1; i < 6; i++) {
					
					if(i <= grade) {
						if(i == grade) {
							var star = '<a class="starImg grade" score="'+ i +'"><i class="fas fa-star"></i></a>';
							$(".starArea").append(star);
						}else {
							var star = '<a class="starImg" score="'+ i +'"><i class="fas fa-star"></i></a>';
							$(".starArea").append(star);
						}
					}else {
						var star = '<a class="starImg" score="' + i + '"><i class="far fa-star"></i></a>';
						$(".starArea").append(star);
					}
				}
				
				var num = data.reviewId;
				$(".modal-card-foot").children().remove();
				var button = '<a class="button is-primary" onclick="updateReview(' + num + ')">리뷰수정</a><a class="button cancel">취소하기</a>';
				$(".modal-card-foot").append(button);
				
				//리뷰 별점매기기
				$(".starImg").click(function() {
					$(this).parent().children('a').removeClass();
					$(this).parent().children('a').addClass("starImg");
					
					$(this).parent().children().children().attr('data-prefix', 'far');
					
					$(this).prevAll().children().attr('data-prefix', 'fas');
					$(this).children().attr('data-prefix', 'fas');
					$(this).addClass("grade");
					
					grade = Number($(this).attr("score"));
					
					console.log(grade);
				});
				
			},
			error : function(data) {
				alert("접속에러");
			}
			
		})
	}
	
	//작성한 리뷰 수정하기
	function updateReview(num) {
		var reviewId = num;
		var grade = $(".grade").attr("score");
		var reviewContent = $("#reviewContent").val();
		
		console.log("reviewId : " + reviewId);
		console.log("grade : " + grade);
		console.log("reviewContent : " + reviewContent);
		
		$.ajax({
			url : "myTourReviewUpdate.tb",
			data : {reviewId : reviewId, grade : grade, reviewContent : reviewContent},
			success : function(msg) {
				
				alert(msg.string);
				
				$('#myModyModal').removeClass('is-active');
				
				location.href="travelDetailForm.tb?trvId=" + ${ detailTb.trvId };
			},
			error : function(data) {
				alert("접속실패");
			}
		})
	}
	
	function reviewSelect(currentPage) {
		var currentPage = currentPage;
		var trvId = ${ detailTb.trvId };
		
		$.ajax({
			url : "selectTourReview.tb",
			data : {currentPage : currentPage, trvId : trvId},
			type : "post",
			success : function(trList) {
				
				var table = $("#reviewTable > tbody");
				table.children().remove();
				
				for (var key in trList) {
					
					var star = "";
					//별점을 별로 표기
					for(var i = 1; i < 6; i++) {
						if(i <= trList[key].grade) {
							star += '<a class="starImg" style="cursor: default;"><i class="fas fa-star"></i></a>';
						}else {
							star += '<a class="starImg" style="cursor: default;"><i class="far fa-star"></i></a>';
						}
					}
					
					var memberId = $("#loginId").val();
					
					
					var no = 0;
					if(currentPage > 1) {
						no = Number(currentPage - 1);
					}
					
					var number = Number(no + key) + 1;
					
					var review = "<tr><td>" + number + "</td><td>" + star + "</td><td>" + trList[key].reviewContent;
					if(trList[key].memberId == memberId) {
						review += '<a class="tag is-danger" onclick="deleteReview()">리뷰삭제</a></td><td>' + trList[key].userName + "</td></tr>";
					}else {
						review += "</td><td>" + trList[key].userName + "</td></tr>";
					}
					
					
					table.append(review);
				}
				
			},
			error : function(data) {
				alert("접속실패");
			}
				
		});
	}
</script>

</body>
</html>