package controller;

import java.io.File;
import java.util.ArrayList;


import org.apache.commons.io.FilenameUtils;


public class FilesInDirectoryController {
  
public  ArrayList<File>  searchMatchCase(File file[],   String filename, ArrayList<File> listNames) {
	  
	  
	
	   if(file != null) {
	   for (File splitFiles : file) {
       
		  
 	        	
 	        String parts = splitFiles.getName();
 	      
           if(filename.equals(FilenameUtils.removeExtension(parts))) {
	         listNames.add(splitFiles); 
	        
   }
        // recursion 
        searchMatchCase(splitFiles.listFiles(), filename, listNames);
	   }
	  
	   }
	return listNames;
	  
}



public  ArrayList<File>  searchIgnoreCase(File file[],   String filename, ArrayList<File> listNames) {

	  
	   if(file != null) {
	   for (File splitFiles : file) {
 	        	
 	        String parts = splitFiles.getName();
 	      
           if(filename.equalsIgnoreCase(FilenameUtils.removeExtension(parts))) {
	           listNames.add(splitFiles);
		}
        // recursion 
		   searchIgnoreCase(splitFiles.listFiles(), filename, listNames);
	   }
	
	   }
	return listNames;
	  
}


public ArrayList<File> searchBySize(File file[],   int size, ArrayList<File> listFiles) {
	   
	   
	  
	
		   if(file != null) {
		   for (File files : file) {
	       
	           if(files.length() / 1024  == size) {
	        	   listFiles.add(files);
	 	       
	 	        }
	           
	           // recursion 
	           searchBySize(files.listFiles(), size, listFiles);
		   }
		  
		   }
		return listFiles;
			
	   }


public  ArrayList<File>searchFiles(File file[],  String[] extension,  ArrayList<File> listExtension)  {


	  
	   if(file != null) {
	   for (File splitFiles : file) {
       
		   
     

      
	        	
	        String parts = splitFiles.getName();
	        	
	          for(String ext: extension) {
	        	   if(parts.endsWith(ext)) {
	        	  listExtension.add(splitFiles);
	        	  
	        	 }
	          }
     searchFiles(splitFiles.listFiles(), extension, listExtension);
	  }
	   
	   }
	return listExtension;
}


}
