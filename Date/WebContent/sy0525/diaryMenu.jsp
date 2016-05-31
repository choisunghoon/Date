<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>
	ul {width:500px;}
	li{list-style:none;}

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
			
</style>
<div style="width:400px; height:280;">
	<div style="border:1px solid; width:200px; height:200px; float:left;">
		<c:if test="${cdb.coupleimage eq null }">
		<img src="sy0525/couple.png" class="img-circle">
		</c:if>
		<c:if test="${cdb.coupleimage ne null }">
		<img src="sy0525/${cdb.coupleimage }" width="200px" height="200px">
		</c:if>
	</div>
	<center>
		<a href="diary.nhn" >�̹��� ����</a><br/>
		<a href="ex.nhn">�Խù� �ۼ�</a><br/>
		<a href="#">����� ��û</a><br/>
	</center>
	��� ��¥ : <fmt:formatDate value="${cdb.coupledate }" pattern="YYYY-MM-dd" />
</div>


<div>

</div>
<div id="css_tabs">
    <input id="tab1" type="radio" name="tab" checked="checked" />
    <input id="tab2" type="radio" name="tab" />
    <label for="tab1">Ŀ�� ���̾</label>
    <label for="tab2">Ŀ�� ��Ʈ ����</label>     
    <div class="tab1_content">
		<div class="sub_photo">
			 <div class="title_area">
				 <c:forEach var="diary" items="${diary}">
					<ul>
						<li>
							<img src="sy0525/${diary.img }">
						</li>
						<li>
						${diary.content}
						</li>
						<li>
							<button onClick="javascript:location.href='DiaryModify.nhn?num=${diary.num}'">����</button>
							<button onClick="javascript:location.href='DiaryDelete.nhn?num=${diary.num}'">����</button>
						</li>
				
					</ul>
				</c:forEach>
			</div>
		</div>  
    </div>
    <div class="tab2_content">
		<script type="text/javascript">
		   var now = new Date();
		   var then = new Date('${cdb.coupledate }');
		   var gap = now.getTime() - then.getTime();
		   gap = Math.floor(gap / (1000 * 60 * 60 * 24)) + 1;
		   document.write('<div id="dday">D+<span style="font-size:33px;">' + gap + '</span></div>');
			var b = (gap/100)-Math.floor(gap/100);
			
			
			var a = Math.floor(gap/100);
			if(b<1){
				
				document.write('<img src="sy0525/a'+a+'.jpg" width="500" height="600"/>');
			}
		   
		  
			
		   
		
		 </script>  
		
	
	</div>
</div>
