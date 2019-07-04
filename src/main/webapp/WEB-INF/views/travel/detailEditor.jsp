<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TI - detailEditor</title>
<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
<style>
	.card-header {
		background:#AFDCF5;
	}
</style>
</head>
<body>
	<div class="columns">
		<div class="column is-3">
			<section class="section">
				<aside class="menu" id="daySideMenu">
					<p class="menu-label">일자별 상세글</p>
					<ul class="menu-list" id="daySideMenu">
						<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
							<c:if test="${ st.index eq 0 }" >
								<li><a class="is-active"><strong>DAY ${ trvDay.dayNumber }</strong></a></li>
							</c:if>
							<c:if test="${ st.index ne 0 }" >
								<li><a><strong>DAY ${ trvDay.dayNumber }</strong></a></li>
							</c:if>
						</c:forEach>
					</ul>
					<p class="menu-label">사진 갤러리</p>
					<ul class="menu-list" id="gallarySideMenu">
						<li><a>전체보기</a></li>
						<li><a>일자별 모아보기</a>
							<ul>
								<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
									<li><a>DAY ${ trvDay.dayNumber }</a></li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</aside>
			</section>
		</div>
		<div class="column is-9">
			<c:forEach var="trvDay" items="${ trvDayList }" varStatus="st">
				<div class="dayHeader" id="day${ trvDay.dayNumber }Header" style="display:none">
					<section class="section" style="padding-bottom:10px">
						<nav class="level">
							<div class="level-left">
								<div class="level-item">
									<p class="subtitle is-3">
										<strong>DAY ${ trvDay.dayNumber }</strong> 
									</p>
									<p class="help">${ trvDay.dayDate }</p>
								</div>
								<div class="level-item">
									<div class="field">
										<p class="control">
											<input type="hidden" value="${ trvDay.dayId }">
											<input class="input dayMemo day${ trvDay.dayId }Memo" type="text" placeholder="MEMO" value="${ trvDay.dayMemo }" 
											style="width:100%">
										</p>
									</div>
								</div>
							</div>
							<div class="level-right" id="weatherArea">
								<p class="level-item" style="margin:0 10px 0 0">
									<a class="button is-danger is-outlined weatherBtn">
										<span class="icon">
											<i class="fas fa-sun"></i>
										</span>
									</a>
								</p>
								<p class="level-item" style="margin:0 10px 0 0">
									<a class="button is-dark is-outlined weatherBtn">
										<span class="icon">
											<i class="fas fa-cloud"></i>
										</span>
									</a>
								</p>
								<p class="level-item" style="margin:0 10px 0 0">
									<a class="button is-info is-outlined weatherBtn">
										<span class="icon">
											<i class="fas fa-umbrella"></i>
										</span>
									</a>
								</p>
								<p class="level-item" style="margin:0 10px 0 0">
									<a class="button is-primary is-outlined weatherBtn">
										<span class="icon">
											<i class="far fa-snowflake"></i>
										</span>
									</a>
								</p>
								<p class="level-item" style="margin:0 10px 0 0">
									<a class="button is-warning is-outlined weatherBtn">
										<span class="icon">
											<i class="fas fa-bolt"></i>
										</span>
									</a>
								</p>
							</div>
						</nav>
						<hr style="border:1px solid lightgray">
					</section>
				</div>
				<div class="dayArea" id="day${ trvDay.dayNumber }Area" style="display:none">
					<c:forEach var="sch" items="${ trvDay.schList }" varStatus="st" >
						<section class="section">
							<div class="card">
								<header class="card-header">
									<p class="icon is-large" style="color:#8e44ad; margin:5px">
										<i class="fas fa-2x fa-bookmark"></i>
									</p>
									<div class="card-header-title" style="display:block">
										<input type="hidden" value="${ sch.schId }" name="schId">
										<p><strong>${ sch.schTitle }</strong></p>
										<p class="help">
											<c:if test="${ !empty sch.trvCost }">
												${ sch.trvCost.costType } :<strong>${ sch.trvCost.costAmount }</strong> 
												(${ sch.trvCost.currency }) / 
											</c:if>&nbsp;&nbsp;&nbsp;
											${ sch.schTransp }
										</p> 
										<small> 
											<a style="color: purple"> 
												<span class="icon is-small" style="color: purple"> 
													<i class="fas fa-map-marker-alt"></i>
												</span> 
												<c:if test="${ sch.plcName ne null }">
													${ sch.plcName }
												</c:if> 
												<c:if test="${ sch.plcName eq null }">
													(장소 정보 없음)
												</c:if>
											</a>
										</small> 
									</div>
									<a class="card-header-icon">
										<!-- <span class="icon detailEditBtn" 
										style="color:#8e44ad; margin-right:10px; width:100px">
											작성하기
											<i class="fas fa-2x fa-pencil-alt"></i>
										</span> -->
										<span class="icon detailShowBtn"><i class="fa fa-angle-down"></i></span>
									</a>
								</header>
								<div class="card-content" style="display:none">
									<div class="content editor"></div>
								</div>
								<footer class="card-footer" style="display:none">
									<a class="card-footer-item saveBtn" style="background:mediumpurple;color:white">Save</a> 
									<a class="card-footer-item editBtn" style="background:skyblue;color:white">Edit</a>
									<a class="card-footer-item removeBtn" style="background:lightgray;color:white">Delete</a>
								</footer>
							</div>
						</section>
					</c:forEach>
				</div>
			
				<div class="gallaryArea" id="gallary${ trvDay.dayNumber }Area" style="display:none">	
					<section class="section">
						<div class="columns">
							<div class="column is-one-third photoCard" style="display:none">
								<div class="card trvCard">
									<div class="card-image">
										<figure class="image" style="margin: 0">
											<img src="">
										</figure>
									</div>
									<div class="card-content">
										<div class="content" align="right">${ trvDay.dayDate }</div>
										<div class="content">
											<p></p>
										</div>
									</div>
								</div>
							</div>
							<c:forEach var="sch" items="${ trvDay.schList }" varStatus="st">
								<c:forEach  var="file" items="${ sch.fileList }" varStatus="st2">
									<div class="column is-one-third photoCard">
										<div class="card trvCard">
											<div class="card-image">
												<figure class="image" style="margin:0">
													<img src="resources/uploadFiles/${ file.changeName }">
												</figure>
											</div>
											<div class="card-content">
												<div class="content" align="right">${ trvDay.dayDate }</div>
												<div class="content"><p>${ file.fileCaption }</p></div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:forEach>
						</div>
					</section>
				</div>		
			</c:forEach>
		</div>
	</div>
	
	<script>
		var quills = [];
		$(function() {
			$("#day1Header").show();
			$("#day1Area").show();
			$("#daySideMenu>li").click(function() {
				var day = $(this).children("a").text();
				
				$(this).children("a").addClass('is-active');
				$(this).siblings().children("a").removeClass('is-active');
				$("#gallarySideMenu li>a").removeClass('is-active');
				$(".dayArea, .gallaryArea, .dayHeader").hide();
				$("#day" + day.charAt(4) + "Header").show();
				$("#day" + day.charAt(4) + "Area").show();
			});
			$("#gallarySideMenu>li:first").click(function() {
				$("#gallarySideMenu>li>ul>li").children("a").removeClass('is-active');
				$(this).children("a").addClass('is-active');
				$("#daySideMenu>li").children("a").removeClass('is-active');
				$(".dayArea").hide();
				$(".dayHeader").show();
				$(".gallaryArea").show();
			});
			$("#gallarySideMenu>li>ul>li").click(function() {
				var day = $(this).children("a").text();
				$("#gallarySideMenu>li:first").children("a").removeClass('is-active');
				$(this).children("a").addClass('is-active');
				$(this).siblings().children("a").removeClass('is-active');
				$("#daySideMenu>li").children("a").removeClass('is-active');
				$("#gallarySideMenu li>a").removeClass('is-active');
				$(".dayArea, .gallaryArea, .dayHeader").hide();
				$("#day" + day.charAt(4) + "Header").show();
				$("#gallary" + day.charAt(4) + "Area").show();
			});
			
			
			var toolbarOptions = [ 
				[ 'bold', 'italic', 'underline', 'strike' ], // toggled buttons
				[ 'blockquote', 'code-block' ],

				[ { 'header' : 1}, {'header' : 2} ], // custom button values
				[ {'list' : 'ordered'}, {'list' : 'bullet'} ], [ {'script' : 'sub'}, {'script' : 'super'} ], // superscript/subscript
				[ {'direction' : 'rtl'} ], // text direction

				[ {'header' : [ 1, 2, 3, 4, 5, 6, false ]} ],

				[ {'color' : []}, {'background' : []} ], // dropdown with defaults from theme
				[ {'font' : []} ], [ {'align' : []} ],

				[ 'link', 'image' ],

				[ 'clean' ] // remove formatting button
			];
			
			var contents;

			$(".editor").each(function() {
				var container = $(this).get(0);
				var schId = $(this).parent().prev().find("input[name=schId]").val();
				var dayNumber = $(this).parent().parent().parent().parent().attr("id").charAt(3);
				var quill = new Quill(container, {
					modules : {
						toolbar : toolbarOptions
					},
					placeholder : '멋진 사진과 함께 여행 후기글을 작성해보세요! ',
					theme : 'snow' // or 'bubble'
				});
				quills.push(quill);
				
				$.ajax({
					url:"selectSchContent.trv",
					type:"POST",
					data:{schId:schId},
					success:function(data) {
						if(data.content) {
							quill.setContents(JSON.parse(data.content));
						}
					},
					error:function(err) {
						alert("err", err);
					}
				});
				
				
				quill.getModule('toolbar').addHandler('image', function() {
					console.log("handler작동");
					var fileInput = document.createElement('input');
					fileInput.setAttribute('type', 'file');
					fileInput.setAttribute('name', 'image');
					fileInput.click();
					var schIdInput = document.createElement('input');
					schIdInput.setAttribute('type', 'text');
					schIdInput.setAttribute('name', 'schId');
					schIdInput.setAttribute('value', schId);
					
					fileInput.onchange = function() {
						var fd = new FormData();
						console.log($(this));
						var file = $(this)[0].files[0];
						console.log(file);
						fd.append('image', file);
						fd.append('schId', schId);
						console.log(fd);
						$.ajax({
							url:"insertSchFile.trv",
							type:"POST",
							data:fd,
							cache:false,
							processData:false,
							contentType:false,
							success:function(data) {
								var range = quill.getSelection();
								quill.insertEmbed(range.index, 'image', 'http://localhost:8001/ti/resources/uploadFiles/' + data.changeName);
								
								var photoCard = $("#gallary" + dayNumber + "Area").find(".photoCard").eq(0).clone();
								photoCard.find("img").attr("src", "resources/uploadFiles/" + data.changeName);
								photoCard.appendTo($("#gallary" + dayNumber + "Area").children().children());
								photoCard.show();
								
							},
							error:function(err) {
								alert("err", err);
							}
						});
					}
					
					
				});
				/* quill.on('text-change', function() {
					
					contents = quill.getContents();
					$.ajax({
						url:"updateSchContent.trv",
						type:"post",
						data:{schId:schId, schContent:JSON.stringify(contents)},
						success:function() {
							alert("success!");
						},
						error:function() {
							alert("updateSchContent 서버전송 실패");
						}
					});
					
					;
				}); */
				
				
				$(this).parent().prev().find(".detailShowBtn").click(function() {
					quill.enable(false);
					//quill.setContents(contents);
					var toolbar = $(this).parent().parent().next().find(".ql-toolbar");
					toolbar.appendTo($(this).parent().parent().next());
					toolbar.hide();
					var content = $(this).parent().parent().next();
					content.toggle();
					var footer = $(this).parent().parent().next().next();
					footer.toggle();
					
					footer.find(".editBtn").click(function() {
						quill.enable(true);
						toolbar.show();
						
						
					});
					
					footer.find(".saveBtn").click(function() {
						var contents = quill.getContents();
						console.log(contents);
						
						var schContent = JSON.stringify(contents);
						console.log(schContent);
						//var text = quill.getText();
						//console.log(text);
						
						$.ajax({
							url:"updateSchContent.trv",
							type:"post",
							data:{schId:schId, schContent:schContent},
							success:function(data) {
								var delta = JSON.parse(data.sch.schContent);
								quill.setContents(delta);
								quill.enable(false);
								toolbar.hide();
							},
							error:function() {
								alert("updateSchContent 서버전송 실패");
							}
						});
						
					});
					
					footer.find(".removeBtn").click(function() {
						
					});
					
				});
				
			});
			
			
			
			
		});

		
		
		
		
		$(".weatherBtn").click(function() {
			$(this).removeClass('is-outlined');
			$(this).parent().siblings().children().addClass('is-outlined')
		});
		
	</script>
</body>
</html>