<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Shopping Cart</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
    <main class="page">
        <section class="shopping-cart dark">
            <div class="container">
                <div class="block-heading">
                    <h2>장바구니</h2>

                    <a href="main.jsp" class="btn btn-primary">쇼핑하러 가기</a>

                </div>
                <div class="content">
                    <div class="row">
                        <div class="col-md-12 col-lg-8">
                            <div class="items">
                                <div class="product">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <img class="img-fluid mx-auto d-block image"
                                                src="../images/products/foundation-product-branding-still-life.jpg">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="info">
                                                <div class="row">
                                                    <div class="col-md-5 product-name">
                                                        <div class="product-name">
                                                            <a href="#">제품1</a>
                                                            <div class="product-info">
                                                                <div>기능: <span class="value">설명</span></div>
                                                                <div>기능: <span class="value">설명</span></div>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 quantity">
                                                        <label for="quantity">수량: </label>
                                                        <input id="quantity" type="number" value="1"
                                                            class="form-control quantity-input">
                                                    </div>
                                                    <div class="col-md-3 price">
                                                        <span>10,000원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <img class="img-fluid mx-auto d-block image"
                                                src="../images/products/christianlouboutin-rougelouboutin-velvet-matte-1.png">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="info">
                                                <div class="row">
                                                    <div class="col-md-5 product-name">
                                                        <div class="product-name">

                                                            <a href="#">제품2
                                                            </a>
                                                            <div class="product-info">
                                                                <div>기능: <span class="value">설명</span></div>
                                                                <div>기능: <span class="value">설명</span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 quantity">
                                                        <label for="quantity">수량:</label>
                                                        <input id="quantity" type="number" value="1"
                                                            class="form-control quantity-input">
                                                    </div>
                                                    <div class="col-md-3 price">
                                                        <span>12,000원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="product">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <img class="img-fluid mx-auto d-block image"
                                                src="../images/products/beautiful-eucalyptus-with-beauty-products (6).jpg">
                                        </div>
                                        <div class="col-md-8">
                                            <div class="info">
                                                <div class="row">
                                                    <div class="col-md-5 product-name">
                                                        <div class="product-name">
                                                            <a href="#">제품3</a>
                                                            <div class="product-info">
                                                                <div>기능: <span class="value">설명</span></div>
                                                                <div>기능: <span class="value">설명</span></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 quantity">
                                                        <label for="quantity">수량: </label>
                                                        <input id="quantity" type="number" value="1"
                                                            class="form-control quantity-input">
                                                    </div>
                                                    <div class="col-md-3 price">
                                                        <span>20,000원</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="summary">
                                <h3>Summary</h3>
                                <div class="summary-item"><span class="text">Subtotal</span><span
                                        class="price">42,000원</span></div>
                                <div class="summary-item"><span class="text">Discount</span><span
                                        class="price">$0</span></div>
                                <div class="summary-item"><span class="text">Shipping</span><span
                                        class="price">$0</span></div>
                                <div class="summary-item"><span class="text">Total</span><span
                                        class="price">42,000원</span>
                                </div>
                                <button type="button" class="btn btn-primary btn-lg btn-block">Checkout</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>

</html>