<?php
    session_start();
/**
 * Create a category
 * @author: Andrew Robinson
 * @version: 1.0
 */
	require_once "../util/sql_exe.php";
	require_once "../auth/user_auth.php";
	require_once "../util/input_validate.php";


    /*
	if(empty($_POST["requester_id"]) || empty($_POST["requester_type"]) || empty($_POST["name"])){
		http_response_code(400);
        die("Incomplete input.");
	}
     */

	$requesterId = $_POST["requester_id"];
	$requesterType = $_POST["requester_type"];
    $allowedType = array("Admin", "Teacher");
	
	$name = $_POST["name"];

	//Sanitize the input
	$name = sanitize_input($name);
	
	//User authentication
    user_auth($requesterId, $requesterType, $allowedType);
	
	$lastInsertId = sqlExecute("INSERT INTO category (name) VALUES (:name)",
				array(':name' => $name),
				false);

	echo $lastInsertId;
?>
