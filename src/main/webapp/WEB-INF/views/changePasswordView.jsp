<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>Tài khoản</title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-pagetop bg-light">
  <div class="container">
    <h2 class="title-page">Đổi mật khẩu</h2>
  </div> <!-- container.// -->
</section> <!-- section-pagetop.// -->

<section class="section-content padding-y">
  <div class="container">
    <div class="row">
      <c:choose>
        <c:when test="${empty sessionScope.currentUser}">
          <p>
            Vui lòng <a href="${pageContext.request.contextPath}/changePassword">đăng nhập</a> để xem thông tin tài
            khoản.
          </p>
        </c:when>
        <c:otherwise>
          <aside class="col-md-3 mb-md-0 mb-3">
            <nav class="list-group">
              <a class="list-group-item" href="${pageContext.request.contextPath}/user" role="button"> Tài khoản </a>
              <a class="list-group-item" href="#"> Đơn hàng của tôi </a>
              <a class="list-group-item" href="#"> Sản phẩm yêu thích </a>
              <a class="list-group-item active" href="${pageContext.request.contextPath}/changePassword" role="button">
                Đổi mật khẩu </a>
              <a class="list-group-item" href="#"> Thiết đặt </a>
              <a class="list-group-item" href="${pageContext.request.contextPath}/signout" role="button"> Đăng xuất </a>
            </nav>
          </aside>
          <!-- col.// -->

          <main class="col-md-9">
            <article class="card">
              <div class="card-body">
                <c:if test="${not empty requestScope.successMessage}">
                  <div class="alert alert-success" role="alert">${requestScope.successMessage}</div>
                </c:if>
                <c:if test="${not empty requestScope.errorMessage}">
                  <div class="alert alert-danger" role="alert">${requestScope.errorMessage}</div>
                </c:if>
                <div class="col-lg-6">
                  <form action="${pageContext.request.contextPath}/changePassword" method="post">
                    <div class="mb-3">
                      <label for="inputCurrentPassword" class="form-label">
                        Nhập mật khẩu hiện tại
                      </label>
                      <input type="password"
                             class="form-control"
                             id="inputCurrentPassword"
                             name="currentPassword"
                      >
                    </div>
                    <div class="mb-3">
                      <label for="inputNewPassword" class="form-label">
                        Nhập mật khẩu mới
                      </label>
                      <input type="password"
                             class="form-control"
                             id="inputNewPassword"
                             name="newPassword"
                      >
                    </div>
                    <div class="mb-3">
                      <label for="inputNewPasswordAgain" class="form-label">
                        Nhập mật khẩu mới một lần nữa
                      </label>
                      <input type="password"
                             class="form-control"
                             id="inputNewPasswordAgain"
                             name="newPasswordAgain"
                      >
                    </div>
                    <button type="submit" class="btn btn-primary w-100">Đổi mật khẩu</button>
                  </form>
                </div>
              </div> <!-- card-body.// -->
            </article>
          </main>
          <!-- col.// -->
        </c:otherwise>
      </c:choose>
    </div> <!-- row.// -->
  </div> <!-- container.// -->
</section> <!-- section-content.// -->

<jsp:include page="_footer.jsp"/>
</body>

</html>
