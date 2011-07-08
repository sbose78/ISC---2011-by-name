

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="isc2011.Student" %>

<%@ page import="javax.jdo.Query" %>
<%@ page import="isc2011.PMF" %>
<%@ page import="java.net.*" %>
<%@ page import="com.google.appengine.api.labs.taskqueue.Queue"%>
<%@ page import="com.google.appengine.api.labs.taskqueue.QueueFactory"%>

<%@ page import="static com.google.appengine.api.labs.taskqueue.TaskOptions.Builder.*"%>
   
<html>   
   
   <H1 align="middle">ISC 2011</H1>
   



 
	
<body>	
   
   <div align="center">
   
   <form action="/showResultsBySchool.jsp" method="post">
		<select name="mydropdown">
			
	
   
   
<%




    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    
	
	
	//	String center = ""+i;
	
	
	PersistenceManager pm = PMF.get().getPersistenceManager();
	
	/*
    String query = "select from " + Student.class.getName()  +   " where center == '"+center+"'";
	//Query q=pm.newQuery(query); // q.setOrdering("school asc");
	
	//List<Student> s= (List<Student>) q.execute();
    List<Student> s= (List<Student>) (pm.newQuery(query).execute());	
	
	
	PersistenceManager pm = PMF.get().getPersistenceManager(); 
    Query query = pm.newQuery(Student.class); 
	
	query.setFilter("lastName == 'Smith' && hireDate > hireDateMinimum");
    query.declareParameters("Date hireDateMinimum");
	
    query.setOrdering("school asc"); 
	    query.setRange(1, 5);
		    List<Student> s= (List<Student>) (pm.newQuery(query).execute()); 
			
*/			
		
		
    Query query = pm.newQuery(Student.class);
    query.setOrdering("school asc");
	
	String temp="";
	boolean justEntered = true;
	
for(int i=0;i<4000;i+=20)
{
	
	query.setRange(i,i+20)	;		
    List<Student> s = (List<Student>) query.execute();
    if (!s.isEmpty())
	{
        for (Student student : s) {
		
			String c=student.getCenter();		
			String school=student.getSchool();
			
			school+="("+c+")";
			
			if( justEntered == false && temp.equals(school) ) continue;
			
			
			temp=""+school;
			
						
			
%>			
			<option value="<=C%>"><%=school%></option>
<%			//response.sendRedirect("http://cisce.examresults.net/fetchresult12.aspx?center1="+center+"&sno1="+roll);			
			
			justEntered=false;

       }
	  }
}    
    pm.close();

	
%>    
	
</select>

<input type="submit">
</form>

</div>
	
</body>

</html>
