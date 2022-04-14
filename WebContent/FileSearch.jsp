<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.io.File ,java.util.* , java.text.SimpleDateFormat, java.text.DateFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="controller.FilesInDirectoryController" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search filename</title>

   <script>
   //go back
    function goBack() {
        window.history.back()
    }
    </script>
    
    
    
  <style>
  table, th, td {
  border: 1px solid;
  word-wrap: break-word;
   }
   body {
  background-color: lightblue;
  }

 h3 {
  color: white;
  text-align: center;
 }
 
 body{
  font-family: verdana;
  font-size: 12px;
 }
 


th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  

}
.header {
   background-color: lightblue;
  padding: 20px;
  text-align: center;
}
    /*tr:nth-child(even) {background-color: #f2f2f2;}*/
    

  </style>
  
  
  
</head>
<body>
<div class="header">
  <h3>File Search</h3> 
</div> <br>

<%
DateFormat dateFormat = new SimpleDateFormat("MMMM dd, yyyy hh:mm a");
File pathDir = new File(request.getParameter("directory"));
String filename = (String)request.getParameter("filename");
String match = request.getParameter("match/ignorecase");
ArrayList<File> listNames = new ArrayList<File>();

//extension
ArrayList<File> byExt  = new ArrayList<File>();
String[] ext = request.getParameterValues("extensions");

//size
ArrayList<File> bySize  = new ArrayList<File>();

int results = 0;
FilesInDirectoryController controller = new FilesInDirectoryController();

  if(pathDir.exists() && pathDir.isDirectory()) {
	 File files[] = pathDir.listFiles();
	
     
	 if(match.equalsIgnoreCase("matchcase") && request.getParameter("filename") != null){
		 listNames = controller.searchMatchCase(files, filename, listNames);
	 }
	 
	 if(match.equalsIgnoreCase("ignorecase") && request.getParameter("filename") != null ){
		 listNames =controller.searchIgnoreCase(files, filename, listNames);
	 }
	 
	//avoiding null pointer exception
	if(ext != null ){
		 byExt  = controller.searchFiles(files, ext, byExt );
		
	}
	
	
	if(request.getParameter("filesize") != null){
		int size = Integer.parseInt(request.getParameter("filesize"));
		bySize = controller.searchBySize(files, size, bySize);
	}
	
%>


<label >Directory : <%=pathDir%></label><br></br>


<table style="width:100%; table-layout:fixed">
<tbody>
     <tr>
        <th>Filename</th>
        <th>Location</th>
        <th>Date created</th>
     </tr>
     
<%
for (int i =0; i < listNames.size(); i++)
{
	
	results++;
%>   
     
<tr>
<td> <%=listNames.get(i).getName()%> </td>
<td> <%=listNames.get(i).getAbsolutePath()%> </td>
<td> <%=dateFormat.format(listNames.get(i).lastModified())%> </td>
</tr>

<%       
}

for (int i =0; i < byExt.size(); i++)
{
	results++;
%>   
     
<tr>
<td> <%=byExt.get(i).getName()%> </td>
<td> <%=byExt.get(i).getAbsolutePath()%> </td>
<td> <%=dateFormat.format(byExt.get(i).lastModified())%> </td>
</tr>

<%       
}
for (int i =0; i < bySize.size(); i++)
{
	results++;
%>   
     
<tr>
<td> <%=bySize.get(i).getName()%> </td>
<td> <%=bySize.get(i).getAbsolutePath()%> </td>
<td> <%=dateFormat.format(bySize.get(i).lastModified())%> </td>
</tr>

<%       
}
}else{
	//throw new ServletException("Path does not exist");
	out.println("Path does not exist");
}
%>

</tbody>
</table><br>


<label >Number of files returned : <%=results%></label><br></br>
<input type="submit" value="Back" onclick="goBack()"> <br/><br/> 


</body>
</html>