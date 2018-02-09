class netext-addon {

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
	command => 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -executionpolicy remotesigned  -file C:\scripts\netext-addon.ps1',
	before => class [puppet-iis],  
}
}