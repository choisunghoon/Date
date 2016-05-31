<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
#css_tabs {
    font-family:'nanumgothic', '나눔고딕', 'malgun gothic', '맑은 고딕', 'dotum', '돋움', sans-serif
}
/* 탭 선택 시 표시할 요소(div) 정의(1번 탭 선택 시 첫 번째 div 요소 표시) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3), #css_tabs input:nth-of-type(4), #css_tabs input:nth-of-type(4) ~ div:nth-of-type(4) {
    display:none
}
#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3), #css_tabs input:nth-of-type(4):checked ~ div:nth-of-type(4) {
    display:block
}
/* 라벨 기본 스타일 지정 */
#css_tabs > label {
    display:inline-block;
    font-variant:small-caps;
    font-size:14px;
    padding:10px;
    text-align:center;
    width:15%;
    line-height:1.8em;
    font-weight:700;
    border-radius:3px 3px 0 0;
    background:#eee;
    color:#777;
    border:1px solid #ccc;
    border-width:1px 1px 0
    
}
#css_tabs > label:hover {
    cursor:pointer
}
#css_tabs label[for=tab1] {
    margin-left:10em
}
/* 선택된 라벨, 커서를 올린 라벨 스타일 지정 */
#css_tabs input:nth-of-type(1):checked ~ label:nth-of-type(1), #css_tabs > label[for=tab1]:hover {
    background:tomato;
    color:#fff
}
#css_tabs input:nth-of-type(2):checked ~ label:nth-of-type(2), #css_tabs > label[for=tab2]:hover {
    background:gold;
    color:#fff
}
#css_tabs input:nth-of-type(3):checked ~ label:nth-of-type(3), #css_tabs > label[for=tab3]:hover {
    background:green;
    color:#fff
}
#css_tabs input:nth-of-type(4):checked ~ label:nth-of-type(3), #css_tabs > label[for=tab4]:hover {
    background:green;
    color:#fff
}
/* 실제 내용이 담긴 div 요소 스타일 지정 */
#css_tabs .tab1_content, #css_tabs .tab2_content, #css_tabs .tab3_content, #css_tabs .tab4_content {
    padding:1em;
    border:1px solid #ddd;
    width:1200px;
    height:1000px
}
.gallery{display:block; width:100%; line-height:1.6em;}
.gallery ul{margin:0; padding:0; list-style:none;}
.gallery li{display:block; float:left; width:350px; margin:35px 5px 5px 35px; padding:0;}
.gallery li.last{margin-right:0;}
.gallery li img{display:block; width:340px; height:430px;}


</style>
<title>이벤트</title>
</head>
<body>
<div id="css_tabs">
    <input id="tab1" type="radio" name="tab" checked="checked" />
    <input id="tab2" type="radio" name="tab" />
    <input id="tab3" type="radio" name="tab" />
    <input id="tab4" type="radio" name="tab" />
    <label for="tab1">진행 중인 이벤트</label>
    <label for="tab2">진행 예정 이벤트</label>    
    <label for="tab3">종료된 이벤트</label>  
    <label for="tab4">이벤트 당첨자</label>  
    <div class="tab1_content">
    <div class="gallery">
 
        <ul>
          <li><a href="#"><img src="/Spring/project/k.jpg" alt=""></a></li>
          <li><a href="#"><img src="/Spring/project/k.jpg" alt=""></a></li>
          <li class="last"><a href="#"><img src="/Spring/project/k.jpg" alt=""></a></li>
          <li><a href="#"><img src="images/spacer.gif" alt=""></a></li>
          <li><a href="#"><img src="images/spacer.gif" alt=""></a></li>
          <li class="last"><a href="#"><img src="images/spacer.gif" alt=""></a></li>
        </ul></div>
    
    <!-- <section id="gallery" class="clear">
         <c:forEach var="eventList" items="${eventList}">  
          <ul>
          <li><a href="#"><img src="${eventList.eimg}" alt=""></a></li>
        </ul></c:forEach></section>
    
    
    <div class="sub_photo">     

    <ul> 
    
    <c:forEach var="src" items="${src}">  
    <c:forEach var="eventList" items="${eventList}">  
    <li>   
        <p class="thmb">
            <a href="#">
                <img src="${src}" alt=""/>
            </a>
        </p>
        <strong>${eventList.ename}</strong>
        <p class="tx_brief">${eventList.sdate}</p>
    </li>   </c:forEach></c:forEach>
    <!-- li가 게시판 1개글입니다 보일 갤러리 갯수만큼 li반복합니다.
    </ul>   
</div>-->
    </div>
    <div class="tab2_content">Tab2 내용
        <br />근 인력거꾼의 그 라디오로 한다느니보다 바이며, 왜 2위는 충실하였다. 말라서 듯이 높게 또 가지고 것이다. 궂은 같은 끝나가고 소리가 김첨지는 쳐보았건만, 액수에 후려갈겼다. 그 속에서 하고 과한데.</div>
    <div class="tab3_content">Tab3 내용
        <br />사십 듯이 만들 황급하였다. 말조차 벌던 방학을 있었다. 그러자, 날리고 젠장맞을 없었다. 보배를 수 조금 남은 없네, 있다. 그는 은전이 원 수 띄었다. 아씨, 하고 천하를 그들의 모든 병자에 뿐이다.</div>
    <div class="tab4_content">Tab4 내용
        <br />사십 듯이 만들 황급하였다. 말조차 벌던 방학을 있었다. 그러자, 날리고 젠장맞을 없었다. 보배를 수 조금 남은 없네, 있다. 그는 은전이 원 수 띄었다. 아씨, 하고 천하를 그들의 모든 병자에 뿐이다.</div>
</div>
</body>

</html>