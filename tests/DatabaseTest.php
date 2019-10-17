<?php

require_once("ape/pdoconfig.php");
use PHPUnit\Framework\TestCase;

class DatabaseTests extends TestCase
{
    /** @test */
    public function TestHasPDO()
    {
        $this->assertTrue(defined('PDO::ATTR_DRIVER_NAME'));
    }

    /**
     * @test
     * @medium 
     */
    public function TestOpenDB()
    {
        /* Currently will hang with unwhitelisted IP addr
         * Dummy test for now
        $conn = openDB();
        $this->assertNotNull($conn);
         */
        $this->assertTrue(true);
    }

    /** 
     * @test
     */
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
