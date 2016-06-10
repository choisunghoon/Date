<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
<style>
.gallery{display :block; width :100%; line-height :1.6em;}
.gallery ul{margin :0; padding :0; list-style :none;}
.gallery li{display :block; float :left; width :350px; margin :35px 5px 5px 35px; padding :0;}
.gallery li.last{margin-right :0;}
.gallery li img{display : block; width : 340px; height : 430px;}
</style>
</head>
<body>

<div class="gallery"> 
  <ul>
    <c:set var="i" value="1"/>
    <c:forEach var="courseList" items="${courseList}">  
     <c:if test="${(i%3)!=0}">
      <li><a href="place.nhn?ctg_num=${ctg_num}&cos_num=${courseList.cos_num}"><img src="${courseList.cos_img}" alt=""></a>${courseList.cos_name} 카운트:${count} i:${i}</li>
     </c:if>
     <c:if test="${(i%3)==0}">
      <li class="last"><a href="place.nhn?ctg_num=${ctg_num}&cos_num=${courseList.cos_num}"><img src="${courseList.cos_img}" alt=""></a>${courseList.cos_img} 카운트:${count} i:${i}</li>
     </c:if>
     <c:set var="i" value="${i+1}"/>
    </c:forEach>
  </ul>
</div>  

</body>

<input type="button" value="코스 추가" align="center" onclick="document.location.href='addCourse.nhn?ctg_num=${ctg_num}'">
<input type="button" value="카테고리로" align="center" onclick="document.location.href='addCtgView.nhn'">