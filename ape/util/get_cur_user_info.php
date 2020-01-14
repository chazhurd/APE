<?php
/**
 * Function that returns an array of current user information, includings:
 * - userId
 * - userType
 * - userSession
 * - userFname
 * - userLname
 * - userEmail
 * @author: Tu Nguyen
 * @version: 1.0
 */

    require_once 'sql_exe.php';

    if(isset($_GET["is_client"]))
    {
        $isClient = $_GET["is_client"];
        getCurUserInfo($isClient);
    }

    function getCurUserInfo($isClient)
    {

        $isDev = false;
        $userInfo = array();

        if($isClient)
        {
            echo json_encode($userInfo);
        }
        else {
            return $userInfo;
        }
        
    }

    function sessionSetup()
    {
        $stmt = "select `user_id` from `user` 
            where `f_name` = ? and `l_name` = ?;";

        $user_id = sqlExecute($stmt, array(
                $_SESSION["userInfo"]['given_name'],
                $_SESSION["userInfo"]['family_name']
            ),
            True
        );

        if (count($user_id) === 0)
        {
            createUser();
        }
        else
        {
            $admin_ids = sqlExecute("select faculty_id from faculty;",
                array(), True);

            for ($i=0; $i < count($admin_ids); $i += 1)
            {
                $admin_ids[$i] = $admin_ids[$i]["faculty_ids"];
            }

            if (in_array($user_id, $admin_ids))
            {
                $_SESSION["userType"] = "Admin";
            }
            else
            {
                $_SESSION["userType"] = "Admin";
            }
        }

        $_SESSION["isLoggedIn"] = True;
    }


?>
