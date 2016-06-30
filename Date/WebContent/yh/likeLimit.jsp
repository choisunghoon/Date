<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  보류

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

// 전체 페이지 수
totalPage = (int) Math.ceil((double) totalCount / blockCount);
if (totalPage == 0) {
	totalPage = 1;
}

// 현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
if (currentPage > totalPage) {
	currentPage = totalPage;
}

// 현재 페이지의 처음과 마지막 글의 번호 가져오기.
startCount = (currentPage - 1) * blockCount;
endCount = startCount + blockCount - 1;

// 시작 페이지와 마지막 페이지 값 구하기.
startPage = (int) ((currentPage - 1) / blockPage) * blockPage + 1;
endPage = startPage + blockPage - 1;

// 마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
if (endPage > totalPage) {
	endPage = totalPage;
}

// 이전 block 페이지
pagingHtml = new StringBuffer();
if (currentPage > blockPage) {
	pagingHtml.append("<a href=callAjax('shareDiaryBoard.nhn?currentPage="
			+ (startPage - 1) + "')>");
	pagingHtml.append("이전");
	pagingHtml.append("</a>");
}

pagingHtml.append("&nbsp;|&nbsp;");

//페이지 번호.현재 페이지는 빨간색으로 강조하고 링크를 제거.
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

// 다음 block 페이지
if (totalPage - startPage >= blockPage) {
	pagingHtml.append("<a href=callAjax('shareDiaryBoard.nhn?currentPage="
			+ (startPage - 1) + "')>");
	pagingHtml.append("다음");
	pagingHtml.append("</a>");
}
</script>
</body>
</html>