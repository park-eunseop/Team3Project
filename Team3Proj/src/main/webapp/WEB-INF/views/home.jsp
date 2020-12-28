<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- home -->
<!-- 한글 깨짐 방지 -->
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


    <!-- 메인화면 -->
    <section class="home fix"> 
        <div class="overlay"></div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <div class="rolling">
                        <h2><span id="day" class="text-white">날짜별 정보 입력</span></h2>
                        <h1 class="text-yellow">&nbsp;
                            <span class="word">캬라멜 아몬드라떼</span>
                            <span class="word">콩고기패티 수제 버거</span>
                            <span class="word">김치 버섯볶음</span>
                            <span class="word">당근 케이크</span>
                            <span class="word">아보카도 요거트볼</span>
                            <span class="word">비빔 미역국수</span>
                            <span class="word">베지 피자</span>
                            <span class="word">메이플 피칸 쿠키</span>
                            <span class="word">깐풍 가지 튀김</span>
                            <span class="word">두유 프라푸치노</span>
                            <span class="word">강된장 보리 비빔밥</span>
                            <span class="word">블루베리 샤베트</span>
                            <span class="word">두부만두 무침</span>
                        </h1>
                        <h2 class="text-white">메뉴로 건강한 채식을 도전해볼까? </h2>
                    </div>
                </div>

                <a class="mouse-scroll" href="#about"> 
                    <span class="mouse">
                        <span class="mouse-movement"></span>
                    </span>
                    <span class="mouse-message fadeIn">시작하기</span> <br />
                </a>

            </div>
        </div>
    </section>
    <!-- 메인화면 끝 -->



    <!-- 사이트 소개 -->
    <section id="about" class="about bg-yellow roomy-70">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="about-div text-center">
                        <h2>정말정말&nbsp;건강한&nbsp;&nbsp;채식&nbsp;라이프엔?</h2>
                        <h1>VERY VEGGI.</h1>
                        <h2 class="text-white">-</h2>
                        <h6>
                            여러분의 채식 스타일은 무엇인가요? 락토? 아니면.. 비건?<br/>
                            VERY VEGGI.는 더 건강하고 편리한 채식 라이프를 위해, 이용자 채식 스타일별 맞춤 컨텐츠를 제공합니다.<br/>
                            다른 사람들과 다양한 채식 노하우를 VERY VEGGI.에서 공유해보세요!
                        </h6>
                    
                        <a href="<c:url value="/Member/SignUp.do"/>" class="btn btn-primary m-top-40">회원가입하러 가기</a>
                    </div> 

                </div>
            </div>
        </div>
    </section>
    <!-- 사이트 소개 끝-->



    <!-- 서비스1-베지식단 코칭 소개-->
    <section class="service1 bg-white roomy-120">
        <div class="container">
            <div class="row">
                <!--소개글-->
                <div class="offset-1 col-sm-4 m-top-15">
                    <h3><strong>베지식단</strong> 코칭</h3>
                    <p>
                        나의 채식 라이프, 영양균형이 잘 맞는지 궁금하다면?<br/>
                        매 끼니 식사 전 사진 촬영 한번으로 올바른 채식생활을 위한 코칭 서비스를 이용해보세요!<br/>
                        VERI VEGGI.만의 알고리즘을 통해, 기간 별 영양밸런스 분석으로 추가 섭취해야 할 채식 메뉴를 피드백 받을 수 있습니다.
                    </p>
                    <a href="" class="btn btn-default m-top-40">오늘의 채식 식단 코칭받으러가기!</a>
                </div>

                <!--캐러셀1-->
                <div class="offset-1 col-sm-5 no-padding">
                    <div id="carousel1" class="carousel slide" data-ride="carousel" data-interval="2630">
                        <!-- 슬라이드 이미지 등록 -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                            <img src="<c:url value="/resources/assets/images/코칭1.jpg"/>" alt="코칭1" width="475px" height="365px">
                            </div>
                            <div class="carousel-item">
                            <img src="<c:url value="/resources/assets/images/코칭2.jpg"/>" alt="코칭2" width="475px" height="365px">
                            </div>
                            <div class="carousel-item">
                            <img src="<c:url value="/resources/assets/images/코칭3.jpg"/>" alt="코칭3" width="475px" height="365px">
                            </div>
                        </div>
                        
                        <!-- 이전/다음 이미지 버튼-->
                        <a class="carousel-control-prev" href="#carousel1"  data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#carousel1"  data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- 서비스1-베지식단 코칭 소개 끝-->




    <!-- 서비스2-베지맛집 찾기 소개-->
    <section class="service2 bg-grey roomy-120">
        <div class="container">
            <div class="row">
                <!--캐러셀2-->
                <div class="offset-1 col-sm-5">
                    <div id="carousel2" class="carousel slide" data-ride="carousel" data-interval="2690">
                        <!-- 슬라이드 이미지 등록(이미지크기 : 445*365 72dpi) -->
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                            <img src="<c:url value="/resources/assets/images/맛집3.jpg"/>" alt="맛집3" width="475px" height="365px">
                            </div>
                            <div class="carousel-item">
                            <img src="<c:url value="/resources/assets/images/맛집2.jpg"/>" alt="맛집2" width="475px" height="365px">
                            </div>
                            <div class="carousel-item">
                            <img src="<c:url value="/resources/assets/images/맛집1.jpg"/>" alt="코칭1" width="475px" height="365px">
                            </div>
                        </div>
                        
                        <!-- 이전/다음 이미지 버튼-->
                        <a class="carousel-control-prev" href="#carousel2"  data-slide="prev">
                            <span class="carousel-control-prev-icon"></span>
                        </a>
                        <a class="carousel-control-next" href="#carousel2"  data-slide="next">
                            <span class="carousel-control-next-icon"></span>
                        </a>
                    </div>
                </div>

                <!--소개글-->
                <div class="offset-1 col-sm-4 m-top-15">
                    <h3><strong>베지맛집</strong> 찾기</h3>
                    <p>
                        논-비건 친구들과 함께 외식을 즐기고싶다면?<br/>
                        더 스마트한 채식라이프를 위해, 내주변 식당을 지도로 쉽게 검색하는 서비스를 제공합니다.&nbsp;&nbsp;
                        채식단계 필터 기능과 다른 이용자들의 후기를 확인하여, 검증된 채식맛집을 찾아보세요!
                    </p>
                    <a href="" class="btn btn-default m-top-40">인생 채식 맛집 찾으러가기!</a>
                </div>

            </div>
        </div>
    </section>
    <!-- 서비스2-베지맛집 찾기 소개 끝-->



    <!-- 서비스3-채식레시피 검색 소개-->
    <section class="service3 bg-white roomy-120">
        <div class="container">
            <div class="row">
                <!--소개글-->
                <div class="offset-1 col-sm-10">
                    <h3><strong>채식레시피</strong> 검색</h3>
                    <p>
                        이번 주 주말엔 담백한 두부스테이크 어떤가요?<br/>
                        마이 홈에 미리 지정해둔 나의 채식 단계에 따라, 원하는 테마의 채식 레시피를 쉽게 검색할 수 있습니다.<br/>
                        다른 이용자들과의 레시피 공유를 통해, 영감을 받고 맛있는 쿠킹라이프를 즐기세요.&nbsp;&nbsp;이제 레시피 검색은 예전처럼 책이나 유튜브에 의지할 필요가 없어요 :)
                    </p>
                </div>

                <!-- 레시피 카테고리 -->
                <div class="offset-1 col-sm-10 text-center m-top-45">
                        <div class="row">
                            <div class="col-sm-4">
                                <img src="<c:url value="/resources/assets/images/레시피1.jpg"/>" alt="식사" class="img-circle" />
                                <h4 class="m-top-20"><strong>식사 레시피</strong></h4>
                                <div class="separator"></div>
                                <h5>채식 한끼 먹더라도 식사는 든든하게!<br/> 내 채식 스타일에 맞추어<br/> 다양한 레시피를 찾아보세요.</h5>
                            </div><!-- End off col-md-4 -->
                            <div class="col-sm-4">
                                <img src="<c:url value="/resources/assets/images/레시피2.JPG"/>" alt="간식" class="img-circle" />
                                <h4 class="m-top-20"><strong>간식 레시피</strong></h4>
                                <div class="separator"></div>
                                <h5>출출함을 달래줄 맛있는 간식,<br/>과자부터 케이크까지<br/>건강한 군것질 메뉴를 준비했습니다.</h5>
                            </div><!-- End off col-md-4 -->
                            <div class="col-sm-4">
                                <img src="<c:url value="/resources/assets/images/레시피3.jpg"/>" alt="홈카페" class="img-circle" />
                                <h4 class="m-top-20"><strong>홈카페 레시피</strong></h4>
                                <div class="separator"></div>
                                <h5>채식 카페음료 레시피<br/>기존의 동물성 식재료 없이도,<br/>감성적인 홈카페를 즐길 수 있어요.</h5>
                            </div><!-- End off col-md-4 -->
                        </div>
                </div>

                <div class="offset-1 col-sm-10 text-center">
                    <a href="#" class="btn btn-default m-top-40">맛있는 두부스테이크 만들러가기!</a>
                </div>
            </div>
        </div>
    </section>
    <!-- 서비스3-채식레시피 검색 소개 끝-->



    <!-- 서비스4-커뮤니티 소개-->
    <section class="service4 bg-grey roomy-120">
        <div class="container">
            <div class="row">
                <!--소개글-->
                <div class="offset-1 col-sm-10">
                    <h3>다른 사람들과 <strong>채식정보 공유하기</strong></h3>
                    <p>
                        오늘의 채식 식단과 라이프스타일을 다른사람들과 함께 공유해보세요!<br/>
                        나와 같은 채식스타일을 가진 사람들의 게시글을 필터링하여, 내게 꼭 필요한 정보만 볼 수 있습니다.<br/>
                    </p>
                </div>

                <!-- 캐러셀3 -->
                
                <div class="offset-1 col-sm-10 text-center m-top-25" >
                        <div class="card" >
                            <div class="card-body owl-carousel owl-theme">
                                <div class="item">
                                    <img src="<c:url value="/resources/assets/images/피드1.png"/>"/>
                                </div>
                                <div class="item">
                                    <img src="<c:url value="/resources/assets/images/피드2.png"/>">/>
                                </div>
                                <div class="item">
                                    <img src="<c:url value="/resources/assets/images/피드3.png"/>"/>
                                </div>
                                <div class="item">
                                    <img src="<c:url value="/resources/assets/images/피드4.png"/>"/>
                                </div>
                                <div class="item">
                                    <img src="<c:url value="/resources/assets/images/피드5.png"/>"/>
                                </div>
                                <div class="item">
                                    <img src="<c:url value="/resources/assets/images/피드6.png"/>"/>
                                </div>
                            </div>
                    
                    </div>
                </div>

                <div class="offset-1 col-sm-10 text-center roomy-end">
                    <a href="#" class="btn btn-default m-top-45">채식 꿀팁 소통하기!</a>
                </div>
            </div>
        </div>
    </section>
    <!-- 서비스4-커뮤니티 검색 소개 끝-->