<?php

function lookupUser()
{

    $stmt = "
select * from user
where user.f_name = :fn and
    user.l_name = :ln;";

    $user_info = $_SESSION["userInfo"];

    $user = sqlExecute($stmt, array(
            ':ln' => $user_info['given_name'],
            ':fn' => $user_info['family_name']
        ),
        True
    );

    // if $user["id"] is in the array of admin id's...
    $_SESSION["userInfo"]["userType"] = "Admin";

    // else 
    $_SESSION["userInfo"]["userType"] = "Student";

    // var_dump($user);
}

?>
