This Implementation Guide presents the artifacts and data exchange used in testing of FHIR specifications.

The basis for this approach is (not excluively):


## Authoring
* Test Authoring is done with FHIR IG Publisher
* Tests are defined with a [Gherkin](gherkin.html) dialect reference in a TestPlan
  * Gherkin scripts are authored as (reusable) text files
  * Gherkin scripts can be used in different TestPlans 
  * The publishing tool creates a Test Plan Bundle, containing
    * Test Plan
    * Gherkin scripts
    * Necessary test data 
  * TestPlan indicates which artifact/feature/capability it covers
 

## Registration
* Test [Registration](registration.html) consists of selecting the features/capabilities to test, from which the TestPlans can be obtained.
* Test Registration may include providing parameters e.g. server URL...

## Execution
* Test [Execution](execution.html) can be initiated pointing to:
  * TestPlan to execute
  * Test data and config to execute
  * Test fixtures needed
* Test Execution uses a TestPlan `$execution` operation


## Reporting
* Test [reporting](reporting.html) is done with a TestPlan(??) resource 
* The Test Report reports back:
  * The results of the execution
  * Any self-declarations by the vendor 
  * Attestation by a test monitor
