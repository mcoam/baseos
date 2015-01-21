class baseos::packages {

case $osfamily {
	'Redhat': { 
	$allpackage = [ "screen", "strace", "telnet", "nmap", "traceroute", "sysstat", "nc", "bind-utils", "tcpdump", "tzdata", "zsh", "pv", "libuuid", "links"]
	package { $allpackage: 
		ensure => "present" 
	}
	package {"bash":
	      ensure => "latest"
 	}
  }
	'Debian': {
	
	$allpackage = [ "screen", "strace", "telnet", "nmap", "traceroute", "sysstat", "tcpdump", "tzdata" ]

	package { $allpackage: ensure => "present" 
	}
    }
  } #cierra case
} #cierra clase 
