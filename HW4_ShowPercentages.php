<head><title>Percentages</title></head>
<body>
<?php

	//open a connection to dbase server 
	include 'open.php';

	// collect the posted value in a variable called $item
	$item = $_POST['SID'];

	// echo some basic header info onto the page
	echo "<h2>Student ID Percentages</h2><br>";
	echo "SID: ";
	echo $item;
	echo "<br><br>";

	/* check validity of input */
	
	// proceed with query only if supplied SID is non-empty
	if (empty($item)) {
		echo "Empty input. Please try again.<br>";
	} else {
		$q = "select * from HW4_Student where SID = '".$item."'";
		$res = $conn->query($q);

		// call the stored procedure we already defined on dbase
		if (is_null(mysqli_fetch_row($res))) {
			echo "ERROR: SID ";
			echo $item;
			echo " not found<br>";

		} else {
			if ($result = $conn->query("CALL ShowPercentages('".$item."');")) {
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
			}
		}	
	}

   // close the connection opened by open.php
   $conn->close();
?>
</body>