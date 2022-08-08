<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN"/>
<!DOCTYPE html>
<html lang="vi">

<head>
  <jsp:include page="_meta.jsp"/>
  <title>Thông tin đơn hàng</title>
</head>

<body>
<jsp:include page="_header.jsp"/>

<section class="section-pagetop bg-light">
  <div class="container">
    <h2 class="title-page">Thông tin đơn hàng #${requestScope.order.id}</h2>
  </div> <!-- container.// -->
</section> <!-- section-pagetop.// -->

<section class="section-content padding-y">
  <div class="container">
    <div class="row">

      <c:choose>
        <c:when test="${not empty sessionScope.currentUser}">
          <jsp:include page="_navbar.jsp"/>

          <main class="col-md-9">

            <article class="card mb-4">

              <header class="card-header">
                <strong class="d-inline-block me-4">Mã đơn hàng: ${requestScope.order.id}</strong>
                <span>Ngày mua: ${requestScope.createdAt}</span>
                <c:choose>
                  <c:when test="${order.status == 1}">
                    <span class="badge bg-warning text-dark float-end">Đang giao hàng</span>
                  </c:when>
                  <c:when test="${order.status == 2}">
                    <span class="badge bg-success float-end">Giao hàng thành công</span>
                  </c:when>
                  <c:when test="${order.status == 3}">
                    <span class="badge bg-danger float-end">Hủy đơn hàng</span>
                  </c:when>
                </c:choose>

              </header> <!-- card-header.// -->

              <div class="card-body pb-0">
                <div class="row">
                  <div class="col-lg-8">
                    <h6 class="text-muted">Địa chỉ người nhận</h6>
                    <p class="lh-lg">
                        ${sessionScope.currentUser.fullname} <br>
                      Số điện thoại: ${sessionScope.currentUser.phoneNumber} <br>
                      Địa chỉ: ${sessionScope.currentUser.address}
                    </p>
                  </div>
                  <div class="col-lg-4">
                    <h6 class="text-muted">Hình thức thanh toán</h6>
                    <span class="text-success">
                    <i class="fab fa-lg fa-cc-visa"></i>
                    ${requestScope.order.deliveryMethod == 1 ? "Giao tiêu chuẩn" : "Giao nhanh"}
                  </span>
                    <p class="lh-lg">
                      Tạm tính: <fmt:formatNumber pattern="#,##0" value="${requestScope.tempPrice}"/>₫ <br>
                      Phí vận chuyển: <fmt:formatNumber pattern="#,##0" value="${requestScope.order.deliveryPrice}"/>₫
                      <br>
                      <strong>Tổng cộng: <fmt:formatNumber pattern="#,##0"
                                                           value="${requestScope.tempPrice + requestScope.order.deliveryPrice}"/>₫ </strong>
                    </p>
                  </div>
                </div> <!-- row.// -->
              </div> <!-- card-body.// -->

              <hr class="m-0">

              <div class="table-responsive">
                <table class="cart-table table table-borderless">
                  <thead class="text-muted">
                  <tr class="small text-uppercase">
                    <th scope="col" style="min-width: 280px;">Sản phẩm</th>
                    <th scope="col" width="150" style="min-width: 150px;">Giá</th>
                    <th scope="col" width="150" style="min-width: 150px;">Số lượng</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="orderItem" items="${requestScope.orderItems}">
                    <tr>
                      <td>
                        <figure class="itemside">
                          <div class="float-start me-3">
                            <img class="img-fluid"
                                 src="${pageContext.request.contextPath}/image/${orderItem.product.imageName}"
                                 width="80" height="80" alt="${orderItem.product.name}">
                          </div>
                          <figcaption class="info">
                            <a href="${pageContext.request.contextPath}/product?id=${orderItem.product.id}"
                               class="title">${orderItem.product.name}</a>
                          </figcaption>
                        </figure>
                      </td>
                      <td>
                        <div class="price-wrap">
                          <span class="price"><fmt:formatNumber pattern="#,##0" value="${orderItem.price}"/>₫ </span>
                        </div>
                      </td>
                      <td>
                          ${orderItem.quantity}
                      </td>
                    </tr>
                  </c:forEach>
                  </tbody>
                </table>
              </div> <!-- table.responsive-md.// -->
              <form action="${pageContext.request.contextPath}/orderDetail" method="post">
                <div class="card-footer py-3">
                  <a href="#" class="btn btn-primary me-2">Theo dõi đơn hàng</a>
                  <input type="hidden" name="id" value="${requestScope.order.id}">
                  <button type="submit"
                          class="btn btn-danger ${requestScope.order.status != 1 ? "disabled" : ""}"
                          onclick="return confirm('Bạn có muốn hủy đơn hàng?')">
                    Hủy đơn hàng
                  </button>
                </div> <!-- card-footer.// -->
              </form>

            </article>

          </main>
          <!-- col.// -->

        </c:when>
        <c:otherwise>
          <p>
            Vui lòng <a href="${pageContext.request.contextPath}/signin">đăng nhập</a> để sử dụng trang này.
          </p>
        </c:otherwise>
      </c:choose>

    </div> <!-- row.// -->
  </div> <!-- container.// -->
</section> <!-- section-content.// -->

<jsp:include page="_footer.jsp"/>
</body>

</html>
