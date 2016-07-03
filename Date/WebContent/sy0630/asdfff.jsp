<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
select * from (select couplename,likecount,rownum r from (select couplename,sum(likecount) as likecount from dc_diary group by couplename order by likecount desc)) where r>=1 and r<=5