<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Gson gson = new Gson();
	Map<String, List> rootMap = new HashMap<>();
	List<Map<String, Object>> colsList = new Vector<Map<String,Object>>();
	// cols
	Map<String, Object> colsMap = new HashMap<String, Object>();
	// 1
	colsMap.put("id", "");
	colsMap.put("labels", "연령대");
	colsMap.put("pattern", "");
	colsMap.put("type", "string");
	colsList.add(colsMap);
	// 2
	colsMap = new HashMap<String, Object>();
	colsMap.put("id", "");
	colsMap.put("labels", "명수");
	colsMap.put("pattern", "");
	colsMap.put("type", "number");
	colsList.add(colsMap);
	
	rootMap.put("cols", colsList);
	
	// rows
	List<Map<String, Object>> rowsList = new Vector<Map<String,Object>>();
	Map<String, Object> rowsMap = new HashMap<String, Object>();
	List<Map<String, Object>> detailRowList = new Vector<Map<String,Object>>();
	Map<String, Object> detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", "10대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", 3);
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	
	detailRowMap = new HashMap<String, Object>();
	detailRowList = new Vector<>();
	detailRowMap.put("v", "20대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", 4);
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap = new HashMap<>();
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	
	detailRowMap = new HashMap<String, Object>();
	detailRowList = new Vector<>();
	detailRowMap.put("v", "30대");
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	detailRowMap = new HashMap<String, Object>();
	detailRowMap.put("v", 14);
	detailRowMap.put("f", null);
	detailRowList.add(detailRowMap);
	rowsMap = new HashMap<>();
	rowsMap.put("c", detailRowList);
	rowsList.add(rowsMap);
	
	
	rootMap.put("rows", rowsList);
	
	String data = gson.toJson(rootMap);
	out.print(data);
%>