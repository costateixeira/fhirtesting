Feature: Test FHIR Interface

Background:
    * url 'http://localhost:8080/fhir'
    * header Accept = 'application/fhir+json;fhirVersion=4.0'
    * header Content-Type = 'application/fhir+json;fhirVersion=4.0'


Scenario: Send Transaction with the Measure data
    Given path ''
    And request read('../testdata/screening-Bundle.json')
    When method post
    Then status 200

Scenario:Evaluate the Measure
    Given path 'Measure/ColorectalCancerScreeningCQM/$evaluate-measure'
    And param patient = 'denom-EXM130'
    And param periodStart = '2022-01-01'
    And param periodEnd = '2022-12-31'    
    When method get
    Then status 200
    And match response.resourceType == 'MeasureReport'
    * print 'Response:', response
    And jsonPath(response, "$..population[?(@.code.coding[?(@.code == 'numerator')])].count[0]") == 0
    * def resourceType = response.fhirpath('resourceType')
    * print 'Resource Type:', resourceType
    * match resourceType == 'MeasureReport'

