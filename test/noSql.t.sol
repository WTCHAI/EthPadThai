// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import { Test, console } from "forge-std/Test.sol";
import { Nosql } from '../src/nosql.sol';


contract NoSqlTest is Test {
    Nosql nosql;

    function setUp() public {
        nosql = new Nosql();
        nosql.addDocument("personal_details", "name", 0, "chai");
        nosql.addDocument("personal_details", "age", 0, "20");
        nosql.addDocument("personal_details", "status", 0, "married");
        nosql.addDocument("Education", "SKN", 0, "from 1 - 6 GPA 3.5");
        nosql.addDocument("Education", "Kasetsart", 0, "from 1 - 4 GPA 3.00");
        //init nosql
        nosql.logsAllDocument();
    }


    function test_Increment() public {
        nosql.addDocument("personal_details", "name", 0, "chai");
        nosql.addDocument("personal_details", "age", 0, "20");
        nosql.addDocument("personal_details", "status", 0, "married");
        nosql.addDocument("Education", "SKN", 0, "from 1 - 6 GPA 3.5");
        nosql.addDocument("Education", "Kasetsart", 0, "from 1 - 4 GPA 3.00");
        //init nosql
        nosql.logsAllDocument();
    }

    function test_AddDocument() public {
        nosql.addDocument("work_experience", "company", 0, "100");
        nosql.logsAllDocument();
    }

    function test_UpdateDocument() public {
        nosql.addDocument("personal_details", "age", 1, "25");
        nosql.logsAllDocument();
    }
}
