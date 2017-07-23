<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fx" %>
<%@ page import="ua.itea.javaweb.DBWorker" %>
<%@ page import="ua.itea.javaweb.Product" %>
<%@ page import="java.sql.*, javax.sql.*" %>
<%@ page import="java.util.*" %>
<script type="text/javascript" src="jquery-1.3.1.min.js"></script>
<!DOCTYPE HTML>

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
		<c:choose>
			<c:when test="${param['signIn'] != null}">
				<c:set var="title" value="Sign in"/>
			</c:when>
		
			<c:when test="${param['signUp'] != null}">
				<c:set var="title" value="Sign up"/>
			</c:when>
		
			<c:when test="${param['editProfile'] != null}">
				<c:set var="title" value="Edit profile"/>
			</c:when>
		
			<c:otherwise>
				<c:set var="title" value="Home page"/>
			</c:otherwise>
		</c:choose>
		
		<title><c:out value="${title}"/></title>
		<meta name="keywords" content="Iurii, Derevianko, store, java"/>
		<meta name="description" content="Online store. Educational project."/>
		<link rel="stylesheet" type="text/css" href="css/style.css"/>
	</head>

	<body lang=en>

		<header>
			<h1>Online store</h1>
			<p>Educational project</p>
			<nav>
				<ul>
					<div id="main">
						<li><button><a href="index.jsp">Home page</a></button></li>
						<c:if test="${sessionScope.user == null}">
							<li><button><a href="?signIn">Sign in</a></button></li>
							<li><button><a href="?signUp">Sign up</a></button></li>
						</c:if>
						
						<c:if test="${sessionScope.user != null}">
							<li><button><a href="?editProfile">Edit profile</a></button></li>
							<li><button><a href="?cart">Cart</a></button><span id="result"></span></li>
							<li><button><a href="?signOut">Sign out</a></button></li>
						</c:if>
					</div>
				</ul>
			</nav>
		</header>
	
		<c:if test="${(param['signIn'] == null) && (param['signUp'] == null) && (param['editProfile'] == null) && (param['cart'] == null)}">
			<c:if test="${sessionScope.user == null}">
				Dear Customer, welcome to our store, here you will get the best products, gracious services and quick shipping.
			</c:if>

			<c:if test="${sessionScope.user != null}">
				Signed in as <b><c:out value="${sessionScope.user.getLogin()}" /></b>.
				</br>
				Dear <b><c:out value="${sessionScope.user.getName()}" /></b>, welcome to our store, here you will get the best products, gracious services and quick shipping.
			</c:if>
		
		
			<ul>
				<div id="main">
					<li><button><a href="?category=1">Apple Watch</a></button></li>
					<li><button><a href="?category=2">iPhone</a></button></li>
					<li><button><a href="?category=3">MacBook Pro</a></button></li>
				</div>
			</ul>
			
		</c:if>
	
	
		<c:if test="${param['category'] != null}">
			<jsp:useBean id="productDbWorkerBean" class="ua.itea.javaweb.DBWorker" />
			<c:set var="productArray" value="${productDbWorkerBean.getProductArray(param['category'])}" /> 
			<div id="main">
				<center>
					<table border="0" width="70%">
						<c:forEach items="${productArray}" var="current" varStatus="i">
							<tr>
								<td width="40%">
									<img src="img/<c:out value='${current.id}' />.jpg" width="100%" alt="product image"/>
									</br>												
									</br>										
								</td>

								<td width="60%"> 
									<div class="field">
										<ul>
											<li><label><c:out value="${current.price}" /> &#36;</label></li>
											<li><label><c:out value="${current.name}" /></label></li>
											<li><label><c:out value="${current.description}" /></label></li>
										</ul>
									</div>
									<c:if test="${sessionScope.user != null}">
										<button onclick="check('${current.id}')">Buy</button>
										<span class="sign"><button onclick="qntM('${current.id}')">-</button></span>
										<span class="field .input"><input type='text' id='${current.id}' maxlength='2' value='1'/></span>
										<span class="sign"><button onclick="qntP('${current.id}')">+</button></span>
									</c:if>
								</td>
							</tr>
						</c:forEach>
					</table>
				</center>
			</div>
			<c:out value="${productDbWorkerBean.closeAll()}" />
		</c:if>
		
		
		<c:if test="${param['signUp'] != null}">
			<%@ include file="tmpl/signUpForm.tpl" %>
		</c:if>


		<c:if test="${param['signIn']  != null}">
			<%@ include file="tmpl/signInForm.tpl" %>
		</c:if>


		<c:if test="${param['editProfile'] != null}">
			<%@ include file="tmpl/editProfileForm.tpl" %>
		</c:if>


		<c:if test="${param['cart'] != null}">
			<section>
				<article>
					<header>
						<h2>Cart</h2>
					</header>
				
					<c:if test="${sessionScope.sessionCartMap != null}">
						<jsp:useBean id="productByIdDbWorkerBean" class="ua.itea.javaweb.DBWorker" />
						
						<c:set var="totalQnt" value="0" /> 
						<c:set var="totalMoney" value="0" /> 
						
						<div id="main">
							<center>
								<table border="0" width="70%">
									<c:forEach var="entryCartMap" items="${sessionScope.sessionCartMap.getCartMap()}">
										<c:set var="product" value="${productByIdDbWorkerBean.getProduct(entryCartMap.key)}" /> 
										<tr>
											<td width="40%">
												<img src="img/<c:out value='${product.id}' />.jpg" width="100%" alt="product image"/> 
												</br>												
												</br>												
											</td>

											<td width="60%"> 
												<div class="field">
													<ul>
														<li><label><c:out value="${product.name}" /></label></li>
														<li><label><c:out value="${product.description}" /></label></li>
														</br>
														</br>
														<li><label>Price: <b><c:out value="${product.price}" /></b> &#36;</label></li>
														<li><label> Quantity: <b><c:out value="${entryCartMap.value}"/></b> pc/pcs</label></li>
														<li><label> Total: <b><c:out value="${product.price * entryCartMap.value}"/></b> &#36;</label></li>
														<c:set var="totalQnt" value="${totalQnt + entryCartMap.value}" /> 
														<c:set var="totalMoney" value="${totalMoney + (product.price * entryCartMap.value)}" /> 
														
													</ul>
													<button onclick="change('${product.id}')"><a href="?cart">Change</a></button>
													<span class="sign"><button onclick="qntM('${product.id}')">-</button></span>
													<span class="field .input"><input type='text' id='${product.id}' maxlength='2' value='${entryCartMap.value}'/></span>
													<span class="sign"><button onclick="qntP('${product.id}')">+</button></span>
													<button onclick="remove('${product.id}')"><a href="?cart">Remove</a></button>
												</div>
											</td>
										</tr>
									</c:forEach>
									<tr>
										<td width="40%">
											</br>
											</br>											
										</td>

										<td width="60%"> 
											<div class="field">
												<ul>
													</br>
													</br>
													<li><label>Total quantity: <b><c:out value="${totalQnt}" /></b> pc/pcs</label></li>
													<li><label>Total money: <b><c:out value="${totalMoney}" /></b> &#36;</label></li>
												</ul>
											</div>
										</td>
									</tr>
								</table>
							</center>
						</div>
					</article>
				</section>
				<c:out value="${productByIdDbWorkerBean.closeAll()}" />
			</c:if>
		</c:if>
		

		<c:if test="${param['signOut'] != null}">
			<c:remove var="sessionCartMap" scope="session" />
			<c:remove var="user" scope="session" />
			<c:redirect url = "index.jsp"/>
		</c:if>
	
		
		<%@ include file="tmpl/footer.tpl" %>

	</body>
