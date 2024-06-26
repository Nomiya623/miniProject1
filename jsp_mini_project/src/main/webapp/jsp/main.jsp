<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ally Vegan Cosmetic</title>
<!-- GOOGLE FONT -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<!-- BOXICONS -->
<link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css'
	rel='stylesheet'>
<!-- GLIDEJS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.min.css">
<!-- APP CSS -->
<link rel="stylesheet" href="../css/grid.css">
<link rel="stylesheet" href="../css/app.css">
</head>

<body>
<body>
	<%
	HttpSession s = request.getSession(false);
	String welcomeMessage = "";
	boolean isLoggedIn = session != null && session.getAttribute("loggedin") != null;
	%>
	<!-- NAV -->
	<div class="nav-wrapper">
		<div class="container-fluid">
			<div class="nav">
				<a href="#" class="logo"> <img src="../images/logos/logo.png"
					alt="Logo">
				</a>
				<ul class="nav-menu menu-main">
					<li><a href="javascript:void(0)"
						onclick="window.scrollTo({top: 0, behavior: 'smooth'});">Home</a></li>
					<li><a href="notFound.jsp">Category</a></li>
					<li><a href="notFound.jsp">Feedbacks</a></li>
					<li><a href="aboutUs.jsp">About Us</a></li>
				</ul>
				<ul class="nav-menu">
					<%
					if (isLoggedIn) {
						String role = (String) session.getAttribute("role");
						String userId = (String) session.getAttribute("userId");
						welcomeMessage = "A".equals(role) ? "Admin, <br>환영합니다!" : userId + "님, <br>환영합니다!";
					%>
					<li><i class='bx bx-user'></i> <%=welcomeMessage%></li>
					<%
					if ("A".equals(role)) {
					%>
					<li><a href="userList.jsp">Admin Page</a></li>
					<%
					} else {
					%>
					<li><a href="myPage.jsp">My Page</a></li>
					<%
					}
					%>
					<li><a href="signOut.jsp"><i class='bx bx-log-out'></i>
							Logout</a></li>
					<%
					} else {
					%>
					<li><a href="signInUp.jsp"><i class='bx bx-user'></i></a></li>
					<%
					}
					%>
					<li><a href="cart.jsp"><i class='bx bx-shopping-bag'></i></a></li>
				</ul>
			</div>
		</div>
	</div>
	<!-- END NAV -->

	<!-- HERO SECTION -->
	<div class="hero-section">
		<div class="row">
			<div class="col-4">
				<div class="slide-info-wrapper">
					<!-- SLIDE INFO -->
					<div class="slide-info active">
						<div class="slide-name">
							<h3 class="top-down delay-2">스킨케어 패키지</h3>
						</div>
						<div class="slide-description">
							<p class="top-down delay-4">자연과 피부를 위한 선택, 비건 스킨케어 패키지. 순식물성
								성분으로 만든 환경 친화적인 제품으로 건강한 아름다움을 경험하세요.</p>
						</div>
						<div class="slide-action">
							<a href="#" class="btn btn-lg top-down delay-6"> shop now </a>
						</div>
					</div>
					<!-- END SLIDE INFO -->
					<div class="slide-info">
						<div class="slide-name">
							<h3 class="top-down delay-2">페이스 세럼</h3>
						</div>
						<div class="slide-description">
							<p class="top-down delay-4">피부 본연의 빛을 깨우는 페이스 세럼. 집중적인 수분과
								영양으로 매일 더 건강하고 빛나는 피부를 선사합니다.</p>
						</div>
						<div class="slide-action">
							<a href="#" class="btn btn-lg top-down delay-6"> shop now </a>
						</div>
					</div>
					<!-- END SLIDE INFO -->
					<!-- SLIDE INFO -->
					<div class="slide-info">
						<div class="slide-name">
							<h3 class="top-down delay-2">아이크림</h3>
						</div>
						<div class="slide-description">
							<p class="top-down delay-4">눈가의 깊은 영양, 우리의 아이크림. 섬세한 눈가를 위한
								자연 유래 성분으로 탄탄한 보습을 선사합니다.</p>
						</div>
						<div class="slide-action">
							<a href="#" class="btn btn-lg top-down delay-6"> shop now </a>
						</div>
					</div>
					<!-- END SLIDE INFO -->
				</div>

			</div>
			<div class="col-8 slide-img-col">
				<div class="slide-img-wrapper">
					<div class="slide-img" id="slide-img">
						<!-- hero section 이미지, 텍스트 클릭시 notFound.jsp 페이지로 이동 
                        페이지 내용: "준비 중입니다. 서비스 완료 후 다시 이용해주세요. 감사합니다."
                        -->
						<img src="../images/banner/veganBg0.png" alt=""> <img
							src="../images/banner/veganBg1.png" alt=""> <img
							src="../images/banner/veganBg2.png" alt="">
					</div>
				</div>
				<div class="hero-slide-toggle">
					<div class="hero-slide-toggle-prev" id="hero-slide-toggle-prev">
						<i class='bx bx-left-arrow-alt'></i>
					</div>
					<div class="hero-slide-index" id="hero-slide-index">1/3</div>
					<div class="hero-slide-toggle-next" id="hero-slide-toggle-next">
						<i class='bx bx-right-arrow-alt'></i>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END HERO SECTION -->

	<!-- BANNER SECTION -->
	<!-- banner section 이미지, 텍스트 클릭시 notFound.jsp 페이지로 이동 
    페이지 내용: "준비 중입니다. 서비스 완료 후 다시 이용해주세요. 감사합니다."
                        -->
	<div class="section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-4">
					<div class="banner">
						<div class="banner-bg"
							style="background-image: url(../images/products/beautiful-eucalyptus-with-beauty-products\ \(6\).jpg);">
						</div>
						<div class="banner-overlay"></div>
						<div class="banner-text">
							<h3>winter collection</h3>
							<a href="#" class="btn"> shop now </a>
						</div>
					</div>
				</div>
				<div class="col-3">
					<div class="banner">
						<div class="banner-bg"
							style="background-image: url(../images/products/beautiful-eucalyptus-with-beauty-products\ \(1\).jpg);">
						</div>
						<div class="banner-overlay"></div>
						<div class="banner-text">
							<h3>spring collection</h3>
							<a href="#" class="btn"> shop now </a>
						</div>
					</div>
				</div>
				<div class="col-5">
					<div class="banner">
						<div class="banner-bg"
							style="background-image: url(../images/products/beautiful-eucalyptus-with-beauty-products\ \(2\).jpg);">
						</div>
						<div class="banner-overlay"></div>
						<div class="banner-text">
							<h3>summer collection</h3>
							<a href="#" class="btn"> shop now </a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END BANNER SECTION -->

	<!-- NEW ARRIVAL SECTION -->
	<!-- addtocart 이미지,텍스트 클릭시 cart.jsp 페이지로 이동;
        view detail 클릭 시 notFound.jsp로 이동
    페이지 내용: "준비 중입니다. 서비스 완료 후 다시 이용해주세요. 감사합니다."
                        -->
	<div class="section">
		<div class="section-header">
			<span class="main-color">n</span>ew arrivals
		</div>
		<div class="container-fluid">
			<div class="products-slide">
				<div class="glide">
					<div class="glide__track" data-glide-el="track">
						<ul class="glide__slides">
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/beautiful-eucalyptus-with-beauty-products (1).jpg"
										data-img-2="../images/products/beautiful-eucalyptus-with-beauty-products (2).jpg">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=1" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=1" class="btn">상세 보기</a>
										</div>
									</div>
									<a href="#" class="product-info">
										<div class="product-brand">
											<span>로션</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">모든 피부 타입에 적합한 보습</div>
										<div class="product-price">
											<del>27,988원</del>
											<span class="main-color">23,988원</span>
										</div>
									</a>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/vegan4.png"
										data-img-2="../images/products/beautiful-eucalyptus-with-beauty-products (2).jpg">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=2" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=2" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>아이크림</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">다크 서클 감소</div>
										<div class="product-price">
											<del>44,988원</del>
											<span class="main-color">35,988원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/beautiful-eucalyptus-with-beauty-products (3).jpg"
										data-img-2="../images/products/beautiful-eucalyptus-with-beauty-products (4).jpg">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=3" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=3" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>립밤</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">비타민 E가 함유된 보습</div>
										<div class="product-price">
											<del>20,100원</del>
											<span class="main-color">11,988원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/beautiful-eucalyptus-with-beauty-products (5).jpg"
										data-img-2="../images/products/beautiful-eucalyptus-with-beauty-products (6).jpg">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=4" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=4" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>파운데이션</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">완전한 커버리지, 메트 마감</div>
										<div class="product-price">
											<del>14,388원</del>
											<span class="main-color">11,988원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/beautiful-eucalyptus-with-beauty-products (6).jpg"
										data-img-2="../images/products/beautiful-eucalyptus-with-beauty-products (5).jpg">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=5" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=5" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>페이스 세럼</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">히알루론산이 함유된 안티에이징</div>
										<div class="product-price">
											<del>63,588원</del>
											<span class="main-color">59,988원</span>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="glide__arrows" data-glide-el="controls">
						<button class="glide__arrow glide__arrow--left" data-glide-dir="<">
							<i class='bx bx-chevron-left'></i>
						</button>
						<button class="glide__arrow glide__arrow--right"
							data-glide-dir=">">
							<i class='bx bx-chevron-right'></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END NEW ARRIVAL SECTION -->

	<!-- TOP SELLERS SECTION -->
	<div class="section">
		<div class="section-header">
			<span class="main-color">t</span>op sellers
		</div>
		<div class="container-fluid">
			<div class="products-slide">
				<div class="glide">
					<div class="glide__track" data-glide-el="track">
						<ul class="glide__slides">

							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/vegan0.png"
										data-img-2="../images/products/vegan1.png">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=6" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=6" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>선크림</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">SPF 50, 방수 기능</div>
										<div class="product-price">
											<del>32,988원</del>
											<span class="main-color">29,988원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/vegan1.png"
										data-img-2="../images/products/vegan2.png">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=7" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=7" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>마스카라</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">길어지는 효과, 방수</div>
										<div class="product-price">
											<del>24,788원</del>
											<span class="main-color">17,988원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">

									<div class="product-img"
										data-img-1="../images/products/vegan2.png"
										data-img-2="../images/products/vegan3.png">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=8" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=8" class="btn">상세 보기</a>
										</div>
									</div>
									
									<a href="#" class="product-info">
										<div class="product-brand">
											<span>블러쉬</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">모든 피부 톤에 자연스러운 모양</div>
										<div class="product-price">
											<del>28,388원</del>
											<span class="main-color">27,588</span>
										</div>
									</a href="#">
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/vegan3.png"
										data-img-2="../images/products/vegan4.png">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=9" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=9" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>아이라이너</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">번짐 방지, 롱 래스팅</div>
										<div class="product-price">
											<del>20,788원</del>
											<span class="main-color">15,588원</span>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="glide__arrows" data-glide-el="controls">
						<button class="glide__arrow glide__arrow--left" data-glide-dir="<">
							<i class='bx bx-chevron-left'></i>
						</button>
						<button class="glide__arrow glide__arrow--right"
							data-glide-dir=">">
							<i class='bx bx-chevron-right'></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END TOP SELLERS SECTION -->

	<!-- SPECIAL SECTION -->
	<div class="section-special bg-fixed"
		style="background-image: url(../images/banner/laura-chouette-uedyzm50WTQ-unsplash.jpg);">
		<div class="row">
			<div class="col-6"></div>
			<div class="col-6 bg-main">
				<div class="special-product">
					<span>spring collection</span>
					<h2>
						changing <span class="main-color">the</span> ideal of <span
							class="main-color">beauty</span>
					</h2>
					<p>Lorem ipsum dolor sit amet consectetur adipisicing elit.
						Consequuntur voluptate, fugit deserunt eos eligendi tempora,
						quaerat, accusantium est quibusdam accusamus ad illo similique
						tenetur nam quidem reprehenderit culpa explicabo quisquam.</p>
					<a href="#" class="btn btn-lg">shop now</a>
					<div class="special-product-img"
						style="background-image: url(../images/products/vegan1.png);">
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END SPECIAL SECTION -->

	<!-- NEW TREND SECTION -->
	<div class="section">
		<div class="section-header">
			<span class="main-color">n</span>ew trends
		</div>
		<div class="container-fluid">
			<div class="products-slide">
				<div class="glide">
					<div class="glide__track" data-glide-el="track">
						<ul class="glide__slides">
							<li class="glide__slide">
								<div class="product">
									
									<div class="product-img"
										data-img-1="../images/products/Tom-Ford-RUBY-RUSH.png"
										data-img-2="../images/products/Tom-Ford-RUBY-RUSH-2.png">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=10" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=10" class="btn">상세 보기</a>
										</div>
									</div>
									<!-- </a> -->
									<a href="#" class="product-info">
										<div class="product-brand">
											<span>립스틱</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">생생한 색감, 보습</div>
										<div class="product-price">
											<del>28,388원</del>
											<span class="main-color">23,988원</span>
										</div>
									</a href="#">
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/vegan5.png"
										data-img-2="../images/products/vegan4.png">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=11" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=11" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>네일</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">빠른 건조, 오래 지속</div>
										<div class="product-price">
											<del>12,188원</del>
											<span class="main-color">10,788원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/beautiful-eucalyptus-with-beauty-products.jpg"
										data-img-2="../images/products/beautiful-eucalyptus-with-beauty-products (1).jpg">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=12" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=12" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>클렌져</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">민감한 피부에 적합한 보습</div>
										<div class="product-price">
											<del>21,188원</del>
											<span class="main-color">20,388원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/beautiful-eucalyptus-with-beauty-products (1).jpg"
										data-img-2="../images/products/beautiful-eucalyptus-with-beauty-products (2).jpg">
										<div class="product-action">
											<a href="addToCart.jsp?itemid=13" class="btn">장바구니에 추가</a> <a
												href="productsDetails.jsp?itemid=13" class="btn">상세 보기</a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>토너</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">알코울 무함유, well-balanced</div>
										<div class="product-price">
											<del>22,788원</del>
											<span class="main-color">21,588원</span>
										</div>
									</div>
								</div>
							</li>
						</ul>
					</div>
					<div class="glide__arrows" data-glide-el="controls">
						<button class="glide__arrow glide__arrow--left" data-glide-dir="<">
							<i class='bx bx-chevron-left'></i>
						</button>
						<button class="glide__arrow glide__arrow--right"
							data-glide-dir=">">
							<i class='bx bx-chevron-right'></i>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- END NEW TREND SECTION -->

	<!-- FOOTER -->
	<footer class="section">
		<div class="container-fluid">
			<div class="row">
				<div class="col-3">
					<div class="footer-content">
						<a href="#" class="logo"> <img src="../images/logos/logo.png"
							alt="">
						</a>
						<p class="text-gray">Lorem ipsum dolor sit, amet consectetur
							adipisicing elit. Distinctio, doloribus sit deleniti asperiores
							officiis odit animi, labore laboriosam sunt deserunt dolores
							molestias accusantium eius fugiat adipisci et repellendus nihil
							neque.</p>
						<p>1366 Gyeongwon-daero, Bupyeong-gu, Incheon, Republic of
							Korea (21404)</p>
						<p>allyvegan@mail.com</p>
						<div class="social-list">
							<!-- Facebook -->
							<a href="https://www.facebook.com/login.php" target="_blank">
								<i class='bx bxl-facebook'></i>
							</a>

							<!-- Twitter -->
							<a href="https://twitter.com/login" target="_blank"> <i
								class='bx bxl-twitter'></i>
							</a>

							<!-- Instagram -->
							<a href="https://www.instagram.com/accounts/login/"
								target="_blank"> <i class='bx bxl-instagram'></i>
							</a>
						</div>

					</div>
				</div>
				<div class="col-3">
					<div class="footer-content">
						<div class="footer-content-header">Spring collection</div>
						<ul>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
						</ul>
					</div>
				</div>
				<div class="col-3">
					<div class="footer-content">
						<div class="footer-content-header">Summer collection</div>
						<ul>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
						</ul>
					</div>
				</div>
				<div class="col-3">
					<div class="footer-content">
						<div class="footer-content-header">Winter collection</div>
						<ul>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
							<li><a href="#">categories</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- END FOOTER -->



	<!-- COPYRIGHT -->
	<div class="copyright">
		2024 Ally brand- <a
			href="https://github.com/Nomiya623/miniProject1.git" target="_blank">Nomiya623</a>
	</div>
	<!-- END COPYRIGHT -->

	<!-- GLIDEJS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>
	<!-- THREEJS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r127/three.min.js"></script>
	<!-- GSAP -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.6.1/gsap.min.js"></script>
	<!-- HOVER EFFECT -->
	<script src="../js/hover-effect.umd.js"></script>
	<!-- APP JS -->
	<script src="../js/app.js"></script>
</body>

</html>
<script>
	function toggleSidebar() {
		var sidebar = document.getElementById("sidebar");//추후 추가 필요 시 추가
		sidebar.style.display = (sidebar.style.display === "none" ? "block"
				: "none");
	}
</script>