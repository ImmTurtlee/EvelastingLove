<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/view/client/assets" var="url"/>
  <!-- Start header section -->
  <jsp:include page = "./header/mainHeader.jsp" flush = "true" />
  
  
  
  <section id="aa-catg-head-banner">
   <img src="${pageContext.request.contextPath}/view/client/assets/images/EvelastingLove1.png" alt="banner sản phẩm">
   <div class="aa-catg-head-banner-area">
     <div class="container">
      <div class="aa-catg-head-banner-content">
        <h2>Hình thức thanh toán</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>  
          <li style="color:#fff">Hình thức thanh toán</li>       
        </ol>
      </div>
     </div>
   </div>
  </section>
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
      	<div>
      		<h1 style ="text-align: center; color: red;">Các hình thức thanh toán của Evelasting Love</h1>
      		<p>Hiện tại đối với các đơn hàng đặt hàng trực tuyến trên website, <strong>Evelasting Love</strong> có những hình thức thanh toán như sau:</p>
      		<strong>* Thanh toán tiền mặt: </strong>
			<p>Sau khi nhận được đơn hàng trên website, bộ phận chăm sóc khách hàng của <strong>Evelasting Love</strong> sẽ liên hệ lại xác nhận đơn hàng với khách hàng,
			thông báo hình thức vận chuyển và phí vận chuyển. Khách hàng sẽ thanh toán bằng tiền mặt khi nhận được hàng và thanh toán trực tiếp với nhân viên giao hàng.
			Hình thức thanh toán tiền mặt sẽ được áp dụng với tất cả các đơn hàng trên toàn quốc.</p>
			<strong>* Thanh toán chuyển khoản ngân hàng và ví điện tử: </strong>
			<p>Sau khi nhận được đơn hàng trên website, bộ phận chăm sóc khách hàng của <strong>Evelasting Love</strong> sẽ xác nhận đơn hàng với khách hàng,
			thông báo hình thức vận chuyển và phí vận chuyển.</p>
			<strong>1.Tài khoản ngân hàng Vietcombank: </strong>
			<p style ="margin-left: 20px;">Tên: XXXXXXXXX<br>
			Ngân hàng: TPBank<br>
			Số tài khoản: 03883643401</p>
			<strong>2.Ví điện tử MOMO: </strong>
			<p style ="margin-left: 20px;">Tên: VU TRAN TUAN SON<br>
			Số điện thoại: 0889499555</p>
			<i>Sau khi thanh toán, nếu gặp bất kì sự cố nào vui lòng liên hệ tới số Hotline 19001234</i><br><br>
      	</div>
      </div>
     </div>
    </section>
    
<!--  footer-->
 <jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->
      