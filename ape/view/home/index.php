<?php 

    use \Firebase\JWT\JWT;

    if(session_status() === PHP_SESSION_NONE) session_start();
    
    $_GET["is_client"] = False;
    require_once "../../util/get_cur_user_info.php";
    include_once __DIR__ . '/../../../vendor/autoload.php';
    use League\OAuth2\Client\Provider\Google;
    $page = "";
    $jsArr = array();
    $title = "EWU APE Home";
    $_SESSION['userTypes'] = array();
    $key = <<<MLS
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuS6GkOtm9kmk1flSzjVP
TPD81eI8oXtsCNwEudbFr1PCGHZu6m2J2PQ6/hK0XCX3mXXrqqY6g2JuW2nf6Foo
w+1CDVZL4FBBKIeZDfSkkMb3olTGN4WRerUB3j4ATbFFLg3SgmRsCliVuulbvAn8
ETaWuIEPEPNQ/730PXP5zHFCUDIR6E03wWooc9YqjBKYreSFQPiuYF4/XgMGfWpF
FIeWqTbcbl5MS0T0VdPQOWcj+4vnnRiGlwVa5QJvqSR1kh+O2wdqcBisRjpcpsUc
lyJJrDiSP1PNtdKhKySRNIUC60uZST71LTTvI2gbSHofp/zrQGGNnG0tV47X6QbM
WwIDAQAB
-----END PUBLIC KEY-----
MLS;

    if (!$_SESSION['loggedIn'])
    {
        if (isset($_GET["code"]))
        {
            $authCode = $_GET["code"];

            $client = new Google_Client(['client_id' => '357634610842-mb2qf2ngkh6ifp519kchkhug7l9pa2a7.apps.googleusercontent.com']);
            $provider = new Google([
                'clientSecret' => '8D9r4JqcURJNYS_HukECvia4',
                'clientId' => '357634610842-mb2qf2ngkh6ifp519kchkhug7l9pa2a7.apps.googleusercontent.com',
                'redirectUri'  => 'http://localhost:8080/ape/view/home',
            ]);
            $token = $provider->getAccessToken('authorization_code', [
                'code' => $_GET['code']
            ]);
            try
            {
                $ownerDetails = $provider->getResourceOwner($token);
                $jwt = $token->getValues()['id_token'];
                $jwt_arr = explode(".", $jwt);
                $alg = base64_decode($jwt_arr[0]);
                $jwt_arr[0] = json_decode(base64_decode($jwt_arr[0]), true);
                $jwt_arr[1] = json_decode(base64_decode($jwt_arr[1]), true);
                $_SESSION["userInfo"] = $jwt_arr[1];
                sessionSetup();
            }
            catch (Exception $e)
            {
                exit('Something went wrong: ' . $e->getMessage());
            }
        }
        else
        {
            $page = "student_home";
            require_once "../index.php";
        }
    }

    /*
     * userTypes is an array of all the types that apply to
     * the given student. Thus several different aspects of the web
     * page may render depending on the combination of types
     * that apply to the given user
     */
    if (in_array("Admin", $_SESSION["userTypes"]))
    {
        if(in_array("Admin", $_SESSION["userTypes"]) || in_array("Teacher", $_SESSION["userTypes"]))
        {
            if($_GET["page"] == "grader_home")
            {
                $page = "grader_home";
                require_once "../index.php";
            }
            else if($_GET["page"] == "homepage_editor")
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
                $jsArr = array(
                    "../exam/exam_modal",
                    "../exam/exam_detail",
                    "../exam/exam_report",
                    "../exam/exam_roster"
                );
                require_once "../index.php";
            } 
        }
        else if(in_array("Grader", $_SESSION["userTypes"]))
        {
            $page = "grader_home";
            require_once "../index.php";
        }
        else if(in_array("Student", $_SESSION["userTypes"]))
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
            $jsArr = array(
                "../exam/exam_modal", 
                "../exam/exam_detail", 
                "../exam/exam_report", 
                "../exam/exam_roster"
            );
            require_once "../index.php";
        } 
    }
    else if(in_array("Grader", $_SESSION["userTypes"]))
    {
        $page = "grader_home";
        require_once "../index.php";
    }
    else if(in_array("Student", $_SESSION["userTypes"]))
    {
        $page = "student_home";
        $modalsArr = array("student_home");
        require_once "../index.php";
    }

    
?>

