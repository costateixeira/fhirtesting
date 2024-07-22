Transaction [] is used by the Test Plan Author and Test Plan Consumer actors to submit a TestPlan Bundle.

### X:Y.Z.1 Scope

The Submit Test Plan [] transaction exchanges a Test Plan from the Test Plan Author and the Test Plan Consumer.

### X:Y.Z.2 Actors Roles

**Table X:Y.Z.2-1: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Test Plan Author](transactions.html#test-plan-author)    | Submits Test Plan |
| [Test Plan Consumer](transactions.html#test-plan-consumer) | Receives Test Plan |
{:.table-bordered}

### X:Y.Z.3 Referenced Standards

**FHIR-R5** [HL7 FHIR Release 5.0](http://www.hl7.org/FHIR/R5)

### X:Y.Z.4 Messages

<figure>
{% include test-1.svg %}
</figure>


**Figure X:Y.Z.4-1: Supply Request Interactions**

#### X:Y.Z.4.1 Supply Request Request Message
The Test Plan Author submits a Test Plan Bundle resource using the HTTP POST method to the / endpoint, as a FHIR transaction.

##### X:Y.Z.4.1.1 Trigger Events

This method is invoked when the Test Plan Author needs to submit one or more Test Plan Bundles to a Test Plan Consumer. 

##### X:Y.Z.4.1.2 Message Semantics

The content type of the HTTP body shall be either `application/fhir+json` or `application/fhir+xml`.

The Test Plan Bundle shall conform with the [TestPlanBundle](StructureDefinition-testplan-bundle.html) profile. 

###### X:Y.Z.4.1.2.1 Resource content

* The supply request is a FHIR transaction.


##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the Test Plan Bundle, the Test Plan Consumer is expected to persist it, versioned, in the persistence or storage layer. 
The Supply Request Filler shall issue a response confirming the request has been accepted (created), or informing of any error. 









#### X:Y.Z.4.2 Supply Request Response
The Supply Request Filler always returns a HTTP Status code appropriate to the processing outcome.

##### X:Y.Z.4.1.1 Trigger Events

This response is always expected and provides the Test Plan Author with the ackowledgement of the request including any technical issues.
The response shall immediately follow the request.
In case any delayed validation of the order is expected, such validation shall not impede the immediate response to a Supply Request. Such delayed information can be conveyed as a Supply Request Status which is covered by the [[PHARM-S2]](PHARM-S2.html) transaction.


##### X:Y.Z.4.1.2 Message Semantics

The response to a Supply Request shall consist of:
* In case the request is accepted, the response shall have the response code `201 (Created)`
* In case of any error, the response shall have the adequate error code (see [FHIR RESTful API](https://hl7.org/fhir/R5/http.html) for information on error handling)


###### X:Y.Z.4.1.2.1 Resource content

* When the request is accepted (regardless of whether it may be acted upon), the response shall contain the resource that has been created from the request, including the id, version, etc. as assigned by the server. This allows the Test Plan Author to confirm what has been accepted and track the request on that server by its internal `id`.
* In case of error, the response SHALL contain an OperationOutcome providing more information about the issue.

##### X:Y.Z.4.1.3 Expected Actions
Upon receiving the response to the Supply Request, the Test Plan Author can persist the information provided by the Supply Request Filler (status, id, etc.) for future tracking, and can trigger a response to any issues, if they exist.