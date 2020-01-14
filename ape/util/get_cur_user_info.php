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

    if (isset($_GET['is_client']))
    {
        if ($_GET['is_client'] == true)
        {
            echo json_encode($_SESSION);
        }
        else
        {
            return $_SESSION;
        }
    }

    function createUser()
    {
        echo "<h2> Given user not found. No current system in place 
            to add a user </h2>";
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

        if (count($user_id) == 0)
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
                $_SESSION["userTypes"] = array("Admin");
            }
            else
            {
                $_SESSION["userTypes"] = array("Admin");
            }
        }

        $_SESSION["userInfo"]['userFname'] =  $_SESSION["userInfo"]['family_name'];
        $_SESSION["userInfo"]['userLname'] = $_SESSION["userInfo"]['given_name'];
        $_SESSION["isLoggedIn"] = True;
    }


?>
