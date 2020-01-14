<?php
/**
 * Get the current settings
 * @author: Andrew Robinson
 * @version: 1.0
 */
    require_once "../auth/user_auth.php";
    require_once "../util/input_validate.php";
    require_once "./init_settings.php";
    
    /*
    if(empty($_GET["requester_id"]) || empty($_GET["requester_type"])){
		http_response_code(400);
        die("Incomplete input.");
	}
     */

	$requesterId = $_SESSION['userInfo']['userId'];     // $_GET["requester_id"];
    $requesterType = $_SESSION['userTypes'][0];   // $_GET["requester_type"];
    // $requesterSessionId = $_GET["requester_session_id"];
    $allowedType = array("Admin", "Teacher", "Grader", "Student");

	//User authentication
    // user_auth($requesterId, $requesterType, $allowedType);

    //if the global settings array has not been initialized yet, do so
    if(!isset($GLOBALS["settings"]))
        initializeSettings();

    echo json_encode($GLOBALS["settings"]);
?>
