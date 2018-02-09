class httpsrewrite {
	
  $exe_name = "addHTTPSsvrvar.ps1"
  $location = "puppet:///modules/${module_name}/${exe_name}"
  $on_disk = 'C:\scripts\addHTTPSsvrvar.ps1'
  
  file { $on_disk:
    ensure => file,
    source => $location,
	  owner => 'administrator',
	  group  => 'administrators',
	  mode => '1777',
  }
  exec { 'adding HTTPS element variable to IIS rewrite':
  require =>  Class [iis-UrlRewrite],
	command => 'powershell.exe -executionpolicy RemoteSigned  -file C:\scripts\addHTTPSsvrvar.ps1',
  provider => powershell,
  }
}
