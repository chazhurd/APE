<?php 
    $_GET["is_client"] = False;
    require_once "../../util/get_cur_user_info.php";
    include_once __DIR__ . '/../../../vendor/autoload.php';
    use League\OAuth2\Client\Provider\Google;
    $userInfo = getCurUserInfo(False);
    $page = "";
    $jsArr = array();
    $title = "EWU APE Home";

    if (isset($_GET["code"]))
    {
        echo "<h1>Authenticated successfully<br>" . $_GET["code"] . "</h1>";
        $authCode = $_GET["code"];

        $client = new Google_Client(['client_id' => '357634610842-mb2qf2ngkh6ifp519kchkhug7l9pa2a7.apps.googleusercontent.com']);
        $provider = new Google([
            'clientSecret' => '8D9r4JqcURJNYS_HukECvia4',
            'clientId' => '357634610842-mb2qf2ngkh6ifp519kchkhug7l9pa2a7.apps.googleusercontent.com',
            'redirectUri'  => 'http://localhost:8080/ape/view/home',
        ]);
        echo "<h2>Successfully created new google client.</h2>";
        $token = $provider->getAccessToken('authorization_code', [
            'code' => $_GET['code']
        ]);
        try {
            $ownerDetails = $provider->getResourceOwner($token);
            printf('Hello %s!', $ownerDetails->getFirstName());

            // This is the JWT of all the real data we want.
            // We'll have to get a decoder for JWT's to get
            // at all the actual data.
            var_dump($token->getValues());
        } catch (Exception $e) {
            exit('Something went wrong: ' . $e->getMessage());
        }
    }

    if(count($userInfo) == 0)
    {
        $page = "student_home";

        require_once "../index.php";
    }
    else
    {
        if(in_array("Admin", $userInfo["userType"]) || in_array("Teacher", $userInfo["userType"]))
        {
            if(strcmp($_GET["page"],"grader_home") == 0)
            {
                $page = "grader_home";
                require_once "../index.php";
            }
            else if(strcmp($_GET["page"],"homepage_editor") == 0)
            {
                $page = "admin_home_editor";
                $modalsArr = array("admin_home_editor");
                require_once "../index.php";
            }
            else
            {
                $page = "admin_teacher_home";
                $modalTabsArr = array("../exam/exam", "../exam/roster", "../exam/report");
                $modalTabsTitles = array("Exam", "Roster", "Report");
                $modalSize = "large";
                $jsArr = array("../exam/exam_modal", "../exam/exam_detail", "../exam/exam_report", "../exam/exam_roster");
                require_once "../index.php";
            } 
        }
        else if(in_array("Grader", $userInfo["userType"]))
        {
            $page = "grader_home";
            require_once "../index.php";
        }
        else if(in_array("Student", $userInfo["userType"]))
        {
            $page = "student_home";
            $modalsArr = array("student_home");
            require_once "../index.php";
        }
    
    }

    
    

    
?>

