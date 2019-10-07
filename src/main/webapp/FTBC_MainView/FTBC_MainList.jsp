<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="vo.ProjectVO"%>
<%@page import="net.sf.json.JSONArray" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> mainProjects =(Map<String, Object>)request.getAttribute("mainProjects");
	List<ProjectVO> popularProjects = (List<ProjectVO>)mainProjects.get("popularProject");
	Gson g = new Gson();
	String a = g.toJson(popularProjects.get(0));
	out.print(a);
	
	JSONArray arrayObj=new JSONArray();
%>