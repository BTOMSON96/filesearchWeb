<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>File Search</title>

<script>


function validateForm() {
  let directory = document.forms["search"]["directory"].value;
  
  if (directory == "") {
    alert("Directory must be filled out");
    return false;
  }

  let filename = document.forms["search"]["filename"].value;
  let ext = document.forms["search"]["extensions"].value;
  let size = document.forms["search"]["filesize"].value;
  
  if(filename =="" && ext =="" && size == ""){
		 alert("No option selected");
		  return false;
		 }
}



//alert when size is a negative number
function negativeNumber(){
let size = document.forms["search"]["filesize"].value;
 if(size <= 0){
	  alert("file size cannot be less than or equal to 0");
	  return false;
	  }
}

//disable extension and size option 
function disableExt() {
	  document.getElementById("extensions").setAttribute("disabled", "disabled")
	  document.getElementById("filesize").setAttribute("disabled", "disabled")
	}

//disable file name and size
function disableFname(){

	 document.getElementById("filename").setAttribute("disabled", "disabled")
	 document.getElementById("filesize").setAttribute("disabled", "disabled")
}

//disable ext and filename
function disableExtName(){
	 document.getElementById("filename").setAttribute("disabled", "disabled")
	 document.getElementById("extensions").setAttribute("disabled", "disabled")
}


	

</script>


  <style>
  
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
 
 /*
 input[type=text] {
  border: 2px solid red;
  border-radius: 4px;
}
*/

/* Style the header */
.header {
   background-color: lightblue;
  padding: 20px;
  text-align: center;
}
  </style>
</head>
<body >

<div class="header">
  <h3>File Search</h3> 
</div> <br>



<form name="search" action="FileSearch.jsp" onsubmit="return validateForm()">
<label for="edirectory">Enter Directory:</label>
<input type="text" name="directory" size="50" /><br/><br/> 



<label for="ffilename">Enter File name:</label>
<input type="text" name="filename" id="filename" oninput="disableExt()"/><br/>
<select  name="match/ignorecase" id="match/ignorecase" >
  <option value="matchcase">MatchCase</option>
  <option value="ignorecase">IgnoreCase</option>
</select><br/><br/> 

<label for="addExt">Choose file extension:</label><br>
<select multiple name="extensions" id="extensions" oninput="disableFname()">
  <option value="pdf">Pdf</option>
  <option value="jpg">Jpg</option>
  <option value="docx">Docx</option>
  <option value="bat">bat</option>
</select><br/><br/> 

<label for="filesize">Enter File size (kb):</label>
<input type="number" id="filesize" name="filesize" oninput="disableExtName()" onblur="negativeNumber()"><br/><br/> 

<input type="submit" value="Submit" > <br/><br/> 



</form>


</body>
</html>