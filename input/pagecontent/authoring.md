Authoring testing normally consists of:

* Obtaining or **[Authoring Test Data](#test-data)**
* Authoring **[Test Cases](#test-cases)**
* Authoring **[Test suites](#test-suites)**
* Authoring **[Test Registration forms](#test-registration-form)**

### Process overview

<figure>
  {% include authoring.svg %}
  <figcaption>Test Authoring</figcaption>
</figure>

1. The Test Author selects the testing scope - i.e. what is the artifact or capability or feature that is intended to be tested. 
   * The testing scope should be defined - ideally with an actor or an actor/transaction option. 
   * Testing scope should correspond to the granularity that the compliance is to be checked and reported.
   * There should be an artifact representing that scope, e.g. an ActorDefinition, or a CapabilityStatement[requirements]
     * The scope could be an entire ImplementationGuide but ImplementationGuides normally represent several systems, and it is not normal to assess conformance on a set of systems
2. Test Author creates the test cases to cover the functionality
   * Test cases can be TestScrips or Gherkin features, depending on the test execution tooling
    * See [gherkin syntax](gherkin) for a FHIR-specific gherkin test syntax  
3. Test Author assembles test plans by clustering the test cases per type or per sub-features as desired.
    * Examples - "*baseline testing*", "*negative testing*", "*performance testing*"...
4. Test Author creates Test Registration Forms. These forms will allow the test candidate to register for testing specific features.

5. The specification (publisher) compiles the Test Plans

6. The Test Plans are pushed to a test Repository. 

7. The test repository then gets updated. It will thus contain Test Plans for the different scopes / capabilities. These Test plans can be configured for each test run and for each vendor.





### Glossary

A Test Suite is 

**__Test Case__**

**__Capability__** 

**<a name="test-registration"></a>Test Registration** - process in which a test candidate (typically a software vendor) enrolls their system to be tested - selecting which capabilities to be tested. 

**<a name="test-suite"></a>Test Suite**

**<a name="test-registration-form"></a>Test Registration Form**


### Glossary

A Test Suite is 

**__Test Case__**

**__Capability__** 

**<a name="test-registration"></a>Test Registration** - process in which a test candidate (typically a software vendor) enrolls their system to be tested - selecting which capabilities to be tested. 

**<a name="test-suite"></a>Test Suite**

**<a name="test-registration-form"></a>Test Registration Form**
