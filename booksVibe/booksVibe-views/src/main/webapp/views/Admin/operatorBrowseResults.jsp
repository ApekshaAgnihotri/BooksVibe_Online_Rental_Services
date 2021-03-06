<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@page import="java.util.*"%>
<%@page import="com.booksVibe.models.BooksBean"%>
<html>
<head>
<title>BooksVibe.com</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>


<br/><br/>
	<div class="container-fluid" align="center">
		<s:form action="operatorSearchBooks?requestedBy=masterAdmin" theme="bootstrap" 	cssClass="form-inline" label="Browse Our Store" align="center">
		
		    <s:hidden name="requestId" value="2" />
		    <div class="row">
			    <div class="col-lg-2"></div>
		        <div class="col-lg-2"><s:textfield name="bookTitle" placeholder="%{getText('global.title')}" style="height:29px;" /></div>
				<div class="col-lg-2"><s:textfield name="author" placeholder="%{getText('global.author')}" style="height:29px;" /></div>
				<div class="col-lg-2"><s:textfield name="publisher" placeholder="%{getText('global.publisher')}" style="height:29px;" /></div>
				<div class="col-lg-2"><s:select name="category"  headerKey="all" headerValue="All"
												list="#{'Children & Teens':'Children & Teens',
														'Technical':'Technical', 
														'Fiction':'Fiction',
														'Entertainment':'Entertainment',
														'G.K & References':'G.K & References',
														'Health & Familiy':'Health & Familiy',
														'Sports':'Sports',
														'Non Fiction':'Non Fiction'}" />
				</div>
				<div class="col-lg-2"></div>
				
		    </div>
			
			<div class="row">
				<div class="col-xs-4"></div>
				<div class="col-xs-4" align="center"><s:submit effect="highlight" cssClass="btn btn-info" value="%{getText('global.search')}" /></div>
				<div class="col-xs-4"></div>
			</div>
          
		</s:form>
	</div>

    <br/><br/>


<div align="center">
		<display:table id="data" uid="row" name="${sessionScope.ListCarrier}" pagesize="6" partialList="true" size="${sessionScope.Records}" requestURI="operatorSearchBooks">

			<display:column titleKey="global.image">
				<img src='<s:property value="%{#attr.row.kimageFileName}"/>'
					width="100" height="100" />
			</display:column>
			<display:column property="bookTitle" titleKey="global.title" sortable="true" />
			<display:column property="author" titleKey="global.author" sortable="true" />
			<display:column property="category" titleKey="global.category" sortable="true" />
			<display:column property="publisher" titleKey="global.publisher" sortable="true" />

			<display:column>
				<a class="btn btn-info" href='updatepage?bookId=<s:property value="%{#attr.row.bookId}"/>'><s:property value="%{getText('global.update')}"/></a>
			</display:column>
			<display:column>
				<a class="btn btn-info" href='deletebook?bookId=<s:property value="%{#attr.row.bookId}"/>'><s:property value="%{getText('global.delete')}"/></a>
			</display:column>


		</display:table>
 </div>

</body>
</html>