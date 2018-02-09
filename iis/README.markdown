# IIS Puppet Module

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with your IIS module](#setup)
    * [What IIS affects](#what-IIS-affects)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

This module installs and enables the IIS on Windows Servers.

## Module Description

The IIS module allows you to automatically host websites and applications in an AWS instance. 

## Setup

### What IIS Services affects
DISM is a powerful tool that can allow you to quickly enable
Windows features by using DISM with puppet

* For more information read the following URL's
	* https://technet.microsoft.com/en-us/library/hh824822.aspx
	* https://technet.microsoft.com/en-us/library/dd744582(v=ws.10).aspx
	* https://technet.microsoft.com/en-us/library/dn376474.aspx

* Packages
    * IIS Services (Windows)
    * DISM
    	Features Enabled in this module
    	* dism { "IIS-WebServerRole":            } ->
  		* dism { "IIS-WebServer":                } ->
  		* dism { "IIS-CommonHttpFeatures":       } ->
  		* dism { "IIS-RequestFiltering":         } ->
  		* dism { "IIS-StaticContent":            } ->
  		* dism { "IIS-DefaultDocument":          } ->
  		* dism { "IIS-DirectoryBrowsing":        } ->
  		* dism { "IIS-HttpErrors":               } ->
  		* dism { "IIS-ApplicationDevelopment":   } ->
  		* dism { "IIS-ISAPIExtensions":          } ->
  		* dism { "IIS-ISAPIFilter":              } ->
  		* dism { "IIS-HealthAndDiagnostics":     } ->
  		* dism { "IIS-HttpLogging":              } ->
  		* dism { "IIS-Security":                 } ->
  		* dism { "IIS-BasicAuthentication":      } ->
  		* dism { "IIS-WindowsAuthentication":    } ->
  		* dism { "IIS-Performance":              } ->
  		* dism { "IIS-HttpCompressionStatic":    } ->
  		* dism { "IIS-WebServerManagementTools": } ->
  		* dism { "IIS-ManagementConsole":        } ->
  		* dism { "IIS-ManagementScriptingTools":  } 
    
* Services
    * IIS Webserver

## Usage

Install IIS in Windows Server and ensure the Service is running

    class {'iis': }

## Limitations
Module tested only on the following Operating Systems.
* Windows 2012 Server
* Windows 2008 Server

