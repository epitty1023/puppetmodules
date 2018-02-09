class iis::aspnet45 {

  $exe_name = "aspnet45.ps1"
  $location = "puppet:///modules/${module_name}/${exe_name}"
  $on_disk = 'C:\scripts\aspnet45.ps1'
  
  file { $on_disk:
    ensure => file,
    source => $location,
	owner => 'administrator',
	group  => 'administrators',
	mode => '1777',
  }
  exec { 'installing ASP NET45':
	command => 'c:\windows\syswow64\windowspowershell\v1.0\powershell.exe -executionpolicy remotesigned  -file C:\scripts\aspnet45.ps1',
  }
}