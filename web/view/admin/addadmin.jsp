  <!-- Start header section -->
    <div class="content-wrapper">
      <div class="container-fluid"> 
 
        <div class="row mt-3"> 
          <div class="col-lg-8"> 
            <div class="card"> 
              <div class="card-body"> 
                <div class="card-title"> Admin</div> 
                <hr> 
                <form action="${pageContext.request.contextPath}/admin/admin/add" method="post"> 
                           
                  <div class="form-group"> 
                    <label for="input-1">Username</label> 
                    <input type="text" class="form-control" id="input1" placeholder="Username"  name="admin-username">
                  </div> 
                  <div class="form-group"> 
                    <label for="input-1">Password</label> 
                    <input type="password" class="form-control" id="myinput" placeholder="Password" name="admin-password">
                    <input type="checkbox" onclick="myFunction1()">Ho�n th�nh m?t kh?u
                    <script>function myFunction1() {
                    	  var x = document.getElementById("myinput");
                    	  if (x.type === "password") {
                    	    x.type = "text";
                    	  } else {
                    	    x.type = "password";
                    	  }
                    	}</script> 
                  </div>                            
                 <div class="form-group"> 
                    <label for="input-1"> Admin</label> 
                    <input type="text" class="form-control" id="input-1" placeholder= "Admin" name="admin-name"> 
                  </div>	
                  <div class="form-footer"> 
					  <button class="btn btn-danger"><i class="fa fa-times"></i><a href="${pageContext.request.contextPath}/admin/admin/list">Hủy</a></button>
                    <button type="submit" class="btn btn-success"><i class="fa fa-check-square-o"></i> </button>
                </div>  
                </form> 
              </div> 
            </div> 
          </div> 
        </div> 
        <div class="overlay toggle-menu"></div> 
      </div> 
    </div> 
   
