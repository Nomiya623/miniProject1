<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<!-- NAV -->
	<div class="nav-wrapper">
		<div class="container-fluid">
			<div class="nav">
				<a href="#" class="logo"> <img src="../images/logos/logo.png"
					alt="">
				</a>
				<ul class="nav-menu menu-main">
					<li><a href="javascript:void(0)"
						onclick="window.scrollTo({top: 0, behavior: 'smooth'});">home</a></li>
					<li><a href="javascript:void(0)" onclick="toggleSidebar()">category</a></li>
					<!-- left sidebar 맨위에 =표시, category 텍스트 표시
                        a href=에 left sidebar로 열려서 category 제목에 코스메틱 리스트 출력(리스트1, 리스트 2 등) script -->
					<li><a href="#topsellers">bestsellers</a></li>
					<!-- topsellers 섹션으로 이동 -->
					<li><a href="aboutUs.jsp">about us</a></li>
					<!-- aboutUs.jsp 구성해서 이동 -->
				</ul>
				<ul class="nav-menu">
					<li><a href="#"><i class='bx bx-search'></i></a> <!-- bx-search 클릭 시 search input bar 표시,
                        화면 밖 클릭 시 사라짐 script animate,
                        search input bar 에 검색창 %like keyword 추가,
                        검색 리스트에 없을 시 '검색된 결과가 없습니다' 출력
                        --></li>
					<li><a href="cart.jsp"><i class='bx bx-shopping-bag'></i></a>
					</li>
					<li><a href="signInUp.jsp"><i class='bx bx-user'></i> <%
 String userId = (String) session.getAttribute("userId");
 if (userId != null && !userId.isEmpty()) {
 	out.println(userId + "님 환영합니다");
 }
 %> </a></li>
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
										data-img-1="../images/products/Tom-Ford-RUBY-RUSH.png"
										data-img-2="../images/products/Tom-Ford-RUBY-RUSH-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
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
										data-img-1="../images/products/christianlouboutin-rougelouboutin-velvet-matte.png"
										data-img-2="../images/products/christianlouboutin-rougelouboutin-velvet-matte-1.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
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
											<del>14,988원</del>
											<span class="main-color">11,988원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/son-gucci-505-Janet-Rust-Mat-Lipstick.png"
										data-img-2="../images/products/son-gucci-505-Janet-Rust-Mat-Lipstick-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
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
											<del>30,100원</del>
											<span class="main-color">27,588원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/son-kem-ysl-425.png"
										data-img-2="../images/products/son-kem-ysl-425-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>클렌저</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">민감한 피부에 적합한 순함</div>
										<div class="product-price">
											<del>24,388원</del>
											<span class="main-color">20,388원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/Son-Dior-Rouge-634-Strong-Matte.png"
										data-img-2="../images/products/Son-Dior-Rouge-634-Strong-Matte-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
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
										<div class="product-name">알코올 무함유, 균형잡힌</div>
										<div class="product-price">
											<del>23,588원</del>
											<span class="main-color">20,588원</span>
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
										data-img-1="../images/products/son-kem-ysl-425.png"
										data-img-2="../images/products/son-kem-ysl-425-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>핸드 크림</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">영양 공급, 빠른 흡수</div>
										<div class="product-price">
											<del>18,788원</del>
											<span class="main-color">16,788원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/christianlouboutin-rougelouboutin-velvet-matte.png"
										data-img-2="../images/products/christianlouboutin-rougelouboutin-velvet-matte-1.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>바디 워시</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">필수 오일이 함유된 상쾌함</div>
										<div class="product-price">
											<del>24,788원</del>
											<span class="main-color">22,788원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<!-- <a href="" style="display: inline-block;"> -->
									<div class="product-img"
										data-img-1="../images/products/Tom-Ford-RUBY-RUSH.png"
										data-img-2="../images/products/Tom-Ford-RUBY-RUSH-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<!-- </a> -->
									<a href="#" class="product-info">
										<div class="product-brand">
											<span>컨디셔너</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">아르간 오일이 함유된 보습</div>
										<div class="product-price">
											<del>28,388원</del>
											<span class="main-color">26,388</span>
										</div>
									</a href="#">
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/son-gucci-505-Janet-Rust-Mat-Lipstick.png"
										data-img-2="../images/products/son-gucci-505-Janet-Rust-Mat-Lipstick-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>헤어 세럼</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">케라틴이 함유된 곱슬 방지</div>
										<div class="product-price">
											<del>30,788원</del>
											<span class="main-color">28,788원</span>
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
						style="background-image: url(../images/products/foundation-product-branding-still-life.jpg);">
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
									<!-- <a href="" style="display: inline-block;"> -->
									<div class="product-img"
										data-img-1="../images/products/Tom-Ford-RUBY-RUSH.png"
										data-img-2="../images/products/Tom-Ford-RUBY-RUSH-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<!-- </a> -->
									<a href="#" class="product-info">
										<div class="product-brand">
											<span>데오도란트</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">천연, 알루미늄 무함유</div>
										<div class="product-price">
											<del>18,388원</del>
											<span class="main-color">14,388원</span>
										</div>
									</a href="#">
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/son-gucci-505-Janet-Rust-Mat-Lipstick.png"
										data-img-2="../images/products/son-gucci-505-Janet-Rust-Mat-Lipstick-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>샴푸</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">모든 헤어 타입에 적합한 황산염 무함유</div>
										<div class="product-price">
											<del>27,188원</del>
											<span class="main-color">25,188원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/son-kem-ysl-425.png"
										data-img-2="../images/products/son-kem-ysl-425-2.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>페이스 마스크</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">차콜이 함유된 해독 효과</div>
										<div class="product-price">
											<del>21,188원</del>
											<span class="main-color">19,188원</span>
										</div>
									</div>
								</div>
							</li>
							<li class="glide__slide">
								<div class="product">
									<div class="product-img"
										data-img-1="../images/products/christianlouboutin-rougelouboutin-velvet-matte.png"
										data-img-2="../images/products/christianlouboutin-rougelouboutin-velvet-matte-1.png">
										<div class="product-action">
											<a href="" class="btn"> add to cart </a> <a href=""
												class="btn"> view detail </a>
										</div>
									</div>
									<div class="product-info">
										<div class="product-brand">
											<span>네일 폴리시</span>
											<div class="rating">
												<i class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star'></i> <i class='bx bxs-star'></i> <i
													class='bx bxs-star-half'></i>
											</div>
										</div>
										<div class="product-name">빠른 건조, 오래 지속</div>
										<div class="product-price">
											<del>11,788원</del>
											<span class="main-color">10,788원</span>
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
						<div class="footer-content-header">categories</div>
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
						<div class="footer-content-header">categories</div>
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
						<div class="footer-content-header">categories</div>
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
		var sidebar = document.getElementById("sidebar"); // Replace with your sidebar's ID
		sidebar.style.display = (sidebar.style.display === "none" ? "block"
				: "none");
	}
</script>