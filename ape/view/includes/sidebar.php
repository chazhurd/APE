<?php
session_start();

    $_GET["is_client"] = False;
    require_once $_SERVER['DOCUMENT_ROOT'] . DIRECTORY_SEPARATOR . $projectDirName . DIRECTORY_SEPARATOR . "util" . DIRECTORY_SEPARATOR . "get_cur_user_info.php";

    echo '<a href="https://www.ewu.edu" class="list-group-item">
            <img src="img/horizontal-logo-transparent-150x50.png" class="img-responsive" alt="EWU Logo">
        </a>
        
        <div class="list-group-item user-wrapper">
            <div class="user">
                <h5>Welcome</h5>
                <h4>'. $_SESSION['userInfo']["userFname"] . ' ' . $_SESSION['userInfo']["userLname"] . '</h4>
            </div>
        </div>';

    /*
     *
     * Functions to echo the sidebar html:
     *
     */

    function adminType()
    {
        echo '<p class="list-group-item user-cat"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>Admin</p>
        <div class="list-group">
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'admin_home') ? ' active':'') . '" href="/ape/view/home/?page=admin_home"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>Dashboard</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'admin_exam') ? ' active':'') . '" href="/ape/view/exam/?page=admin_exam"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>Exams</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'admin_user') ? ' active':'') . '" href="/ape/view/user/?page=admin_user"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Users</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($_SESSION['page'], 'category') ? ' active':'') . '" href="/ape/view/category/"><span class="glyphicon glyphicon-list" aria-hidden="true"></span>Categories</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($_SESSION['page'], 'location') ? ' active':'') . '" href="/ape/view/location/"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Locations</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'homepage_editor') ? ' active':'') . '" href="/ape/view/home/?page=homepage_editor"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>Homepage Editor</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($_SESSION['page'], 'settings') ? ' active':'') . '" href="/ape/view/settings/"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>Configurations</a>
        </div>';
    }

    function teacherType()
    {
        echo '<p class="list-group-item user-cat"><span class="glyphicon glyphicon-apple" aria-hidden="true"></span>Teacher</p>
        <div class="list-group">
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'teacher_home') ? ' active':'') . '" href="/ape/view/home/?page=teacher_home"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>Dashboard</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'teacher_exam') ? ' active':'') . '" href="/ape/view/exam/?page=teacher_exam"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>In-class Exams</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'teacher_user') ? ' active':'') . '" href="/ape/view/user/?page=teacher_user"><span class="glyphicon glyphicon-education" aria-hidden="true"></span>Students</a>
        </div>';
    }

    function graderType()
    {
        echo '<p class="list-group-item user-cat"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>Grader</p>
        <div class="list-group">
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'grader_home') ? ' active':'') . '" href="/ape/view/home/?page=grader_home"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>Dashboard</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($_SESSION['page'], 'grade') ? ' active':'') . '" href="/ape/view/grade/"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span>Grading</a>
        </div>';
    }

    function studentType()
    {
        echo '<a class="list-group-item' . (strstr($_SESSION['page'], 'home') ? ' active':'') . '" href="/ape/view/home/?page=student_home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a>
        <a class="list-group-item' . (strstr($_SESSION['page'], 'exam') ? ' active':'') . '" href="/ape/view/exam/?page=student_exam"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>My Exams</a>';
    }

    /*
     *
     * --------------------------------------------
     *
     */

    $typeMapping = array(
        'Admin' => 'adminType',
        "Teacher" => 'teacherType',
        "Grader" => 'graderType',
        "Student" => 'studentType',
    );

    /*
     * For each type that applies to the user,
     * call the corresponding function that applies to
     * the given type, as defined in the type mapping.
     *
     * eg. 'Admin' => 'adminType' => adminType();
     * 
     * for each of the user's types.
     */
    for ($i=0; $i<count($_SESSION['userTypes']); $i += 1)
    {
        call_user_func($typeMapping[$_SESSION['userTypes'][$i]]);
    }
    
?>
