



<%@ page contentType="text/html;charset=iso-8859-1" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.google.appengine.api.labs.taskqueue.Queue"%>
<%@ page import="com.google.appengine.api.labs.taskqueue.QueueFactory"%>

<%@ page import="static com.google.appengine.api.labs.taskqueue.TaskOptions.Builder.*"%>

<%

	Queue queue = QueueFactory.getDefaultQueue(); 
	for(int i=8201;i<=8701;i++)
	{
		String c=""+i;
		queue.add(url("/index.jsp").param("center",c));		
		out.println("adding.. "+c+".. to the queue");
	
	}

%>
