<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fx" %>
<%@page import="ua.itea.javaweb.CartMap" %>
<%@page import="org.json.*" %>
<%@page import="java.util.*" %>

<%
String a=request.getParameter("mydata");
JSONObject jobj;
String productId=null;
String qnt=null;
	try {
		jobj = new JSONObject(a);
		productId=jobj.getString("productId");
		qnt=jobj.getString("qnt");
	} catch (JSONException e) {
		e.printStackTrace();
	}

pageContext.setAttribute("cartProductId", Integer.parseInt(productId));
%>

<c:if test="${sessionScope.sessionCartMap != null}">
	<c:out value="${sessionScope.sessionCartMap.removeProduct(cartProductId)}" />
</c:if>