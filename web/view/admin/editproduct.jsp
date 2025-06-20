<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- Start header section -->
  <jsp:include page = "./header/header.jsp" flush = "true" />

    <div class="content-wrapper">
      <div class="container-fluid">
        <div class="row mt-3">
          <div class="col-lg-12">
            <div class="card">
              <div class="card-body">
                <div class="card-title">Sửa sản phẩm</div>
                <hr>
                <form method="post" action="${pageContext.request.contextPath}/admin/product/edit" enctype="multipart/form-data">
                
                 <div class="form-group">
                    <label for="input-1">Mã sản phẩm</label>
                    <input type="text" class="form-control" readonly="readonly" id="input-1" placeholder="Mã sản phẩm" name="product-sku" value="${product.id}">
                  </div>
                  
                  <div class="form-group">
                    <label for="input-1">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Tên sản phẩm" name="product-name" value="${product.name}">
                  </div>
                  
        
                  <div class="form-group">
	                  <label for="input-2">Chuyên mục</label>
	                  <div>
	                    <select class="form-control valid" id="input-6" name="product-cate" aria-invalid="false">
	                    <c:forEach items="${catelist}" var="cate">
	                        <option value="${cate.id }" selected="selected">${cate.name }</option>
	                    </c:forEach>
	                    </select>
	                  </div>
	                </div>
	                 <div class="form-group">
                    <label for="input-1">Ngày</label> 
                    <input type="date" class="form-control" id="input-1" placeholder="Ngày đăng" name="product-day" value="${product.created}">
                  </div>
	                <div class="form-group">
                    <label for="input-1">Giá</label>
                    <input type="text" class="form-control" id="input-1" placeholder="Giá" name="product-price" value="${product.price}">
                  </div>
                  
                    <div class="form-group">
	                  <label for="input-2">Trạng thái</label>
	                  <div>
	                    <select class="form-control valid" id="input-6" name="product-status" required aria-invalid="false">
	                        <option value="1">Còn hàng</option>
	                        <option value="0" >Hết hàng</option>
	                    </select>
	                  </div>
	                </div>
	                 <div class="form-group">
		                <label for="input-2">Giảm giá</label>
		                <div class="input-group">
		                <input type="text" class="form-control" placeholder="Giảm ... %" name="product-discount" value="${product.discount}">
		                <div class="input-group-append">
		                <button class="btn btn-light" type="button">%</button>
		                </div>
		                </div>
	              </div>
                 <div class="form-group">
                  <label for="input-2" class="col-form-label">Mô tả</label>
                  <div>
                    <textarea class="form-control" rows="4" id="input-17" name="product-desc">${product.description}</textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label for="input-2" class="col-form-label">Nội dung</label>
                  <div>
                    <textarea class="form-control" rows="4" id="input-17" name="product-content">${product.content}</textarea>
                  </div>
                </div>
                
                <div class="form-group">
                    <label>Ảnh đại diện</label>
                    <div id="drop-area" style="border:2px dashed #ccc; padding:20px; text-align:center; cursor:pointer;">
                        <p>Kéo & thả ảnh vào đây hoặc bấm để chọn ảnh</p>
                        <input type="file" id="product-image" name="product-image" accept="image/*" style="display:none;" onchange="previewImage(event)">
                        <img id="preview" 
                             src="<c:out value='${pageContext.request.contextPath}/view/client/assets/images/products/img-test/${product.image_link}'/>" 
                             alt="Ảnh xem trước" 
                             style="display:${product.image_link != null ? 'block' : 'none'}; max-width:200px; margin-top:10px;"/>
                        <!-- Ẩn input để giữ tên ảnh cũ nếu không upload mới -->
                        <input type="hidden" name="product-image-old" value="${product.image_link}">
                    </div>
                </div>
              
              
          
               <div class="form-footer">
                     <button class="btn btn-danger"><a href="${pageContext.request.contextPath}/admin/product/list">Hủy</a></button>
                         
                     <button type="submit" class="btn btn-success">Cập nhật</button>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <div class="overlay toggle-menu"></div>
      </div>
    </div>
  
    <jsp:include page = "./footer/footer.jsp" flush = "true" />
<script>
  const dropArea = document.getElementById('drop-area');
  const input = document.getElementById('product-image');
  const preview = document.getElementById('preview');

  dropArea.addEventListener('click', () => input.click());
  dropArea.addEventListener('dragover', (e) => {
      e.preventDefault();
      dropArea.style.background = '#f0f0f0';
  });
  dropArea.addEventListener('dragleave', (e) => {
      e.preventDefault();
      dropArea.style.background = '';
  });
  dropArea.addEventListener('drop', (e) => {
      e.preventDefault();
      dropArea.style.background = '';
      if (e.dataTransfer.files && e.dataTransfer.files[0]) {
          input.files = e.dataTransfer.files;
          previewImage({target: input});
      }
  });

  function previewImage(event) {
      var input = event.target;
      if (input.files && input.files[0]) {
          var reader = new FileReader();
          reader.onload = function(e) {
              preview.src = e.target.result;
              preview.style.display = 'block';
          }
          reader.readAsDataURL(input.files[0]);
      } else {
          preview.src = '#';
          preview.style.display = 'none';
      }
  }
</script>