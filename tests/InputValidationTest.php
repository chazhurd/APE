<?php

require_once("ape/util/input_validate.php");
use PHPUnit\Framework\TestCase;

class InputValidationTest extends TestCase
{
    /**
     * @test
     */
    public function TestSanitize()
    {
        $this->assertSame("san", sanitize_input(" san "));
        $this->assertSame("san", sanitize_input("san\n"));
        $this->assertSame("&lt;h1&gt;san&lt;/h1&gt;", sanitize_input("<h1>san</h1>"));
        $this->assertSame("", sanitize_input("\\"));
    }

    /**
     * @test
     */
    public function TestValidName()
    {
        $this->assertTrue(validate_name("abcdefghijklmnopqrstuvwxyz ,.'-"));
        
        /*
         * `check_input_format` in file ape/util/input_validate.php
         * if invalid format, function calls `die` and we can't recover from this.
         * Until new exception format is used, these tests have to remain unused.
        $this->assertFalse(validate_name("1"));
        $this->assertFalse(validate_name("~"));
        $this->assertFalse(validate_name("}"));
         */
    }
}
?>
