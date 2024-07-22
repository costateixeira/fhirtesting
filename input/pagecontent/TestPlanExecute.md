This section corresponds to transaction [] of the IHE Technical Framework. Transaction [] is used by the Test Plan Author and Test Plan Consumer actors.

### X:Y.Z.1 Scope

The Execute Test Plan [] transaction triggers the execution of a Test Plan.

### X:Y.Z.2 Actors Roles

**Table X:Y.Z.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Test Initiator](transactions.html#test-initiator)    | Requests Test Run |
| [Test Plan Consumer](transactions.html#test-plan-consumer) | Execute Test and report |
{:.table-bordered}

### X:Y.Z.3 Referenced Standards

**FHIR-R5** [HL7 FHIR Release 5.0](http://www.hl7.org/FHIR/R5)

### X:Y.Z.4 Messages

<figure>
{% include test-2.svg %}
</figure>


**Figure X:Y.Z.4-1: TestPlan Execute Interactions**

#### X:Y.Z.4.1 TestPlan Execute Message
The Test Initiator invokes the TestPlan/$execute operation using HTTP POST method to the /TestPlan/<testplan-id> endpoint.

##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the Test Initiator wishes to initiate a test execution. 

##### X:Y.Z.4.1.2 Message Semantics

The content type of the payload shall be either `application/fhir+json` or `application/fhir+xml`.

###### X:Y.Z.4.1.2.1 Resource content

* The test plan execute is an invocation of an Operation.
The semantics of the request and data elements are captured in the [Supply Request Data Model](StructureDefinition-Test Plan BundleModel.html) and the technical constraints in the [Supply Request](StructureDefinition-Test Plan Bundle.html) profile.

Notes
* RequestID
* The items to be ordered are expressed as the product code. When details about the product need to be expressed in a structured manner, the `parameter` element should be used. A reference to a resource can also be used (Medication, Device, etc.). In that case, the resource can be contained in the request. See [References](https://hl7.org/fhir/R5/references.html#contained) about contained resources.


##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the Supply Request, the Supply Request Filler is expected to have all the information required to respond - approve, forward, or otherwise act upon the request.
The Supply Request Filler shall issue a response confirming the request has been accepted (created), or informing of any error. 









#### X:Y.Z.4.2 Supply Request Response
The Supply Request Filler always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the Test Initiator with the ackowledgement of the request including any technical issues.
The response shall immediately follow the request.
In case any delayed validation of the order is expected, such validation shall not impede the immediate response to a Supply Request. Such delayed information can be conveyed as a Supply Request Status which is covered by the [[PHARM-S2]](PHARM-S2.html) transaction.


##### X:Y.Z.4.1.2 Message Semantics

The response to a Supply Request shall consist of:
* In case the request is accepted, the response shall have the response code `201 (Created)`
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/R5/http.html) for information on error handling)


###### X:Y.Z.4.1.2.1 Resource content

* When the request is accepted (regardless of whether it may be acted upon), the response shall contain the resource that has been created from the request, including the id, version, etc. as assigned by the server. This allows the Test Initiator to confirm what has been accepted and track the request on that server by its internal `id`.
* In case of error, the response SHALL contain an OperationOutcome providing more information about the issue.

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the response to the Supply Request, the Test Initiator can persist the information provided by the Supply Request Filler (status, id, etc.) for future tracking, and can trigger a response to any issues, if they exist.