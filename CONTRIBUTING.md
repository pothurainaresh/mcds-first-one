# Contributing to MCDS Generator

:+1::tada: First off, thanks for taking the time to contribute! :tada::+1:

The following is a set of guidelines for contributing to MCDS Generator and its packages, which are hosted in the [generator-apmt](https://github.ibm.com/mcds-content-containers/generator-apmt) on GitHub. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

#### Table Of Contents

[Code of Conduct](#code-of-conduct)

[I don't want to read this whole thing, I just have a question!!!](#i-dont-want-to-read-this-whole-thing-i-just-have-a-question)

[What should I know before I get started?](#what-should-i-know-before-i-get-started)
  * [Yeoman](#yeoman)
  * [Design Decisions](#design-decisions)

[How Can I Contribute?](#how-can-i-contribute)
  * [Reporting Bugs](#reporting-bugs)
  * [Suggesting Enhancements](#suggesting-enhancements)
  * [Your First Code Contribution](#your-first-code-contribution)
  * [Pull Requests](#pull-requests)

[Styleguides](#styleguides)

  * [Add Test cases](#add-test-cases)
  * [Git Commit Messages](#git-commit-messages)
  * [JavaScript Styleguide](#javascript-styleguide)
  * [CoffeeScript Styleguide](#coffeescript-styleguide)
  * [Specs Styleguide](#specs-styleguide)
  * [Documentation Styleguide](#documentation-styleguide)

[Additional Notes](#additional-notes)
  * [Issue and Pull Request Labels](#issue-and-pull-request-labels)

## Code of Conduct

This project and everyone participating in it is governed by the MCDS DevSecOps Guild. By participating, you are expected to uphold this code. Please report unacceptable behavior to [npariath@in.ibm.com](mailto:npariath@in.ibm.com).

## I don't want to read this whole thing I just have a question!!!

> **Note:** [Please don't file an issue to ask a question.]  Use Slack on channel `#contentsforconteners` (https://ibm-tia-process-auto.slack.com)
   

## What should I know before I get started?

### Yeoman

Yeoman helps you to kickstart new projects, prescribing best practices and tools to help you stay productive.
Please understand the yeoman framework using  [Yeoman](https://yeoman.io/)

Please have look at the following

[Composability](https://yeoman.io/authoring/composability.html) -  A generator can decide to compose itself with another generator 

[Working With The File System and Templates](https://yeoman.io/authoring/file-system.html) -  Yeoman file utilities are based on the idea you always have two location contexts on disk

[Testing Generators](https://yeoman.io/authoring/testing.html) -  Yeoman add to ease the pain of unit testing a generator



### Design Decisions

When we make a significant decision in how we maintain the project and what we can or cannot support, we will document it in the [design-decisions](https://ibm.ent.box.com/notes/557633637385). If you have a question around how we do things, check to see if it is documented there. If it is *not* documented there, please open a new topic on Slack channel  on `#contentsforconteners` [TI&A Process Automation](https://ibm-tia-process-auto.slack.com/) and ask your question.

## How Can I Contribute?

### Reporting Bugs

This section guides you through submitting a bug report for MCDS Generator. Following these guidelines helps maintainers and the community understand your report :pencil:, reproduce the behavior :computer: :computer:, and find related reports :mag_right:.

Before creating bug reports, please check on Slack channel  on `#contentsforconteners` [TI&A Process Automation](https://ibm-tia-process-auto.slack.com/) and ask your question.

> **Note:** If you find a **Closed** issue that seems like it is the same thing that you're experiencing, open a new issue and include a link to the original issue in the body of your new one.



#### How Do I Submit A (Good) Bug Report?

Bugs are tracked as [GitHub issues](https://guides.github.com/features/issues/). Create an issue on that repository and provide the following information 

Explain the problem and include additional details to help maintainers reproduce the problem:

* **Use a clear and descriptive title** for the issue to identify the problem.
* **Describe the exact steps which reproduce the problem** in as many details as possible. For example, start by explaining how you started generator, e.g. which command exactly you used in the terminal, or how you started Atom otherwise. When listing steps, **don't just say what you did, but explain how you did it**. 
* **Provide specific examples to demonstrate the steps**. Include links to files or GitHub projects, or copy/pasteable snippets, which you use in those examples.
* **Describe the behavior you observed after following the steps** and point out what exactly is the problem with that behavior.
* **Explain which behavior you expected to see instead and why.**
* **If the problem wasn't triggered by a specific action**, describe what you were doing before the problem happened and share more information using the guidelines below.

Provide more context by answering these questions:

* **Did the problem start happening recently** (e.g. after updating to a new version of MCDS Generator) or was this always a problem?
* If the problem started happening recently, **can you reproduce the problem in an older version of MCDS Generator?** What's the most recent version in which the problem doesn't happen? 
* **Can you reliably reproduce the issue?** If not, provide details about how often the problem happens and under which conditions it normally happens.


Include details about your configuration and environment:

* **Which version of MCDS Generator are you using?** 
* **What's the name and version of the OS you're using**?


### Suggesting Enhancements

This section guides you through submitting an enhancement suggestion for MCDS Generator, including completely new features and minor improvements to existing functionality. Following these guidelines helps maintainers and the community understand your suggestion :pencil: and find related suggestions :mag_right:.

When you are creating an enhancement suggestion, please [include as many details as possible](#how-do-i-submit-a-good-enhancement-suggestion). 


#### How Do I Submit A (Good) Enhancement Suggestion?

Enhancement suggestions are tracked as [GitHub issues](https://guides.github.com/features/issues/). Create an issue on that repository and provide the following information:

* **Use a clear and descriptive title** for the issue to identify the suggestion.
* **Provide a step-by-step description of the suggested enhancement** in as many details as possible.
* **Provide specific examples to demonstrate the steps**. Include copy/pasteable snippets which you use in those examples, as [Markdown code blocks](https://help.github.com/articles/markdown-basics/#multiple-lines).
* **Describe the current behavior** and **explain which behavior you expected to see instead** and why.
* **Specify the name and version of the OS you're using.**

### Your First Code Contribution

Unsure where to begin contributing to MCDS Generator? Start by asking in Slack on channel `#contentsforconteners` (https://ibm-tia-process-auto.slack.com). 



#### Local development

MCDS Generator can be developed locally. For instructions on how to do this use the [README.md](README.md) of the repo



### Pull Requests

The process described here has several goals:

- Maintain MCDS Generator quality
- Fix problems that are important to users
- Engage the community in working toward the best possible generator
- Enable a sustainable system for MCDS Generator maintainers to review contributions

Please follow these steps to have your contribution considered by the maintainers:

1. Follow the [styleguides](#styleguides)
2. After you submit your pull request, verify that all [status checks](https://help.github.com/articles/about-status-checks/) are passing <details><summary>What if the status checks are failing?</summary>If a status check is failing, and you believe that the failure is unrelated to your change, please leave a comment on the pull request explaining why you believe the failure is unrelated. A maintainer will re-run the status check for you. If we conclude that the failure was a false positive, then we will open an issue to track that problem with our status check suite.</details>

While the prerequisites above must be satisfied prior to having your pull request reviewed, the reviewer(s) may ask you to complete additional design work, tests, or other changes before your pull request can be ultimately accepted.

## Styleguides

### Add Test cases 

* Use as many  testcases in order to build a robust code
* Run `npm test` before any commit
* Comply with the ESLint rules (you can run `eslint . --fix` to have ESLint auto-fix, or your editor likely has support)


### Git Commit Messages

* Use the present tense ("Add feature" not "Added feature")
* Limit the first line to 72 characters or less
* Reference issues and pull requests liberally after the first line
* Consider starting the commit message with an applicable emoji:
    * :art: `:art:` when improving the format/structure of the code
    * :racehorse: `:racehorse:` when improving performance
    * :memo: `:memo:` when writing docs
    * :penguin: `:penguin:` when fixing something on Linux
    * :apple: `:apple:` when fixing something on macOS
    * :bug: `:bug:` when fixing a bug
    * :fire: `:fire:` when removing code or files
    * :green_heart: `:green_heart:` when fixing the CI build
    * :white_check_mark: `:white_check_mark:` when adding tests
    * :lock: `:lock:` when dealing with security
    * :arrow_up: `:arrow_up:` when upgrading dependencies
    * :arrow_down: `:arrow_down:` when downgrading dependencies
    * :shirt: `:shirt:` when removing linter warnings

### JavaScript Styleguide

All JavaScript must adhere to [JavaScript Standard Style](https://standardjs.com/).

Please run `eslint . --fix`  to fix the formating and show all issues;

## Additional Notes

### Issue and Pull Request Labels

This section lists the labels we use to help us track and manage issues and pull requests. 

[GitHub search](https://help.github.com/articles/searching-issues/) makes it easy to use labels for finding groups of issues or pull requests you're interested in. 

The labels are loosely grouped by their purpose, but it's not required that every issue have a label from every group or that an issue can't have more than one label from the same group.

Please open an issue on `generator-apmt` if you have suggestions for new labels, and if you notice some labels are missing on some repositories, then please open an issue on that repository.

#### Type of Issue and Issue State


| `enhancement` |
| `bug` | 
| `question` |
| `feedback` | 
| `help-wanted` | 
| `beginner` |
| `more-information-needed` |
| `needs-reproduction` | 
| `blocked` |
| `duplicate` | 
| `wontfix` |
| `invalid` |
| `wrong-repo` |

#### Topic Categories


| `linux` || Related to  running on Linux. |

| `mac` | | Related to  running on macOS. |

| `documentation` |  | Related to any type of documentation |

| `security` | | Related to security. |

| `uncaught-exception` | | Issues about uncaught exceptions |

| `crash` | | Reports of MCDS Generator completely crashing. |
