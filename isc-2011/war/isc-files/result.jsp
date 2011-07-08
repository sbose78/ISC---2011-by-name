

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
   
<%




    UserService userService = UserServiceFactory.getUserService();
    User user = userService.getCurrentUser();
    
	 String name = request.getParameter("name").toUpperCase().trim();
	 
	PersistenceManager pm = PMF.get().getPersistenceManager();
    String query = "select from " + Student.class.getName()  +   " where name == '"+name+"'";
    List<Student> s= (List<Student>) pm.newQuery(query).execute();
		
    if (s.isEmpty())
	{	
		out.println("sorry , not found");
    } else {
        for (Student student : s) {
		
			String roll=student.getRoll();String center=student.getCenter();
			out.println(roll+center);
			
			String u="http://cisce.examresults.net/fetchresult12.aspx?center1="+center+"&sno1="+roll;
%>			
			<iframe src ="<%=u%>" width="100%" height="1000"></iframe>
			
<%			

			//response.sendRedirect("http://cisce.examresults.net/fetchresult12.aspx?center1="+center+"&sno1="+roll);
			
           
      }
    }
    pm.close();

%>    
	

	

<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-18477518-2']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>


</body>

</html>
