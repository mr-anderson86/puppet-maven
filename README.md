# puppet-maven

#### Table of Contents

1. [Module Description - What the module does and why it is useful](#module-description)
2. [Setup - The basics of getting started with maven](#setup)
    * [What maven module affects](#what-maven-module-affects)
3. [Other content](#other-content)
    * [Files](#files)
4. [Usage](#usage)
    * [Default usage](#default-usage)
    * [Usage with params](#usage-with-params)

## Module Description

This simple module installs maven 3.6.0 and JDK 1.8 (devel).  
Taken from the guide below:  
https://linuxize.com/post/how-to-install-apache-maven-on-centos-7/

## Setup

### What maven module affects
* installing java-1.8.0-openjdk-devel
* installing Apache Maven 3.6.0
* setting symbolic link /opt/maven (to actual installation path)
* sets up environment variables in /etc/profile.d/maven.sh

## Other content

### Files
* maven.sh

## Usage
### Default usage
```puppet
include maven
```
### Usage with params
```puppet
class { 'maven':
    package_version     => '3.6.0',
    java_binary         => 'java-1.8.0-openjdk-devel'
}
```
