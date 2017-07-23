<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fx" %>
<%@ page import="ua.itea.javaweb.SignInController" %>
<%@ page import="ua.itea.javaweb.DBWorker" %>
<%@ page import="ua.itea.javaweb.User" %>
<%@ page import="ua.itea.javaweb.MD5Hash" %>
<%@ page import="java.sql.*, javax.sql.*" %>

<jsp:useBean id="signInControllerBean" class="ua.itea.javaweb.SignInController" />
<jsp:useBean id="signInDbWorkerBean" class="ua.itea.javaweb.DBWorker" />
<jsp:useBean id="signInMd5HashBean" class="ua.itea.javaweb.MD5Hash" />
<c:set var="user" value="${signInDbWorkerBean.getUser(param['login'], signInMd5HashBean.getHash(param['password']))}" scope="session" /> 
<jsp:setProperty name="signInControllerBean" property="user" value="${user}"  />
<c:out value="${signInDbWorkerBean.closeAll()}" />

<c:if test="${(param['rememberMe'] != null)}">
	<%session.setMaxInactiveInterval(Integer.MAX_VALUE);%>
</c:if>
			
<c:if test="${(param['rememberMe'] == null)}">
	<%session.setMaxInactiveInterval(10);%>
</c:if>

<c:if test="${sessionScope.user != null}">
	<jsp:useBean id="cartMapBean" class="ua.itea.javaweb.CartMap" />
	<c:set var="sessionCartMap" value="${cartMapBean}" scope="session" /> 
	<c:redirect url = "index.jsp"/>
</c:if>

<section>
	<article>
		<header>
			<h2>Authorization</h2>
		</header>
			
		<form id="loginForm" action="index.jsp?signIn" method="post">

			<div class="field">
				<label>Enter your login:</label>
				<div class="input"><input type="text" name="login" id="login" /></div>
			</div>

			<div class="field">
				<a href="#" id="forgot">Forgot your password?</a>
				<label>Enter your password:</label>
				<div class="input"><input type="password" name="password" id="password" /></div>
			</div>
			
			<div class="field">
				<label>
				<c:if test="${(param['login'] != null)}">
					<jsp:getProperty name="signInControllerBean" property="submitResult" />
				</c:if>
				</label>
			</div>
			
			<div class="submit">
				<button type="submit">Sign in</button>

				<label id="remember"><input name="rememberMe" type="checkbox" value="" /> Remember me</label>
			</div>
		</form>		
	</article>
</section>