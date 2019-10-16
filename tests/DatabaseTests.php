<?php

use PHPUnit\Framework\TestCase;
require_once "./ape/util/sql_exe.php";

class DatabaseTests extends TestCase
{
    /** @test */
    public function TestOpenDB()
    {
        $this->assertTrue(true);
    }
}

?>
