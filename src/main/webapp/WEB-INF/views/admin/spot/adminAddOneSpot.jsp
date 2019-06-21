<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel Interface</title>
<style>
	.pageingBtn{
		width:30px;
		height:22px;
		background:white;
		color:purple;
		border:1px solid purple;
		border-radius:5px;
	}
	.pageingBtn:hover{
		background:purple;
		color:white;
	}
	#memberListTB *{
		text-align:center;
	}
	.section {
		width:90% !important;
		margin:0 auto;
		min-height:768px;
	}
</style>
</head>
<body>
	<jsp:include page="../../common/adminMainNav.jsp"/>
	<div class="columns">
		<div class="column">
			<section class="section">
				<div class="field">
					<h3 class="subtitle is-3" style="color:#209cee;"> 여행지 등록 </h3>
				</div>
				
				<!-- country and city -->
				<div class="field is-horizontal">
					<div class="field-body">
						<!-- country -->
						<div class="field">
					      <label class="label">* 국가명</label>
					      <p class="control">
					        <span class="select is-fullwidth">
					            <select>
					              <option>국가명</option>
					              <option>With options</option>
					            </select>
					          </span>
					      </p>
					    </div> <!-- end country -->
					    
					    <!-- city -->
					    <div class="field">
					      <label class="label">* 도시명</label>
					      <p class="control">
					        <span class="select is-fullwidth">
					            <select>
					              <option>도시명</option>
					              <option>With options</option>
					            </select>
					          </span>
					      </p>
					    </div> <!-- end city -->
					</div> <!-- end field-body -->
				</div> <!-- end country and ciry -->
				
				<div class="field">
					<label class="label">명소명</label>
				</div>
				
				<!-- spot name -->
				<div class="field is-horizontal">
					<div class="field-body">
						<!-- ko name -->
						<div class="field">
					    	<label class="label">* 한글 명소명</label>
					    	<p class="control">
					          <input class="input" type="text" placeholder="Text input">
					        </p>
					    </div> <!-- end ko name -->
					    
					    <!-- eng name -->
					    <div class="field">
					    	<label class="label">영어 명소명</label>
					    	<p class="control">
					          <input class="input" type="text" placeholder="Text input">
					        </p>
					    </div> <!-- end eng name -->
					</div> <!-- end field-body -->
				</div> <!-- end spot name -->
				
				<!-- detail address -->
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field">
							<label class="label">* 상세 주소</label>
							<p class="control">
					          <input class="input" type="text" placeholder="Text input">
					        </p>
						</div>
					</div> <!-- end field-body -->
				</div> <!-- end detail address -->
				
				<!-- spot content -->
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field">
							<label class="label">여행지 설명</label>
							<p class="control">
					          <textarea class="textarea" placeholder="Textarea"></textarea>
					        </p>
						</div>
					</div> <!-- end field-body -->
				</div> <!-- end spot content -->
				
				<div class="field">
					<label class="label">영업시간</label>
				</div>
				
				<!-- opening hours -->
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field">
							<label class="label">요일</label>
							<p class="control">
					          <input class="input" type="text" placeholder="Text input">
					        </p>
						</div>
						<div class="field">
							<label class="label">시간</label>
							<p class="control">
					          <input class="input" type="text" placeholder="Text input">
					        </p>
						</div>
						<div class="field">
							<label class="label">공휴일</label>
							<p class="control">
					          <input class="input" type="text" placeholder="Text input">
					        </p>
						</div>
					</div> <!-- end field-body -->
				</div> <!-- end opening hours -->
				
				<!-- etc info -->
				<div class="field is-horizontal">
					<div class="field-body">
						<!-- spot type -->
						<div class="field" style="flex-grow: 0;">
							<label class="label">* 명소유형</label>
							<p class="control">
					        <span class="select">
					            <select style="width:300px;">
					              <option>명소유형</option>
					              <option>With options</option>
					            </select>
					          </span>
					      </p>
						</div> <!-- end spot type -->
						
						<!-- web address -->
						<div class="field">
							<label class="label">웹사이트</label>
							<p class="control is-expanded">
					          <input class="input" type="text" placeholder="Text input">
					        </p>
						</div> <!-- end web address -->
					</div> <!-- end field-body -->
				</div> <!-- end etc info -->
				
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field">
							<label class="label">사진</label>
						</div>
						<div class="buttons"  style="justify-content:flex-end;">
							<a class="button is-danger is-rounded is-small">삭제</a>
						</div>
					</div>
				</div>
				
				<!-- picture area -->
				<div class="field is-horizontal">
					<div class="field-body">
						<div class="field is-grouped">
							<p class="control is-left">
								<input type="checkbox">
							</p>
							<div class="pic_area" style="width:100%; height:180px;; border:1px solid gray;"></div>
						</div>
						<div class="field is-grouped">
							<p class="control is-left">
								<input type="checkbox">
							</p>
							<div class="pic_area" style="width:100%; height:180px; border:1px solid gray;"></div>
						</div>
						<div class="field is-grouped">
							<p class="control is-left">
								<input type="checkbox">
							</p>
							<div class="pic_area" style="width:100%; height:180px; border:1px solid gray;"></div>
						</div>
						<div class="field is-grouped">
							<p class="control is-left">
								<input type="checkbox">
							</p>
							<div class="pic_area" style="width:100%; height:180px; border:1px solid gray;"></div>
						</div>
					</div> <!-- end field-body -->
				</div> <!-- end picture area -->
				
				<!-- btn area -->
				<div class="field is-horizontal">
					<div class="field-body"  style="justify-content:flex-end;">
						<div class="buttons">
							<a class="button is-danger is-outlined" style="width:200px;" href="selectAllSpotAdmin.sp"> 취소 </a>
							<a class="button is-info is-outlined" style="width:200px;" href="#"> 등록 </a>
						</div>
					</div> <!-- end field-body -->
				</div> <!-- end btn area -->
				
			</section> <!-- end session -->
		</div> <!-- end column -->
	</div> <!-- end columns -->
</body>
</html>