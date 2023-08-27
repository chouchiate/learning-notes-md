## [unity] - Quick Reference

* Test cases belong to a group are put in the same file
* GroupNameTest.c is typical naming style;
*ie, LightControllerTest.c for LightController module

---
### Elements of a TEST_GROUP
```c
// this is a test skeleton
#include "unity_fixture.h"
// inclues for module under test
TEST_GROUP(GroupName);
// Define file scope data accessible to test group members prior TEST_SETUP

// initialization steps are executed before each TEST
TEST_SETUP(GroupName)
{
    ...
}

// clean up steps are executed after each TEST
TEST_TEAR_DOWN(GroupName)
{
    ...
}

/**
 *
 */
TEST(GroupName, UniqueTestName)
{
    ...
}
```