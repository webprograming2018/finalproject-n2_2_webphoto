<%@page contentType="text/html" pageEncoding="UTF-8" language="java" import="Model.User" session="true"%>
<jsp:useBean id="user" class="Model.User" scope="session" />
<!DOCTYPE html>

<html>

<head>
    <title>Đặt in/photo - Công ty In ấn Ao Sen đệ nhất photo</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Load normalize.css -->
    <link rel="stylesheet" href="src/lib/normalize.css">
    <!-- Load skeleton.css -->
    <link rel="stylesheet" href="src/lib/skeleton.css">
    <!-- Load fontawesome -->
    <link rel="stylesheet" href="src/lib/fontawesome/all.css">
    <!-- Load custom css -->
    <link rel="stylesheet" type="text/css" href="src/css/main.css">
    <script>
        function previewDoc() {
            var file = document.getElementById("file-upload").files[0];
            url = URL.createObjectURL(file);
            var previewFrame = document.getElementById("preview-frame");

            if (previewFrame === null) {
                var iframe = document.createElement("IFRAME");
                iframe.id = "preview-frame";
                iframe.setAttribute("src", url);
                iframe.setAttribute("width", "100%");
                iframe.setAttribute("height", "300px");
                document.getElementById("preview-area").appendChild(iframe);
            }
            else {
                previewFrame.setAttribute("src", url);
            }
        }
    </script>
</head>

<body data-page-name="order">
    <!-- HEADER -->
    <%@ include file="/includes/customer-header.jsp" %>

    <!-- NAVIGATION -->
    <jsp:include page="/includes/customer-nav.jsp" />

    <!-- CONTENT -->
    <main class="main-content container" id="main-content">
        <h2 class="main-content__title">Đặt in/photo</h2>
        
        <form method="POST" action="UploadServlet" enctype="multipart/form-data" class="form" id="order-form">
            <fieldset id="press-info">
                <legend>Thông tin bản in/photo</legend>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="file-upload">Tải lên file cần in</label>
                    </div>
                    <div class="seven columns">
                        <input type="file" accept=".txt,.doc,.docx,.odt,.pdf" multiple="true" id="file-upload" name="file-upload"
                        required>
                        <button class="button" id="preview-button" type="button" onclick="previewDoc();" disabled>Xem trước</button>
                    </div>
                </div>
                <div class="row form__line-wrapper" id="preview-area"></div>

                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="number-of-pages">Tổng số trang</label>
                    </div>
                    <div class="seven columns">
                        <input type="number" min="1" value="1" id="number-of-pages" name="number-of-pages" required>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="number-of-copies">Số bản</label>
                    </div>
                    <div class="seven columns">
                        <input type="number" min="1" value="1" name="number-of-copies" id="number-of-copies" required>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="number-of-side">Số mặt in</label>
                    </div>
                    <div class="seven columns">
                        <select name="number-of-side" id="number-of-side" required>
                            <option value="1">1 mặt</option>
                            <option value="2">2 mặt</option>
                        </select>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="paper-size">Khổ giấy</label>
                    </div>
                    <div class="seven columns">
                        <select name="paper-size" id="paper-size" required>
                            <option value="a0">A0</option>
                            <option value="a1">A1</option>
                            <option value="a2">A2</option>
                            <option value="a3">A3</option>
                            <option value="a4">A4</option>
                            <option value="a5">A5</option>
                        </select>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="paper-quality">Chất liệu giấy ruột</label>
                    </div>
                    <div class="seven columns">
                        <select name="paper-quality" id="paper-quality" required>
                            <option value="bb60">Bãi bằng 60</option>
                            <option value="bb70">Bãi bằng 70</option>
                            <option value="offset60">Offset 60</option>
                            <option value="offset70">Offset 70</option>
                        </select>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label" for="bookbinding">Đóng quyển</label>
                    </div>
                    <div class="seven columns">
                        <input type="checkbox" name="bookbinding" id="bookbinding">
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label" for="bookbinding-method">Quy cách</label>
                    </div>
                    <div class="seven columns">
                        <select name="bookbinding-method" id="bookbinding-method" required>
                            <option value="spring">Gáy xoắn</option>
                            <option value="sewn">Gáy khâu</option>
                            <option value="taped">Phay keo</option>
                        </select>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label" for="cover-quality">Chất liệu bìa</label>
                    </div>
                    <div class="seven columns">
                        <select name="cover-quality" id="cover-quality" required>
                            <option value="couches150">Couches 150</option>
                            <option value="couches200">Couches 200</option>
                            <option value="couches250">Couches 250</option>
                            <option value="couches300">Couches 300</option>
                        </select>
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label" for="extra-requirement" id="css-extraRequirementTooltip"><i class="far fa-question-circle theme__tooltip-icon"></i>
                            &nbsp;Yêu cầu khác
                            <span class="tooltip__text">Các yêu cầu nằm ngoài đơn hàng sẽ được chúng tôi liên hệ tới quý khách hàng để trao đổi và tính giá theo thỏa thuận.</span>
                        </label>
                    </div>
                    <div class="seven columns">
                        <textarea name="extra-requirement" id="extra-requirement" rows="15"></textarea>
                    </div>
                </div>
                <br>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label" for="total">Thành tiền (tạm tính)</label>
                    </div>
                    <div class="seven columns">
                        <input type="number" id="total" name="total" readonly>
                    </div>
                </div>
            </fieldset>
            <!--Customer's info goes here-->

            <fieldset id="customer-info">
                <input type="hidden" name="cus_id" value="${sessionScope.currentUser.getId()}">
                <legend>Thông tin khách hàng</legend>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="customer-name">Họ và tên</label>
                    </div>
                    <div class="seven columns">
                        <input type="text" id="customer-name" name="customer-name" required value="${sessionScope.currentUser.getFullname()}">
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="customer-tel">Số điện thoại</label>
                    </div>
                    <div class="seven columns">
                        <input type="tel" id="customer-tel" name="customer-tel" required value="${sessionScope.currentUser.getPhoneNumber()}">
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label required" for="customer-email">Email</label>
                    </div>
                    <div class="seven columns">
                        <input type="email" id="customer-email" name="customer-email" required value="${sessionScope.currentUser.getEmail()}">
                    </div>
                </div>
                <div class="row form__line-wrapper">
                    <div class="five columns form__label-container">
                        <label class="form__label" for="customer-address">Địa chỉ</label>
                    </div>
                    <div class="seven columns">
                        <textarea name="customer-address" id="customer-address" cols="30" rows="10">${sessionScope.currentUser.getAddress()}</textarea>
                    </div>
                </div>
            </fieldset>

            <div class="row form__line-wrapper">
                <div class="six columns form__button-container">
                    <input class="form__button form__button--submit" type="submit" name="order" value="Đặt hàng" id="submit-button">
                </div>
                <div class="six columns form__button-container">
                    <input class="form__button form__button--reset" type="reset" value="Điền lại" id="reset-button">
                </div>
            </div>
        </form>
    </main>

    <!-- FOOTER -->
    <%@ include file="/includes/customer-footer.jsp" %>

    <script src="src/lib/jquery-3.3.1.min.js"></script>
    <script src="src/lib/jquery.validate.min.js"></script>
    <script src="src/js/main.js"></script>
    <script src="src/js/order-form.js"></script>
</body>


</html>