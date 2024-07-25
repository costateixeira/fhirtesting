Feature: Test FHIR Interface

Background:
    * url 'http://localhost:8080/fhir'
    * header Accept = 'application/fhir+json;fhirVersion=4.0'
    * header Content-Type = 'application/fhir+json;fhirVersion=4.0'


Scenario: Send Transaction with the raw patient data - Patient, MedicationStatements...
    Given path ''
    And request read('../testdata/ips-data.json')
    When method post
    Then status 200

Scenario: Create an IPS on the fly using the $summary operation
    Given path 'Patient/2b90dd2b-2dab-4c75-9bb9-a355e07401e8/$summary'
    When method get
    Then status 200
    And match response.entry[0].resource.resourceType == 'Composition'

Scenario: Check that the patient is persisted and has the right name
    Given path 'Patient'
    When method get
    Then status 200
    And match response.entry[0].resource.name[0].family == 'DeLarosa'

Scenario: Check that there are no Bundles persisted
    Given path 'Bundle'
    When method get
    Then status 200
    And match response.total == 0


