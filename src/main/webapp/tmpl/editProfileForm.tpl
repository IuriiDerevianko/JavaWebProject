<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fx" %>
<%@ page import="ua.itea.javaweb.SignUpController" %>
<%@ page import="ua.itea.javaweb.DBWorker" %>
<%@ page import="ua.itea.javaweb.User" %>
<%@ page import="ua.itea.javaweb.MD5Hash" %>
<%@ page import="java.sql.*, javax.sql.*" %>

<jsp:useBean id="editProfileControllerBean" class="ua.itea.javaweb.SignUpController" />
<jsp:setProperty name="editProfileControllerBean" property="currentUserId" value="${sessionScope.user.getId()}" />
<jsp:setProperty name="editProfileControllerBean" property="login" value="${param['login']}" />
<jsp:setProperty name="editProfileControllerBean" property="password" value="${param['password']}" />
<jsp:setProperty name="editProfileControllerBean" property="confirmedPassword" value="${param['confirmedPassword']}" />
<jsp:setProperty name="editProfileControllerBean" property="name" value="${param['name']}" />
<jsp:setProperty name="editProfileControllerBean" property="age" value="${param['age']}" />
<jsp:setProperty name="editProfileControllerBean" property="continent" value="${param['continent']}" />
<jsp:setProperty name="editProfileControllerBean" property="gender" value="${param['gender']}" />
<jsp:setProperty name="editProfileControllerBean" property="feedback" value="${param['feedback']}" />

<c:set var="login" value="${param['login']}" />
<c:set var="password" value="${param['password']}" />
<c:set var="confirmedPassword" value="${param['confirmedPassword']}" />
<c:set var="name" value="${param['name']}" />
<c:set var="age" value="${param['age']}" />
<c:set var="continent" value="${param['continent']}" />
<c:set var="gender" value="${param['gender']}" />
<c:set var="feedback" value="${param['feedback']}" />

<section>
	<article>
		<header>
			<h2>Edit profile</h2>
		</header>
		
		<form  id="registrationForm" action = "index.jsp?editProfile" method = "post">
			<center>
				<table border="0" width="100%">
					<tr>
						<th colspan="3">My profile</th>
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
								<div class="input"><input type="text" name="login" value="${sessionScope.user.getLogin()}"/></div>
							</div>
						</td>
			
						<td width="25%"> 
							<div class="field">
								<label>
									<c:if test="${login != null}">
										<jsp:getProperty name="editProfileControllerBean" property="loginResult" />
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
								<div class="input"><input type="password" name="password" value=""/></div>
							</div>
						</td>
		    
						<td> 
							<div class="field">
								<label>
									<c:if test="${password != null}">
										<jsp:getProperty name="editProfileControllerBean" property="passwordResult" />
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
								<div class="input"><input type='password' name="confirmedPassword" value=""/></div>
							</div>
						</td>
		    
						<td> 
							<div class="field">
								<label>
									<c:if test="${confirmedPassword != null}">
										<jsp:getProperty name="editProfileControllerBean" property="confirmedPasswordResult" />
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
								<div class="input"><input type='text' name='name' value="${sessionScope.user.getName()}"/></div>
							</div>
						</td>
		    
						<td> 
							<div class="field">
								<label>
									<c:if test="${name != null}">
										<jsp:getProperty name="editProfileControllerBean" property="nameResult" />
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
								<div class="input"><input type="text" name="age" value="${sessionScope.user.getAge()}"/></div>
							</div>
						</td>
						
						<td>
							<div class="field">
								<label>
									<c:if test="${age != null}">
										<jsp:getProperty name="editProfileControllerBean" property="ageResult" />
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
										<option value="Africa" <c:if test="${sessionScope.user.getContinent() eq 'Africa'}"> <c:out  value="selected"/> </c:if>>Africa</option>
										<option value="Antarctica" <c:if test="${sessionScope.user.getContinent() eq 'Antarctica'}"> <c:out  value="selected"/> </c:if>>Antarctica</option>
										<option value="Asia" <c:if test="${sessionScope.user.getContinent() eq 'Asia'}"> <c:out  value="selected"/> </c:if>>Asia</option>
										<option value="Australia" <c:if test="${sessionScope.user.getContinent() eq 'Australia'}"> <c:out  value="selected"/> </c:if>>Australia</option>
										<option value="Europe" <c:if test="${sessionScope.user.getContinent() eq 'Europe'}"> <c:out  value="selected"/> </c:if>>Europe</option>
										<option value="North America" <c:if test="${sessionScope.user.getContinent() eq 'North America'}"> <c:out  value="selected"/> </c:if>>North America</option>
										<option value="South America" <c:if test="${sessionScope.user.getContinent() eq 'South America'}"> <c:out  value="selected"/> </c:if>>South America</option>
									</select>
								</div>
							</div>
						</td>
						
						<td> 
							<div class="field">
								<label>
									<c:if test="${login != null}">
										<jsp:getProperty name="editProfileControllerBean" property="continentResult" />
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
										<input type="radio" name="gender" value="m" <c:if test="${sessionScope.user.getGender() eq 'm'}"> <c:out  value="checked"/> </c:if>/> Male
										<input type="radio" name="gender" value="f" <c:if test="${sessionScope.user.getGender()  eq 'f'}"> <c:out  value="checked"/> </c:if>/> Female
									</div>
								</div>
							</div>
						</td>
		    
						<td>
							<div class="field">
								<label>
									<c:if test="${login != null}">
										<jsp:getProperty name="editProfileControllerBean" property="genderResult" />
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
									<textarea cols="30" rows="15" name="feedback">${sessionScope.user.getFeedback()}</textarea>
								</div>
							</div>
						</td>
			
						<td> 
							<div class="field">
								<label>
									<c:if test="${feedback != null}">
										<jsp:getProperty name="editProfileControllerBean" property="feedbackResult" />
									</c:if>
								</label>
							</div>
						</td>
					</tr>
		 
					<tr>
						<td colspan="3">
							<div class="submit">
								<button type="submit">Edit</button>
								<c:if test="${login != null}">
									<jsp:getProperty name="editProfileControllerBean" property="submitResult" />
								</c:if>
							</div>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</article>
</section>

<c:if test="${(!editProfileControllerBean.isErrorForm()) && (login != null)}">
	<jsp:useBean id="editProfileMd5HashBean" class="ua.itea.javaweb.MD5Hash" />
	<jsp:useBean id="editUserBean" class="ua.itea.javaweb.User" />
	<jsp:setProperty name="editUserBean" property="id" value="${sessionScope.user.getId()}" />
	<jsp:setProperty name="editUserBean" property="login" value="${param['login']}" />
	<jsp:setProperty name="editUserBean" property="password" value="${editProfileMd5HashBean.getHash(param['password'])}" />
	<jsp:setProperty name="editUserBean" property="name" value="${param['name']}" />
	<jsp:setProperty name="editUserBean" property="age" value="${param['age']}" />
	<jsp:setProperty name="editUserBean" property="continent" value="${param['continent']}" />
	<jsp:setProperty name="editUserBean" property="gender" value="${param['gender']}" />
	<jsp:setProperty name="editUserBean" property="feedback" value="${param['feedback']}" />
	<jsp:useBean id="editProfileDbWorkerBean" class="ua.itea.javaweb.DBWorker" />
	<c:out value="${editProfileDbWorkerBean.editUser(editUserBean)}" />
	<c:remove var="user" scope="session" />
	<c:out value="${editProfileDbWorkerBean.closeAll()}" />
</c:if>

<c:if test="${sessionScope.user == null}">
	<c:redirect url = "index.jsp"/>
</c:if>