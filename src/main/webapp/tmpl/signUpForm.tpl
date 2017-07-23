<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fx" %>
<%@ page import="ua.itea.javaweb.SignUpController" %>
<%@ page import="ua.itea.javaweb.DBWorker" %>
<%@ page import="ua.itea.javaweb.User" %>
<%@ page import="ua.itea.javaweb.MD5Hash" %>
<%@ page import="java.sql.*, javax.sql.*" %>

<jsp:useBean id="signUpControllerBean" class="ua.itea.javaweb.SignUpController" />
<jsp:setProperty name="signUpControllerBean" property="login" value="${param['login']}" />
<jsp:setProperty name="signUpControllerBean" property="password" value="${param['password']}" />
<jsp:setProperty name="signUpControllerBean" property="confirmedPassword" value="${param['confirmedPassword']}" />
<jsp:setProperty name="signUpControllerBean" property="name" value="${param['name']}" />
<jsp:setProperty name="signUpControllerBean" property="age" value="${param['age']}" />
<jsp:setProperty name="signUpControllerBean" property="continent" value="${param['continent']}" />
<jsp:setProperty name="signUpControllerBean" property="gender" value="${param['gender']}" />
<jsp:setProperty name="signUpControllerBean" property="feedback" value="${param['feedback']}" />
<jsp:setProperty name="signUpControllerBean" property="agreement" value="${param['agreement']}" />

<c:set var="login" value="${param['login']}" />
<c:set var="password" value="${param['password']}" />
<c:set var="confirmedPassword" value="${param['confirmedPassword']}" />
<c:set var="name" value="${param['name']}" />
<c:set var="age" value="${param['age']}" />
<c:set var="continent" value="${param['continent']}" />
<c:set var="gender" value="${param['gender']}" />
<c:set var="feedback" value="${param['feedback']}" />
<c:set var="agreement" value="${param['agreement']}" />

