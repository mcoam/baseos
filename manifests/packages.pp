class baseos::packages {

case $osfamily {
	'Redhat': { 
	include 'baseos::sysdig'
	
	$allpackage = [ "screen", "strace", "telnet", "nmap", "traceroute", "sysstat", "nc", "bind-utils", "tcpdump", "tzdata", "zsh", "pv", "perl-Nagios-Plugin", "libuuid" ]
		package { $allpackage: 
							ensure => "present" 
						}
	
	package {"bash":
				      ensure => "latest"
			    }
  	}

	'Debian': {
	
	$allpackage = [ "screen", "strace", "telnet", "nmap", "traceroute", "sysstat", "tcpdump", "tzdata" ]
		package { $allpackage: ensure => "present" }
	
        	}
  }	
} 
