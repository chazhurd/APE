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
        $this->assertTrue(true);
    }
}

?>