</html>


<script>
function check(productId){
var qnt=document.getElementById(productId).value;
	var arr={"productId":productId,"qnt":qnt};
	$.ajax({
		type:"POST",
		url: "cartController.jsp",
		data:{'mydata':JSON.stringify(arr)},
		//data:{'mydata':arr},
		success:function(msg){
			document.getElementById("result").innerHTML=document.getElementById("result").innerHTML+"<br/>"+msg;
		}
	});
}

function change(productId){
var qnt=document.getElementById(productId).value;
	var arr={"productId":productId,"qnt":qnt};
	$.ajax({
		type:"POST",
		url: "cartChangeController.jsp",
		data:{'mydata':JSON.stringify(arr)}
	});
}

function remove(productId){
var qnt=document.getElementById(productId).value;
	var arr={"productId":productId,"qnt":qnt};
	$.ajax({
		type:"POST",
		url: "cartRemoveController.jsp",
		data:{'mydata':JSON.stringify(arr)}
	});
}

function qntP(productId){
	if(document.getElementById(productId).value < 99) {
		document.getElementById(productId).value=+document.getElementById(productId).value+1;
	}
}

function qntM(productId){
	if(document.getElementById(productId).value > 1) {
		document.getElementById(productId).value=+document.getElementById(productId).value-1;
	}
}
</script>
