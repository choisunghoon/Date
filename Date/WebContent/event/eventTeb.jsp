<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<style>
#css_tabs {
    font-family:'nanumgothic', '�������', 'malgun gothic', '���� ���', 'dotum', '����', sans-serif
}
/* �� ���� �� ǥ���� ���(div) ����(1�� �� ���� �� ù ��° div ��� ǥ��) */
#css_tabs input:nth-of-type(1), #css_tabs input:nth-of-type(1) ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2), #css_tabs input:nth-of-type(2) ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3), #css_tabs input:nth-of-type(3) ~ div:nth-of-type(3), #css_tabs input:nth-of-type(4), #css_tabs input:nth-of-type(4) ~ div:nth-of-type(4) {
    display:none
}
#css_tabs input:nth-of-type(1):checked ~ div:nth-of-type(1), #css_tabs input:nth-of-type(2):checked ~ div:nth-of-type(2), #css_tabs input:nth-of-type(3):checked ~ div:nth-of-type(3), #css_tabs input:nth-of-type(4):checked ~ div:nth-of-type(4) {
    display:block
}
/* �� �⺻ ��Ÿ�� ���� */
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
/* ���õ� ��, Ŀ���� �ø� �� ��Ÿ�� ���� */
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
/* ���� ������ ��� div ��� ��Ÿ�� ���� */
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
<title>�̺�Ʈ</title>
</head>
<body>
<div id="css_tabs">
    <input id="tab1" type="radio" name="tab" checked="checked" />
    <input id="tab2" type="radio" name="tab" />
    <input id="tab3" type="radio" name="tab" />
    <input id="tab4" type="radio" name="tab" />
    <label for="tab1">���� ���� �̺�Ʈ</label>
    <label for="tab2">���� ���� �̺�Ʈ</label>    
    <label for="tab3">����� �̺�Ʈ</label>  
    <label for="tab4">�̺�Ʈ ��÷��</label>  
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
    <!-- li�� �Խ��� 1�����Դϴ� ���� ������ ������ŭ li�ݺ��մϴ�.
    </ul>   
</div>-->
    </div>
    <div class="tab2_content">Tab2 ����
        <br />�� �η°Ų��� �� ������ �Ѵٴ��Ϻ��� ���̸�, �� 2���� ����Ͽ���. ���� ���� ���� �� ������ ���̴�. ���� ���� �������� �Ҹ��� ��÷���� �ĺ��ҰǸ�, �׼��� �ķ������. �� �ӿ��� �ϰ� ���ѵ�.</div>
    <div class="tab3_content">Tab3 ����
        <br />��� ���� ���� Ȳ���Ͽ���. ������ ���� ������ �־���. �׷���, ������ ������� ������. ���踦 �� ���� ���� ����, �ִ�. �״� ������ �� �� �����. �ƾ�, �ϰ� õ�ϸ� �׵��� ��� ���ڿ� ���̴�.</div>
    <div class="tab4_content">Tab4 ����
        <br />��� ���� ���� Ȳ���Ͽ���. ������ ���� ������ �־���. �׷���, ������ ������� ������. ���踦 �� ���� ���� ����, �ִ�. �״� ������ �� �� �����. �ƾ�, �ϰ� õ�ϸ� �׵��� ��� ���ڿ� ���̴�.</div>
</div>
</body>

</html>