<section>
	<article>
		<header>
			<h2>Registration</h2>
		</header>
		
		<form  id="registrationForm" action = "index.jsp?signUp" method = "post">
			<center>
				<table border="0" width="100%">
					<tr>
						<th colspan="3">Registration form</th>
					</tr>
		    
					<tr>
						<td colspan="3" align="center">
							<div class="field">
								<label>* Required fields</label>
							</div>
						</td>
					</tr>

					<tr>
						<td width="30%">
							<div class="field">
								<label>Login (Email address)*</label>
							</div>
						</td>

						<td width="45%"> 
							<div class="field">
								<div class="input"><input type="text" name="login" value="${login !=null ? login : ""}"/></div>
							</div>
						</td>
			
						<td width="25%"> 
							<div class="field">
								<label>
									<c:if test="${login != null}">
										<jsp:getProperty name="signUpControllerBean" property="loginResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		 
					<tr>
						<td> 
							<div class="field">
								<label>Password*</label>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<div class="input"><input type="password" name="password" value="${password !=null ? password : ""}"/></div>
							</div>
						</td>
		    
						<td> 
							<div class="field">
								<label>
									<c:if test="${password != null}">
										<jsp:getProperty name="signUpControllerBean" property="passwordResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		 
					<tr>
						<td> 
							<div class="field">
								<label>Confirm password*</label>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<div class="input"><input type='password' name="confirmedPassword" value="${confirmedPassword !=null ? confirmedPassword : ""}"/></div>
							</div>
						</td>
		    
						<td> 
							<div class="field">
								<label>
									<c:if test="${confirmedPassword != null}">
										<jsp:getProperty name="signUpControllerBean" property="confirmedPasswordResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		    
					<tr>
						<td> 
							<div class="field">
								<label>Name*</label>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<div class="input"><input type='text' name='name' value="${name !=null ? name : ""}"/></div>
							</div>
						</td>
		    
						<td> 
							<div class="field">
								<label>
									<c:if test="${name != null}">
										<jsp:getProperty name="signUpControllerBean" property="nameResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		    
					<tr>
						<td> 
							<div class="field">
								<label>Age*</label>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<div class="input"><input type="text" name="age" value="${age !=null ? age : ""}"/></div>
							</div>
						</td>
						
						<td>
							<div class="field">
								<label>
									<c:if test="${age != null}">
										<jsp:getProperty name="signUpControllerBean" property="ageResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		 
					<tr>
						<td> 
							<div class="field">
								<label>Continent*</label>
							</div>
						</td>

						<td> 
							<div class="field">
								<div class="input">
									<select name="continent">
										<option value=""> </option>
										<option value="Africa" <c:if test="${continent eq 'Africa'}"> <c:out  value="selected"/> </c:if>>Africa</option>
										<option value="Antarctica" <c:if test="${continent eq 'Antarctica'}"> <c:out  value="selected"/> </c:if>>Antarctica</option>
										<option value="Asia" <c:if test="${continent eq 'Asia'}"> <c:out  value="selected"/> </c:if>>Asia</option>
										<option value="Australia" <c:if test="${continent eq 'Australia'}"> <c:out  value="selected"/> </c:if>>Australia</option>
										<option value="Europe" <c:if test="${continent eq 'Europe'}"> <c:out  value="selected"/> </c:if>>Europe</option>
										<option value="North America" <c:if test="${continent eq 'North America'}"> <c:out  value="selected"/> </c:if>>North America</option>
										<option value="South America" <c:if test="${continent eq 'South America'}"> <c:out  value="selected"/> </c:if>>South America</option>
									</select>
								</div>
							</div>
						</td>
						
						<td> 
							<div class="field">
								<label>
									<c:if test="${login != null}">
										<jsp:getProperty name="signUpControllerBean" property="continentResult" />
									</c:if>
								</label>
							</div>
						</td> 
					</tr>

					<tr>
						<td> 
							<div class="field">
								<label>Gender*</label>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<div class="input">
									<div class="radio">
										<input type="radio" name="gender" value="m" <c:if test="${gender eq 'm'}"> <c:out  value="checked"/> </c:if>/> Male
										<input type="radio" name="gender" value="f" <c:if test="${gender eq 'f'}"> <c:out  value="checked"/> </c:if>/> Female
									</div>
								</div>
							</div>
						</td>
		    
						<td>
							<div class="field">
								<label>
									<c:if test="${login != null}">
										<jsp:getProperty name="signUpControllerBean" property="genderResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		    
					<tr>
						<td> 
							<div class="field">
								<label>Leave feedback*</label>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<div class="input">
									<textarea cols="30" rows="15" name="feedback">${feedback !=null ? feedback : ""}</textarea>
								</div>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<label>
									<c:if test="${feedback != null}">
										<jsp:getProperty name="signUpControllerBean" property="feedbackResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		    
					<tr>
						<td> 
							<div class="field">
								<label>I agree receive email notifications on your special sales*</label>
							</div>
						</td>

						<td> 
							<div class="field">
								<div class="input">
									<div class="checkbox">
										<input type="checkbox" name="agreement" <c:if test="${agreement eq 'on'}"> <c:out  value="checked"/> </c:if>/>
									</div>
								</div>
							</div>
						</td>
		    
						<td> 
							<div class="field">
								<label>
									<c:if test="${login != null}">
										<jsp:getProperty name="signUpControllerBean" property="agreementResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		 
					<tr>
						<td colspan="3">
							<div class="submit">
								<button type="submit">Sign up</button>
								<c:if test="${login != null}">
									<jsp:getProperty name="signUpControllerBean" property="submitResult" />
								</c:if>
							</div>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</article>
</section>

<c:if test="${(!signUpControllerBean.isErrorForm()) && (login != null)}">
	<jsp:useBean id="signUpMd5HashBean" class="ua.itea.javaweb.MD5Hash" />
	<jsp:useBean id="userBean" class="ua.itea.javaweb.User" />
	<jsp:setProperty name="userBean" property="login" value="${param['login']}" />
	<jsp:setProperty name="userBean" property="password" value="${signUpMd5HashBean.getHash(param['password'])}" />
	<jsp:setProperty name="userBean" property="name" value="${param['name']}" />
	<jsp:setProperty name="userBean" property="age" value="${param['age']}" />
	<jsp:setProperty name="userBean" property="continent" value="${param['continent']}" />
	<jsp:setProperty name="userBean" property="gender" value="${param['gender']}" />
	<jsp:setProperty name="userBean" property="feedback" value="${param['feedback']}" />
	<jsp:useBean id="signUpDbWorkerBean" class="ua.itea.javaweb.DBWorker" />
	<c:out value="${signUpDbWorkerBean.addUser(userBean)}" />
	<c:set var="user" value="${signUpDbWorkerBean.getUser(param['login'], signUpMd5HashBean.getHash(param['password']))}" scope="session" /> 
	<c:out value="${signUpDbWorkerBean.closeAll()}" />
</c:if>


<c:if test="${sessionScope.user != null}">
	<c:redirect url = "index.jsp"/>
</c:if>
