Feature: Measure Test

Scenario: Validate MeasureReport using FHIRPath
  Given url 'http://localhost:8080/fhir/Measure/ColorectalCancerScreeningCQM/$evaluate-measure?patient=denom-EXM130&periodStart=2022-01-01&periodEnd=2022-12-31'
  When method get
  Then status 200
  * print 'Response:', response
  * def resourceType = response.fhirpath('resourceType')
  * print 'Resource Type:', resourceType
  * match resourceType == 'MeasureReport'
