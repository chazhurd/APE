<?php

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
     * TODO
     * Need to change this to use fucntion
     * pointers instead to get rid of this nasty
     * switch logic
     */
    switch (count($_SESSION["userTypes"]))
    {
        case 0:
            break;
        case 1: switch ($_SESSION["userTypes"][0])
                {
                    case "Admin": adminType(); break;
                    case "Teacher": teacherType(); break;
                    case "Grader": graderType(); break;
                    case "Student": studentType(); break;
                }
                break;

        case 2:
                if(in_array("Admin", $_SESSION["userTypes"]) && in_array("Teacher", $_SESSION["userTypes"]))
                {
                    adminType();
                    teacherType();
                }
            
                if(in_array("Admin", $_SESSION["userTypes"]) && in_array("Grader", $_SESSION["userTypes"]))
                {
                    adminType();
                    graderType();
                }

                if(in_array("Teacher", $_SESSION["userTypes"]) && in_array("Grader", $_SESSION["userTypes"]))
                {
                    teacherType();
                    graderType();
                }
                break;

        case 3: 
                adminType();
                teacherType();
                graderType();
                break;
    }


    function adminType()
    {
        global $page;
        echo '<p class="list-group-item user-cat"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>Admin</p>
        <div class="list-group">
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'admin_home') ? ' active':'') . '" href="/ape/view/home/?page=admin_home"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>Dashboard</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'admin_exam') ? ' active':'') . '" href="/ape/view/exam/?page=admin_exam"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>Exams</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'admin_user') ? ' active':'') . '" href="/ape/view/user/?page=admin_user"><span class="glyphicon glyphicon-user" aria-hidden="true"></span>Users</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($page, 'category') ? ' active':'') . '" href="/ape/view/category/"><span class="glyphicon glyphicon-list" aria-hidden="true"></span>Categories</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($page, 'location') ? ' active':'') . '" href="/ape/view/location/"><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>Locations</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'homepage_editor') ? ' active':'') . '" href="/ape/view/home/?page=homepage_editor"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>Homepage Editor</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($page, 'settings') ? ' active':'') . '" href="/ape/view/settings/"><span class="glyphicon glyphicon-cog" aria-hidden="true"></span>Configurations</a>
        </div>';
    }

    function teacherType()
    {
        global $page;
        echo '<p class="list-group-item user-cat"><span class="glyphicon glyphicon-apple" aria-hidden="true"></span>Teacher</p>
        <div class="list-group">
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'teacher_home') ? ' active':'') . '" href="/ape/view/home/?page=teacher_home"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>Dashboard</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'teacher_exam') ? ' active':'') . '" href="/ape/view/exam/?page=teacher_exam"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>In-class Exams</a>
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'teacher_user') ? ' active':'') . '" href="/ape/view/user/?page=teacher_user"><span class="glyphicon glyphicon-education" aria-hidden="true"></span>Students</a>
        </div>';
    }

    function graderType()
    {
        global $page;
        echo '<p class="list-group-item user-cat"><span class="glyphicon glyphicon-briefcase" aria-hidden="true"></span>Grader</p>
        <div class="list-group">
            <a class="list-group-item' . (isset($_GET["page"]) && strstr($_GET["page"], 'grader_home') ? ' active':'') . '" href="/ape/view/home/?page=grader_home"><span class="glyphicon glyphicon-dashboard" aria-hidden="true"></span>Dashboard</a>
            <a class="list-group-item' . (!isset($_GET["page"]) && strstr($page, 'grade') ? ' active':'') . '" href="/ape/view/grade/"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span>Grading</a>
        </div>';
    }

    function studentType()
    {
        global $page;
        echo '<a class="list-group-item' . (strstr($page, 'home') ? ' active':'') . '" href="/ape/view/home/?page=student_home"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a>
        <a class="list-group-item' . (strstr($page, 'exam') ? ' active':'') . '" href="/ape/view/exam/?page=student_exam"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>My Exams</a>';
    }

    
?>
