<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


    <style>
        body{
            background-color: #F9F8EF;
        }
    </style>


    <!-- 네비게이션바 거리유지 -->
    <section class="pad">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    dfadfadf
                </div>
            </div>
        </div>
    </section>
    <!--네비게이션바 거리유지 끝-->

    

    <!--서비스 소개 시작-->
    <section class="introduce">
        <div class="container">
            <div class="sign-title m-bottom-30">
                <h3 ><strong>레시피 작성</strong></h3>
            </div>
        </div>
    </section>
    <!--서비스 소개 끝-->


    <!--레시피 입력 시작-->
    <section class="recipe-form">
        <div class="container">
            <!--레시피 기본 정보-->
            <div class="card">
                <div class="card-body">

                    <form class="form" role="form" autocomplete="off">
                        <div class="row">
                            <div class="col-md-6">
                                <!--레시피 이름-->
                                <div class="row">
                                    <label class="col-md-4" for="uname">레시피 이름</label>
                                    <div class="form-group col-md-8">
                                        <input type="text" class="form-control " id="uname" placeholder="예) 아보카도 요거트 볼" name="uname" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!--레시피 소개-->
                                <div class="row">
                                    <label class="col-md-4" for="uname">레시피 소개</label>
                                    <div class="form-group col-md-8">
                                        <textarea class="form-control" rows="5" id="rcomment" name="recipecomment" placeholder="이 레시피에 대한 간단한 설명을 적어주세요!"></textarea>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!--카테고리-->
                                <div class="row">
                                    <label class="col-md-4" for="uname">카테고리</label>
                                    <div class="form-group col-md-8">
                                        <input type="text" class="form-control " id="uname" placeholder="Enter username" name="uname" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!--채식 스타일-->
                                <div class="row">
                                    <label class="col-md-4" for="uname">채식 스타일</label>
                                    <div class="form-group col-md-8">
                                        <input type="text" class="form-control " id="uname" placeholder="Enter username" name="uname" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!--난이도-->
                                <div class="row">
                                    <label class="col-md-4" for="uname">난이도</label>
                                    <div class="form-group col-md-8">
                                        <input type="text" class="form-control " id="uname" placeholder="Enter username" name="uname" required>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!--조리 시간-->
                                <div class="row">
                                    <label class="col-md-4" for="uname">조리 시간</label>
                                    <div class="form-group col-md-8">
                                        <div style=" display: inline-block;">
                                            <select class="form-control" id="sel1" name="sellist1">
                                                <option>0</option>
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                                <option>6</option>
                                                <option>7</option>
                                                <option>8</option>
                                                <option>9</option>
                                                <option>10</option>
                                            </select>
                                        </div>
                                        &nbsp;시간&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        <div style=" display: inline-block;">
                                            <select class="form-control" id="sel1" name="sellist1">
                                                <option>00</option>
                                                <option>15</option>
                                                <option>30</option>
                                                <option>45</option>
                                            </select>
                                        </div>
                                        &nbsp;분

                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                            </div>

                            <!--대표 이미지 등록-->
                            <div class="col-md-6">
                                <div style="background-color:pink; height: 450px;">test</div>
                            </div>

                            
                        </div>
                        
                    </form>    
                </div>
            </div>
            <!--레시피 기본 정보 끝-->



            <!--레시피 준비하기-->
            <div class="card">
                <div class="card-body">
                    <form class="form" role="form" autocomplete="off">
                        <div class="row">
                            <div class="col-md-12">
                                <!--레시피 재료-->
                                <div class="row">
                                    <label class="col-md-2" for="uname">재료</label>
                                    <div class="form-group col-md-10">
                                        <textarea class="form-control" rows="3" id="rcomment" name="recipecomment" placeholder="예) 슈레드치즈 50g, 아보카도 1개, 플레인요거트 1개, 방울토마토 5개, 사워크림 2T, 꿀 1t, 소금 1꼬집"></textarea>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>

                                <!--필요한 도구-->
                                <div class="row">
                                    <label class="col-md-2" for="uname">필요한 도구</label>
                                    <div class="form-group col-md-10">
                                        <textarea class="form-control" rows="3" id="rcomment" name="recipecomment" placeholder="예) 믹싱볼, 식칼, 실리콘주걱"></textarea>
                                        <div class="valid-feedback">Valid.</div>
                                        <div class="invalid-feedback">Please fill out this field.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>    
                </div>
            </div>
            <!--레시피 준비하기 끝-->



            <!--요리 순서-->
            <div class="card">
                <div class="card-body">
                    <form class="form" role="form" autocomplete="off">
                        <div class="row">
                            <div class="col-md-12">
                                <!--요리 순서-->
                                <div class="row">
                                    <label class="col-md-2" for="uname">요리 순서</label>
                                </div>

                                <!--추가되는 항목 -->
                                <!--기본 폼-->
                                <div id="addedFormDiv">
                                    <div id="step01">
                                        <!---->
                                        <div class="row">
                                            <label class="offset-1 col-md-2 step" for="uname">STEP 01</label>
                                            <div class="form-group col-md-5">
                                                <textarea class="form-control" rows="5" name="st1" placeholder="예) 슈레드 치즈를 20분간 해동시켜주세요."></textarea>
                                            </div>
                        
                                            <div class="form-group col-md-2">
                                                <div style="background-color:pink; width:118px; height: 118px;">test</div>
                                            </div>
                        
                                            <input type="Button" value="삭제" onclick="delForm()">
                                        </div>
                                        <!---->
                                    </div>
                                    <!--여기에 추가됨-->
                            </div>
                        <!--추가되는 항목 끝-->

                        <input type="Button" value="추가" onclick="addForm()">

                                <!--완성샷-->
                                <div class="row">
                                    <label class="col-md-2" for="uname">완성샷</label>
                                </div>

                                <div class="row">
                                    <div class="form-group col-md-3" style="background-color:pink">ㅇㅇ</div>
                                    <div class="form-group col-md-3" style="background-color:red">ㅇㅇ</div>
                                    <div class="form-group col-md-3" style="background-color:pink">ㅇㅇ</div>
                                    <div class="form-group col-md-3" style="background-color:red">ㅇㅇ</div>
                                </div>

                            </div>
                        </div>
                    </form>    
                </div>
            </div>
            <!--요리 순서 끝-->


            <!--레시피 등록버튼-->
            <div class="col-md-4 offset-4 roomy-end m-top-40">
                <a href="#"> <button type="submit" class="btn btn-sign">레시피 등록</button></a>
            </div>
        </div>
    </section>
    
    



    
    <script>
        /* 요리순서 추가/삭제 */
        var count = 2;
        function addForm(){
                var addedFormDiv = document.getElementById("addedFormDiv");
                var str = "";
                str+='<div class="row">'
                    +'<label class="offset-1 col-md-2 step" for="uname">STEP 0'+count+'</label>'
                    +'<div class="form-group col-md-5">'
                    +'<textarea class="form-control" rows="5" name="st'+count+'" placeholder="예) 슈레드 치즈를 20분간 해동시켜주세요."></textarea>'
                    +'</div>'
                    +'<div class="form-group col-md-2">'
                    +'<div style="background-color:pink; width:118px; height: 118px;">test</div>'
                    +'</div>'
                    +'<input type="Button" value="삭제" onclick="delForm()">'
                    +'</div>';


                "step0"+count
                +"<input type='text' name='st"+count+"'>" 
                +"<input type='Button' value='삭제' onclick='delForm()'>";
                
                // 추가할 폼(에 들어갈 HTML)
                var addedDiv = document.createElement("div"); // 폼 생성
                addedDiv.id = "step0"+count; // 폼 Div에 ID 부여 (삭제를 위해)
                addedDiv.innerHTML  = str; // 폼 Div안에 HTML삽입
                addedFormDiv.appendChild(addedDiv); // 삽입할 DIV에 생성한 폼 삽입
                count++;
        }

        function delForm(){
                var addedFormDiv = document.getElementById("addedFormDiv");
                if(count >1){ // 현재 폼이 두개 이상이면
                            var addedDiv = document.getElementById("step0"+(--count));
                            // 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
                            addedFormDiv.removeChild(addedDiv); // 폼 삭제 
                }else{ // 마지막 폼만 남아있다면
                            document.baseForm.reset(); // 폼 내용 삭제
                }
        }
</script>
