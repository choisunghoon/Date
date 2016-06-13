<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


 <style>
 	li{list-style:none;}
 </style>
			<form name="frmSet">
				 <input type="hidden" id="aa" name="listMore" value="${listMore }"/>
				</form>
				 <c:forEach var="diary" items="${diary}">
				 
				
					<ul class="tbl_area" id="dispRow${diary.num}" style="margin-left:30%;display:none">
						<li>
							<input type="checkbox" name="${diary.num }" value="${diary.num }"/>
							 <label for="${diary.num }">
							<li>
								<center><img src="syimage/${diary.img }"></center>
							</li>
							<li>
							<center>${diary.content}</center>
							</li>
							</label>
						</li>				
					</ul>
				
				</c:forEach>
				<div id="dispMore" style="display:none">
				 <a href="#" onclick="listMore(${totalCnt})" style="margin-left:50%; padding-bottom:100px;">������</a>
				</div>
				<c:forEach end="${totalCnt}" begin="1" var="i">
					<c:if test="${i<=listMore }">
						<script>
				        document.getElementById("dispRow${i}").style.display = 'block'; //�ִ� ���� ���� �۰ų� ������ �̹����� �����ش�
						</script>
					</c:if> 
				</c:forEach>
				<c:if test="${totalCnt > listMore }">
					<script>
					  document.getElementById("dispMore").style.display = 'block'; //�ִ밹������ ȭ�鿡 �����ִ� �̹��� �������� ������ ������ ��ư�� �����ش�
					</script>
				</c:if>
				<script type="text/javascript"> 
				  function listMore(totalCnt) //������ ��ư�� �������� ����Ǵ� �Լ�
				  {
					  
				   var listMore = document.frmSet.listMore.value; //���� ȭ�鿡 �������� ����Ʈ ������ �����´�(3��)
				   
				   var last = Number(listMore) + 3; //�����⸦ ������ 3���� �߰� �ȴ�
				   
				   for (i=Number(listMore)+1;i<=totalCnt;i++) // i=(3+1) -> ����3���� �����ִϱ� �������� 4���� 6����; 4���� �ִ� ������ ���ų� Ŭ�� ����; i= 4++
				   {
				    if (i<=last) // i�� 6���� �۰ų� �������
				    {
				     document.getElementById("dispRow"+i).style.display = 'block'; //dispRow6 ���� block ó���� �Ѵ�
				    }
				   }
				   document.frmSet.listMore.value = last;
				   if (totalCnt <= last)
				   {	
				    document.getElementById("dispMore").style.display = 'none'; //������ ��ư�� �ִ밹������ ũ�ų� ������ none ó��
				   }
				  }
				</script>