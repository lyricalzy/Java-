<%@page import="java.util.Random"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><% // 스크립트릿
	String tel = request.getParameter("tel");
    // 6글자의 임의의 값을 생성하여 전송(2개 이상의 방법을 융합)
    // 1. 앞번호 3자리에 따라서 다르게 생성(3자리 생성)
    // 01012345678
    String company = tel.substring(0, 3);
	String no = "";
    if(company.equals("010")){
    	no = no + 200;
    }else if(company.equals("011")){
    	no = no + 300;
    }else if(company.equals("017")){
    	no = no + 400;
    }else {
    	no = no + 500;
    }
    // 2. 뒷번호는 랜덤하게 생성
	Random r = new Random();
    int tail = r.nextInt(900) + 100;
    no = no + tail;
%><%= no %>