class iis {
  Dism {
    ensure => present,
	#require =>  Class [iis::netext-addon],
  }

  dism { "IIS-WebServerRole":            } ->
  dism { "IIS-WebServer":                } ->
  dism { "IIS-CommonHttpFeatures":       } ->
  dism { "IIS-RequestFiltering":         } ->
  dism { "IIS-StaticContent":            } ->
  dism { "IIS-DefaultDocument":          } ->
  dism { "IIS-DirectoryBrowsing":        } ->
  dism { "IIS-HttpErrors":               } ->
  dism { "IIS-ApplicationDevelopment":   } ->
  dism { "IIS-ISAPIExtensions":          } ->
  dism { "IIS-ISAPIFilter":              } ->
  dism { "IIS-HealthAndDiagnostics":     } ->
  dism { "IIS-HttpLogging":              } ->
  dism { "IIS-Security":                 } ->
  dism { "IIS-BasicAuthentication":      } ->
  dism { "IIS-WindowsAuthentication":    } ->
  dism { "IIS-Performance":              } ->
  dism { "IIS-HttpCompressionStatic":    } ->
  dism { "IIS-WebServerManagementTools": } ->
  dism { "IIS-ManagementConsole":        } ->
  dism { "IIS-ManagementScriptingTools":  } 
  
 # iis_site {'Default Web Site':
 #  ensure   => absent,
 #}

   dism { 'IIS-ASP':                      
    ensure => absent,
   }
   dism { 'IIS-HttpRedirect':
    ensure => absent,
   }
   dism { 'IIS-CustomLogging':
    ensure => absent,
   }
   dism { 'IIS-RequestMonitor':
     ensure => absent,
   }
   dism { 'IIS-ODBCLogging':
     ensure => absent,
   }
   dism { 'IIS-HttpTracing':   
     ensure => absent,
   }
   dism { 'IIS-LoggingLibraries':                       
     ensure => absent,
   }
   dism { 'IIS-CGI':
     ensure => absent,
   }
   dism { 'IIS-URLAuthorization':
     ensure => absent,
   }
   dism { 'IIS-IPSecurity':
     ensure => absent,
   }  
   dism { 'IIS-HttpCompressionDynamic':
     ensure => absent,
   }
   dism { 'IIS-ServerSideIncludes':
     ensure => absent,
   }
}
