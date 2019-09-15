<%@page import="java.time.Period,java.text.*,java.time.*,java.time.format.DateTimeFormatter"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//存放数据
		//酒店名
		//房型
	String bedType="双床";	//床型
	String begin="2019-11-23";	//起始日，使用dateType修改格式
	String end="2020-3-24";	//结束日
	String s_day=dateType(begin);	
	String e_day=dateType(end);	
			//价格

	
%>
<%! 
	String deleteZero(String str){	//去除0
		if(str.substring(0,1).equals("0")){
			str=str.substring(1,2);
		}
		return str;
	}
	String dateType(String str) {	//转为日期
		String[] arr=str.split("-");
		return deleteZero(arr[1])+"月"+deleteZero(arr[2])+"日";
	}
	
%>