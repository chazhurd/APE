<?php

use PHPUnit\Framework\TestCase;

class DatabaseTests extends TestCase
{
    /** @test */
    public function TestHasPDO()
    {
        $this->assertTrue(defined('PDO::ATTR_DRIVER_NAME'));
    }

    /** @test */
    public function TestOpenDB()
    {
        $conn = openDB();
        $this->assertNotNull($conn);
    }

    /** @test */
    public function TestUserList()
    {
        $this->assertTrue(true);
    }

    /** @test */
    public function TestSaveAdminGradeInput()
    {
        $this->assertTrue(true);
    }
}

?>
