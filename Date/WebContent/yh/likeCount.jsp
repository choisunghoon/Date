<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> 게시판</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script type="text/javascript">
</script>
<span>
	<c:if test="${check==1}">		
		<input type="button" name="goodLike" value="좋아햇어요" />
	</c:if>
	
	<c:if test="${check!=1}">
		<input type="button" name="goodLike" value="좋아요" />
	</c:if>
${dto.likecount }
</span>