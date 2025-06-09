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
        <h2>Giới thiệu</h2>
        <ol class="breadcrumb">
          <li><a href="${pageContext.request.contextPath}/">Trang chủ</a></li>      
          <li style="color:#fff">Giới thiệu</li>   
        </ol>
      </div>
     </div>
   </div>
  </section>
  <section id="aa-product-category">
    <div class="container">
      <div class="row">
      	<div>
      		<h1 style ="text-align: center; color: black;">Evelasting Love</h1>
                <p>Chào mừng đến với Everlasting Love – nơi tình yêu vĩnh cửu được gói trọn trong những món quà độc đáo!</p>
                <p>Tại Everlasting Love, chúng tôi tin rằng mỗi mối quan hệ đều là một hành trình kỳ diệu, được dệt nên từ những khoảnh khắc, cảm xúc và sự kết nối sâu sắc. Và để kỷ niệm những câu chuyện tình yêu bất diệt ấy, chúng tôi đã tạo ra bộ sưu tập hộp quà tặng 12 cung hoàng đạo độc quyền, như một biểu tượng của sự thấu hiểu và tình cảm chân thành.<p>
                <p>Mỗi cung hoàng đạo mang một nét tính cách và câu chuyện riêng. Chúng tôi đã tỉ mỉ chọn lựa từng chi tiết, từ những vật phẩm bên trong đến cách trang trí bên ngoài, để mỗi hộp quà không chỉ là một món quà, mà còn là một thông điệp ý nghĩa, thể hiện sự quan tâm và am hiểu sâu sắc của bạn về người ấy. Dù là người thân, bạn bè hay "nửa kia" của bạn, hãy để Everlasting Love giúp bạn gửi gắm tình cảm một cách tinh tế và độc đáo nhất.
Hãy cùng chúng tôi khám phá và chọn lựa hộp quà tặng cung hoàng đạo hoàn hảo, để tình yêu của bạn luôn rạng rỡ và bền chặt mãi về sau!</p>
      	</div>
      </div>
     </div>
    </section>
    
<!--  footer-->
<jsp:include page = "./header/aiChatBox.jsp" flush = "true" />
 <jsp:include page = "./footer/footer.jsp" flush = "true" />
<!-- end footer-->
      