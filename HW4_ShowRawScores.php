<head><title>Raw Score</title></head>
<body>
<?php

	//open a connection to dbase server 
	include 'open.php';

	// collect the posted value in a variable called $item
	$item = $_POST['SID'];

	// echo some basic header info onto the page
	echo "<h2>Student ID Raw Scores</h2><br>";
	echo "SID: ";

	/* check validity of input */

	// proceed with query only if supplied SID is non-empty
	if (empty($item)) {
		echo "Empty input<br>";
	} else {
		// call the stored procedure we already defined on dbase
		$result = $conn->query("CALL ShowRawScores('".$item."');");
		
		if (mysql_num_rows($result)) {
	    	echo "<table border=\"2px solid black\">";
	    	// output a row of table headers

	    	echo "<tr>";

	    	// collect an array holding all attribute names in $result
	    	$flist = $result->fetch_fields();

	    	// output the name of each attribute in flist
	    	foreach($flist as $fname) {
	        	echo "<td>".$fname->name."</td>";
	    	}
	    	echo "</tr>";

        	// output a row of table for each row in result, using flist names
        	// to obtain the appropriate attribute value for each column
	      	foreach($result as $row) {

            	// reset the attribute names array
    	    	$flist = $result->fetch_fields(); 
	        	echo "<tr>";
	        	foreach ($flist as $fname) {
                      echo "<td>".$row[$fname->name]."</td>";
            	}
  	        	echo "</tr>";
	    	}
	    	echo "</table>";
		} else {
			echo "SID: ";
			echo $item;
			echo "<br><br>";
		}
	}

   // close the connection opened by open.php
   $conn->close();
?>
</body>