# Teachale Test 

## Requiremnts:

* Ruby (version v2.5 or higher)
* Bundler (Gem)

**Ruby (version v2.5 or higher)** - Language for the automation test.  
https://github.com/ruby/ruby  

**Bundler** - Gem to handle and manange dependencies in the automation.
https://github.com/bundler/bundler  

## Main dependencies in the automation

* Capybara (Gem)
* Cucumber (Gem)

**Capybara** - Gem to handle interactions wiht browser 
https://github.com/teamcapybara/capybara  

**Cucumber** - Gem to handle gherkin language and execute suites described 
https://github.com/cucumber/cucumber  

**YAML** - Module to handle selector 
http://ruby-doc.org/stdlib-2.4.0/libdoc/yaml/rdoc/YAML.html  

## Setup envirnoment and dependencies:

*  After configuring the local environment with Ruby Language, install the project's dependencies (Gems), which are in the Gemfile file (preferably it should be with the library versions, once they have been tested, to ensure that in an environment with the same conditions, the automation runs without errors )
* Download and configure the desired webdriver
* Execute the following command inside the root directory of automation:
    * ``bundle install``

## Executing tests

**Obs: Due to macOS restrictions this test was using custom driverpath, please check env.rb to disable it.** 

* All scenarios opening window navigator with report: 
    * ``cucumber -report``
* All scenarios headless with report: 
    * ``cucumber -p headless_report``
