Profile: TestPlanBundle
Parent: Bundle
Id: testplan-bundle
Title: "Test Plan Bundle"
Description: "A Transaction Bundle for Test Plans and their content."

* type = #transaction
//* entry[0].resource only TestPlan
//* entry[1..*].resource only Binary

// Define slicing on entry
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open
* entry ^short = "Entry resource in the patient summary bundle"

* entry contains testPlan 1..* and binaryResources 0..*

// Constraints on the TestPlan entry
* entry[testPlan].resource only TestPlan
* entry[testPlan].resource.title 1..
* entry[testPlan].resource.status MS

// Constraints on the Binary entry
* entry[binaryResources].resource only Binary
* entry[binaryResources].resource.contentType MS
* entry[binaryResources].resource.data MS