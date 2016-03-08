<?php
//	Copyright 2006 Google, Inc.
//	

/*
This is an example external provider in php script that looks up a directory listing
Input: multiple keywords are allowed; they should be separated by spaces
Output: an xml file as input to OneBox;
Http request Example: http://server_url/directory_ext_provider.php?query=adam%20ken
*/

//keep track of the resultCode, set default to timeout
$result_code = 'timeout';
//keep track of the total records found
$result_count = 0;
//search results are cached in buffer because we need to find out the total number of records
$result_str = "";
get_results();
echo "</OneBoxResults>";

//This is called after the search is done to display the total # of results
function print_header()
{
	global $result_count;
	header("Content-type: text/xml"); 
	$host = $_POST["host"]; 
	echo "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n"; 
	echo "<OneBoxResults xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xsi:noNamespaceSchemaLocation=\"oneboxresults.xsd\" >\n";
	if ($result_count == 0) {
		$result_code = 'lookupFailure';
	} else {
		$result_code = 'success';
	}
	echo "<resultCode>$result_code</resultCode>\n";
	echo "<provider>MyG Onebox Data Provider</provider>\n";

}

function print_line($line)
{
		
	global $result_str;
	$result_str .= "<MODULE_RESULT>\n";
	$field = strtok($line, ",");
	$index = 0;
	//parse directory entries; entry fields are separated by comma
	while ($field != false)
	{
		$fields[$index] = $field;
		$index += 1;
		$field = strtok(",");
		//encode in html to avoid mixing with xml tags
		$field = htmlspecialchars($field);
	}
	$result_str .= "<Field name=\"display\">$fields[0]</Field>\n";
	$result_str .= "<Field name=\"firstname\">$fields[1]</Field>\n";
	$result_str .= "<Field name=\"lastname\">$fields[2]</Field>\n";
	$result_str .= "<Field name=\"phone\">$fields[3]</Field>\n";
	$result_str .= "<Field name=\"email\">$fields[4]</Field>\n";
	$result_str .= "</MODULE_RESULT>\n";
}


function get_results()
{

		/*	-----------------MODS MYG_________________
				This mod of the exaple allows a simple SQL search in a database and Parses the result with the XML
				required style; using the method below:
					$line1 is a string composed by the results of the SQL query, 
					$query is the string to be searched coming from the URL and eventually from the GSA
				Once the string is formed its passed to the print_line() method in order to be parsed to the format needed
		*/



	global $result_code;
	global $result_count;
	global $result_str;
	$query = $_REQUEST['query'];

	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "oneboxDB";


	if ($query == "")
		return;
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);
	// Check connection
	if ($conn->connect_error) {
	    die("Connection failed: " . $conn->connect_error);
	} 

	$sql = "				SELECT *
							From userList
							WHERE (display LIKE '%".$query."%' OR
							firstname LIKE '%".$query."%' OR
							lastname LIKE  '%".$query."%' OR
							email LIKE     '%".$query."%');




							" ;

							
	$result = $conn->query($sql);
	$result_count = $result->num_rows;
//echo $result;
if ($result->num_rows > 0) {
	    // output data of each row
	    while($row = $result->fetch_assoc()) {
	    	$line1= $row['display'].", ".$row['firstname'].", ".$row['lastname'].", ".$row['phone'].", ".$row['email'];
	    	print_line($line1);
	        //
	    }
	} else {
	   $line1=" ";
	   
	}




	print_header();
	echo $result_str;
	
}


?>