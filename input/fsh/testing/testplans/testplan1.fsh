Instance: testplan1
InstanceOf: TestPlan
Usage: #example
Description: "Example Gherkin test plan - testing Measure evaluation and Summary."

* status = #active
* title = "Gherkin test plan"

* text.status = #empty
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">No text</div>"

//* scope[+] = Reference(SmartHealthLink)

* testCase[+]
  * sequence = 1
//  * key = "tc1"
  * testRun[+]
    * narrative = """ **Test Measure**
    * Populate the server with some data and a Measure
    * call the $eval operation
    * Use JSONpath to check that the measure evaluates correctly
"""
    * script
      * language = #gherkin
      * sourceReference = Reference(ig-loader-measure.feature)
//      * sourceReference.reference = "#ghript-measure"
//      * sourceReference.type = #Binary

* testCase[+]
  * sequence = 2
  * testRun[+]
    * narrative = """ **Test Summary**
    * Populate the server with some data
    * call the $summary operation
    * check that the summary is generated
    * check that the summary was not persisted
"""

    * script
      * language = #gherkin
      * sourceReference = Reference(ig-loader-summary.feature)



Instance: ig-loader-measure.feature
InstanceOf: Binary
Usage: #example
Title: "Gherkin script - Measure"
Description: "Gherkin script for Measure testing - using Binary loader."
* contentType = #text/x-gherkin
* data = "ig-loader-measure.feature"


Instance: ig-loader-summary.feature
InstanceOf: Binary
Usage: #example
Title: "Gherkin script - Summary"
Description: "Gherkin script for Summary testing - using Binary loader."
* contentType = #text/x-gherkin
* data = "ig-loader-summary.feature"


