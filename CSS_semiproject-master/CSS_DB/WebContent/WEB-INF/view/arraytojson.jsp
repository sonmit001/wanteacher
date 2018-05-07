
<%@page import="java.io.Console"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="java.util.List" %>
<%@ page import="net.sf.json.JSONArray" %>

<%
JSONArray jsonarray  =(JSONArray)request.getAttribute("jsonarray");
%>
<%=jsonarray %>