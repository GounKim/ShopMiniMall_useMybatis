<%@page import="com.dto.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    MemberDTO dto = (MemberDTO)session.getAttribute("login");
    if(dto==null){
%>    
<a href="LoginUIServlet">로그인</a>
<a href="MemberUIServlet">회원가입</a>
<%
 }else{
%>
<a href="LogoutServlet">로그아웃</a>
<a href="MyPageServlet">mypage</a>
<a href="GoodsCartListServlet">장바구니목록</a>
<%
 }//end if
%>