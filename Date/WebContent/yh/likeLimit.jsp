<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  ����

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

this.blockCount = blockCount;
this.blockPage = blockPage;
this.currentPage = currentPage;
this.totalCount = totalCount;

// ��ü ������ ��
totalPage = (int) Math.ceil((double) totalCount / blockCount);
if (totalPage == 0) {
	totalPage = 1;
}

// ���� �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
if (currentPage > totalPage) {
	currentPage = totalPage;
}

// ���� �������� ó���� ������ ���� ��ȣ ��������.
startCount = (currentPage - 1) * blockCount;
endCount = startCount + blockCount - 1;

// ���� �������� ������ ������ �� ���ϱ�.
startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
endPage = startPage + blockPage - 1;

// ������ �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
if (endPage > totalPage) {
	endPage = totalPage;
}

// ���� block ������
pagingHtml = new StringBuffer();
if (currentPage > blockPage) {
	pagingHtml.append("<a href=callAjax('shareDiaryBoard.nhn?currentPage="
			+ (startPage - 1) + "')>");
	pagingHtml.append("����");
	pagingHtml.append("</a>");
}

pagingHtml.append("&nbsp;|&nbsp;");

//������ ��ȣ.���� �������� ���������� �����ϰ� ��ũ�� ����.
for (int i = startPage; i <= endPage; i++) {
	if (i > totalPage) {
		break;
	}
	if (i == currentPage) {
		pagingHtml.append("&nbsp;<b> <font color='red'>");
		pagingHtml.append(i);
		pagingHtml.append("</font></b>");
	} else {
		pagingHtml
				.append("<a href=callAjax('shareDiaryBoard.nhn?currentPage="
						+ (startPage - 1) + "')>");
		pagingHtml.append(i);
		pagingHtml.append("</a>");
	}

	pagingHtml.append("&nbsp;");
}

pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");

// ���� block ������
if (totalPage - startPage >= blockPage) {
	pagingHtml.append("<a href=callAjax('shareDiaryBoard.nhn?currentPage="
			+ (startPage - 1) + "')>");
	pagingHtml.append("����");
	pagingHtml.append("</a>");
}
</script>
</body>
</html>