<?php 

require_once "../../util/get_cur_user_info.php";

if(in_array("Admin", $_SESSION["userTypes"]) || in_array("Teacher", $_SESSION["userTypes"]))
{
    $page = "category";
    $title = "EWU APE Categories";
    $tableTitle = "Categories";
    //Strings in $modalsArr are the modal HTML file names minus "_modal.html" E.g. "roster_modal.html" -> "roster"
    $modalsArr = array("category");
    $modalTitles = array("Category");
    //Strings in $jsArr are the JS file names minus "_script.js" E.g. "exam_student_script.js" -> "exam_student"
    $jsArr = array("category");
    require_once "../index.php";
}
else 
{
    require_once "../includes/error_handler.php";
    loadErrorPage("401");
    die();
}

?>
