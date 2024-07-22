For authoring test cases for interoperability supporting FHIR, a dialect of Gherkin is used. This consists of a few key aspects
* **Executable** - the scripts SHALL have a defined grammar that allows them to be parsed and executed (or converted to an executable format)
* Supporting **interoperability actors** in data exchange - instead of / in addition to e.g. "When GET" (which has no initiator and target) the language should support expressions like "When ActorA issues a GET from ActorB"
* FHIR-specific functions
  * FHIRPATH(expression) evaluation for evaluating expression values
  * Validate(profile) for assessing whether a resource is compatible with a profile

Systems supporting this specification should be able to parse this language and create executable test cases and provide reports.


**Language structure:**

`{this is optional}`  
`<this_is_parameter_or_variable>`  
**Keyword** is in **bold**  
*Function* is in *italic*

```plaintext
{Given
# Definitions 
# e.g. ActorB = http://localhost:8080/fhir 
{maybe a call for any function, so out of scope for a first draft} 
}
WHEN
<Actor> issues a <method> request to {<Actor>}{/<path>}
<Actor> issues a <method> request to <endpoint>{/<type>}{/<id>}{$<operation>}{?&<parameters>}
AND content is
<file> / <inline JSON>
update({content,}attribute, value)
THEN
response.code == <a_code>
{response.content.}<jsonpathexpression> == {response.content.}jsonpathexpression
{response.content.}fhirpath(<expression>) == {response.content.}fhirpath(<expression>)
response.content.validate(<profile>)

```

### Minimal example

```plaintext
* Def ServerUrl = localhost:8080/fhir” # Define a variable

WHEN system issues a POST request to FHIRServer # in this case, ‘system’ can be a reserved word to mean the test platform: this line will be executed by the test bed.
AND content is in “./file1.json”
THEN response.code == 200

* DEF patientId = response.content.id # simply JSONpath evaluation
* DEF IPSPatientCanonical =  “https://hl7.org/fhir/uv/ips/StructureDefinition-Patient-uv-ips.html”

WHEN ActorA issues a GET request to FHIRServer/Patient/{patientId}
THEN response.code == 200
AND response.content.resourceType == “Patient” 
AND response.content.validate(IPSPatientCanonical).error == 0 # custom function calling
```