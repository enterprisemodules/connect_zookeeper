
####Table of Contents

1. [Overview](#overview)
2. [Module Description - What zookeeper importer for Connect does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the zookeeper importer for Connect](#setup)
    * [What connect affects](#what-connect-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with the zookeeper importer for Connect](#beginning-with-connect)
    * [Tools](#tools)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Troubleshooting](#troubleshooting)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)
    * [OS support](#os-support)
    * [Tests - Testing your configuration](#testing)

##Overview

[Connect](https://github.com/hajee/connect) is a replacement for YAML in hiera when using Puppet. Connect allows you to manipulate and import data from external sources. These importers are add-on extensions for Connect.

This module contains an importer to import values and services from [zookeeper](https://https://zookeeper.apache.org//)

##Module Description

Using this module, you can import service data and data from the zookeeper key value store seamlessly in your Puppet manifests. This allows you to build dynamic manifests. For example if you store all information regarding font-end load balancers in zookeeper, you can use this Connect data source to fetch the current data from zookeeper and configure your applications accordingly. C

##Example

With this import, you can use service information stored in zookeeper, to configure your system. Here's an example:

```ruby
import from zookeeper('192.168.99.100:2181') do
  all_load_balancers = "/#{client}/loadbalancers/"  # fetches an array
  firewall_ip        = "/#{client}/firewall_ip"     # Fetches a single value
end
```

This code imports the information stored in the zookeeper server at path "/#{client}/loadbalancers/" into the connect variable `all_load_balancers`. Because the key ends with a `\`, the importer returns an array. The `firewall_ip` will contain a single value because it doesn't end with a `\`.

##Setup

###Installing the module

To use the connect hiera module, you first have to make sure it is installed.

```sh
puppet module install enterprisemodules/connect_zookeeper
```

If you are using a Puppetfile, you need the following lines:

```
mod 'enterprisemodules-connect_zookeeper'
```

###What connect_zookeeper affects


###Setup Requirements

To use this module, you need to have the ruby gem `zk` installed:

```sh
$ gem install zk
```

###Beginning with connect zookeeper module


##detailed description

Check [the Connect Language, in a Nutshell](https://github.com/hajee/connect/blob/master/doc/nutshell.md), for more intro into the language.


##Limitations

This module is tested CentOS and Redhat. It will probably work on other Linux distributions. 

##Development

This is an open source project, and contributions are welcome.

###OS support

Currently we have tested:

* CentOS 5
* Redhat 5

###Testing

Make sure you have:

* rake
* bundler

Install the necessary gems:

    bundle install

And run the tests from the root of the source code:

    rake spec

We are currently working on getting the acceptance test running as well.
