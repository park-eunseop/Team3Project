<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>


<style>
#first_container {
   padding-top: 200px;
   /* 132px이 딱 맞는 크기*/
}
</style>
<div id="first_container"></div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>






<link rel="stylesheet" href="<c:url value="/resources/assets/css/galleryList.css"/>">


<main>
   <div class="container">
      <div class="gallery">
         <c:forEach var="item" items="${boardList}" varStatus="var">	
         <div class="gallery-item" tabindex="0">
            <img src="<c:url value='/upload/${fileList[var.index].fileName}'/>" class="gallery-image" alt="">
            <div class="gallery-item-info">
               <ul>
                  <li class="gallery-item-likes"><span class="visually-hidden">Likes:</span><i class="fas fa-heart" aria-hidden="true"></i> 56</li>
                  <li class="gallery-item-comments"><span class="visually-hidden">Comments:</span><i class="fas fa-comment" aria-hidden="true"></i> 2</li>
               </ul>
            </div>
         </div>
         </c:forEach>
      </div>
      <!-- End of gallery -->

      <div class="loader"></div>

   </div>
   <!-- End of container -->

</main>
















<div style="height: 170px"></div>
<div class="row">
	<div class="col-md-10 text-right">
		<a href="<c:url value="/Gallary/GallaryWrite.do"/>"
			class="btn btn-success">작성</a>
	</div>
</div>

<!-- 
<c:forEach var="item" items="${boardList}" varStatus="var">



	<img src="<c:url value='/upload/${fileList[var.index].fileName}'/>"
		style="width: 250px; height: 250px" />



</c:forEach>
 -->










