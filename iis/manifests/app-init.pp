class iis::app-init {

  Dism {
    ensure => present,
	require =>  Class [iis],
  }
  dism { "IIS-ApplicationInit":            } 
}
