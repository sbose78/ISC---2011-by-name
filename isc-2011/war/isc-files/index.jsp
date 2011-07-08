

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.appengine.api.users.User" %>
<%@ page import="com.google.appengine.api.users.UserService" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.io.*" %>
<%@ page import="isc2011.Student" %>
<%@ page import="isc2011.PMF" %>
<%@ page import="java.net.*" %>
<%@ page import="com.google.appengine.api.labs.taskqueue.Queue"%>
<%@ page import="com.google.appengine.api.labs.taskqueue.QueueFactory"%>

<%@ page import="static com.google.appengine.api.labs.taskqueue.TaskOptions.Builder.*"%>
   
<html>   
   
   <H1 align="middle">ISC 2011</H1>
   


	
<body>	
   
<%


 URL yahoo;  
 String center=request.getParameter("center");
 
 if(center == null) response.sendRedirect("/search.jsp");
        
     for(int r1=8201;r1<=8710;r1++)
     { 
		
        String roll="";
         if(r1>99) roll=""+r1;
         else if(r1<10) roll="00"+r1;
         else roll="0"+r1;    
		 
		 roll="010"; 
         
        yahoo = new URL("http://cisce.examresults.net/fetchresult12.aspx?center1="+center+"&sno1="+roll);
        URLConnection yc = yahoo.openConnection();
        BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));
        String inputLine="";
        
        String temp="";
        
        while ((temp = in.readLine()) != null) 
        {    inputLine+=temp;
//             System.out.println(inputLine);
        }
      //   System.out.println(inputLine);
         
         String s=new String(inputLine);
         
   //      System.out.println("LENGTH: "+ s.length()+".. hence not accepted");
         
         if(s.length()<5221) continue;;
         for(int i=0;i<s.length();i++)
         {
             String name=s.substring(i,i+11);
             if(name.equalsIgnoreCase("<b>Name</b>"))
             {  i+=11;
            //    System.out.println(name+".... found"); 
                              
                 i+=9;
				 out.println("<br>");
				 
				 name="";
                 while(s.charAt(i)!='<'){
					name+=s.charAt(i++);
                     //out.print(s.charAt(i++));
                  }
				  out.println(name);
				  out.println("<br>");
				  
				  
				  String a="/td></tr><tr><td><b>School</b></td><td>";
                  i+=a.length()+1;
                 
                  String school="";
                  while(s.charAt(i)!='<'){
                      school+=s.charAt(i++);
                    }
					
						// insert into database
						
					
					Student student=new Student(name,school,center,roll);	
					
					PersistenceManager pm = PMF.get().getPersistenceManager();
		
						try {
									pm.makePersistent(student);
						}
						finally 
						{
							pm.close();
						}  


						
							out.println("<br>School:"+school);
                 
               
						break;
						
						
              }

          }
  }
%>    
	

	
</body>

</html>
