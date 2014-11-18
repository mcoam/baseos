class baseos::config   {
 $source = "puppet:///modules/${module_name}"
       file { "/etc/selinux/config":
                ensure  => present,
                source  => "$source/config",
                mode    => 664,
        }

        file { "/etc/hosts":
                ensure  => present,
                #source  => "$source/hosts",
								content => template('baseos/hosts.erb'),
                mode    => 664,
        }

#	file { "/etc/profile.d/proxy.sh":
#		ensure  => present,
#		source  => "$source/proxy.sh",
#	  mode    => 755,
#		notify  => Exec["setting_proxy"]
#	}

	file {"/etc/yum.repos.d/glusterfs-epel.repo":
		ensure  => present,
                source  => "$source/glusterfs-epel.repo",
                mode    => 700,
	}
	
	#Array de servicios para deshabilitar
	$service_off = [ "cups", "portmap", "nfs-kernel-server", "nfslock"  ]
 	#Servicios deshabilitados	
	service { $service_off: 
		ensure => "stopped",
		enable => false,
	}	
	#Array de servicios para habilitar
	$service_on = [ "puppet", "postfix", "rpcbind" ]
        #Servicios habilitados 	
	service { $service_on:
                ensure => "running",
                enable => true,
        }

	cron { "sincroiza-ntp":
			 	command => "ntpdate -u ntp.tvn.org",
  			user    => "root",
 				hour    => 00,
  			minute  => 2,
	}

# exec {"ajusta-hora":
#			command => "ntpdate -u ntp.tvn.org",
#	}

	file {"/etc/sysctl.conf":
		ensure  => present,
    source  => "$source/sysctl.conf",
	}

 file {"/etc/security/limits.conf":
		ensure  => present,
    source  => "$source/limits.conf",
	}



}
