# generator-standard

The MCDS Code Generator has the following features:
* Generates application, container, and pipeline scaffolds for various runtimes
* Performs various developer workstation procedures such as generating configuration files
* Performs general purpose automations related to development

## Prerequisites

### Node.js

Install by running `yum install nodejs` on RHEL or using appropriate installer/binaries downloaded from [here](https://nodejs.org/en/download)

### Yeoman

Install by running `npm install -g yo` from command line

## Installation

1. Clone the [generator-standard](https://github.kyndryl.net/mcds-content-containers/generator-standard) repository

2. In the cloned repo directory, run:

```shell
npm install
npm link
```

## Configuration

Generator can be customized to create desired output for both scaffold and jenkins pipeline generation by modifying appropriate source files

### Jenkins Pipeline

Templates used to generate Jenkinsfile can be modified in the following locations:

1. Scaffold Generator

`generator-standard\generators\categories\scaffold\core\<microservice>\templates\Jenkisfile`

Where \<microservice> is one of: `nodejs-microservice`, `java-microservice`, `python-microservice`

2. Pipeline Generator

`generator-standard\generators\categories\pipeline\templates\<microservice>\Jenkisfile`

Where \<microservice> is one of: `nodejs`, `java`, `python`

* Jenkinsfile templates contain references to other .tpl files, contents of which are rendered during generation process
* These .tpl files can also be modified and are located in `generator-standard\categories\common\pipelines\`
* For example, `<%- header %>` reference at the top of Jenkinsfile template will be replaced with contents of `generator-standard\categories\common\pipelines\header.tpl`

### Helm Chart

Source files for generated Helm Charts are located in:

`generator-standard\categories\common\chart\`

### Other files

The rest of the files created by scaffold generator can be found in:

`generator-standard\generators\categories\scaffold\core\<microservice>\files\`

## Execution

### Notes

* Environment variables starting with YO_ will be converted to answers with _ replaced with -
* Name options and prompts lowercase hyphenated like some-option

### Create a Scaffold 

1. Create a new directory for the application scaffold
2. Run `yo standard` from that directory and follow prompts for scaffold generator  

### Create a Jenkins Pipeline 

1. Change into the directory in which you want Jenkins pipeline file to be generated
2. Run `yo standard` and follow prompts for pipeline generator

## Bugs

Please get in touch with `npariath@kyndryl.com`, `nimeja18@kyndryl.com` or `tomasz.krolikowski@kyndryl.com` in case you face any issues
