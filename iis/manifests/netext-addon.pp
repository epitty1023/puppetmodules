class iis::netext-addon {
      
  $exe_name = "netext-addon.ps1"
  $location = "puppet:///modules/${module_name}/${exe_name}"
  $on_disk = 'C:\scripts\netext-addon.ps1'
  
  file { $on_disk:
  ensure => file,
  source => $location,
	owner => 'administrator',
	group  => 'administrators',
	mode => '1777',
  }
  exec { 'installing IIS NetExtensible Features':
  require =>  Class [puppet-iis::aspnet45],
  command => 'c:\windows\syswow64\windowspowershell\v1.0\Powershell.exe -executionpolicy remotesigned  -file C:\scripts\netext-addon.ps1',
  }
}
