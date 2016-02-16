WebGen - A module for creating randomized vulnerable web applications

[![Build Status](https://travis-ci.org/Aviio/WebGen.svg?branch=master)](https://travis-ci.org/Aviio/WebGen)

**Configuration**

- WebGenConfig - Contains rules for webgen to follow when generating vulnerable web applications.
- Sites - Contains strict contracts for webgen to generate web applications against.
- VulnerabilityDefinitions - Contains definitions for certain vulnerabilities so webgen knows where to look to insert them
- TemplateDefinitions - Contains definitions for web application templates so webgen knows where to look to base the app on

**Dependencies**

Webgen has the current production dependencies, which are included in the gemfile. Bundle can be used to install these automatically using the gemfile provided.

```Ruby
gem 'oga'
gem 'xml-simple'
gem 'colorize'
gem 'hash_validator'
```