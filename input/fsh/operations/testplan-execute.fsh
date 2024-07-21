Alias: $m49.htm = http://unstats.un.org/unsd/methods/m49/m49.htm

Instance: TestPlanExecute
InstanceOf: OperationDefinition
Description: "Test Plan $execute operation"
Usage: #definition

* name = "TestPlanExecute"
* title = "Execute Test Plan"
* status = #active
* kind = #operation
* experimental = false
* jurisdiction = $m49.htm#001 "World"
* affectsState = false

* code = #execute

* system = false
* type = false
* instance = true

* parameter[0].name = #parameters
* parameter[=].scope = #instance
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The parameters" //which one??
* parameter[=].type = #Parameters


* parameter[0].name = #input-data
* parameter[=].scope = #instance
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The input data" //which one??
* parameter[=].type = #Bundle



* parameter[0].name = #return
* parameter[=].scope = #instance
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "The output Bundle"
* parameter[=].type = #Bundle

