Instance: testplan0
InstanceOf: TestPlan
Usage: #example
Description: "Example Gherkin test plan - simple JSON testing."

* status = #active
* title = "Gherkin test plan"

//* text.status = #empty
//* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No text</div>"

* contained[0] = ig-loader-simple.feature

* testCase[+]
  * sequence = 1
//  * key = "tc1"
  * testRun[+]
    * narrative = """ **Simple JSON test**
    * Check if the test processor is working correctly
"""
    * script
      * language = #gherkin
      * sourceReference.reference = "#ig-loader-simple.feature"


Instance: ig-loader-simple.feature
InstanceOf: Binary
Usage: #example
Title: "Gherkin script - Simple"
Description: "Gherkin script for Simple testing - using Binary loader."
* contentType = #text/x-gherkin
* data = "ig-loader-simple.feature"


