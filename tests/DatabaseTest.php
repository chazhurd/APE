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
        $this->markTestIncomplete();
        $conn = openDB();
        $this->assertNotNull($conn);
    }

    /**
     * @test
     * @depends TestOpenDB
     */
    public function TestTableStructure()
    {
        $this->markTestIncomplete();
        $tableNames = [
            ["category", 4],
            ["category", 4],
            ["category", 4],
            ["category", 4],
        ];
        foreach ($tableNames as $table) {
            $res = sqlExecute("select count(*) from :table;",
                        array(":table" => $table[0]),
                        true);
            $this->assertEqual($res, $table[1]);
        }
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
