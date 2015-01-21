class baseos::config inherits baseos   {
      
	$source_file="puppet:///modules/${module_name}/base_file" 

	file { "/etc/selinux/config":
                ensure  => present,
                source  => "${source_file}/config",
                mode    => 664,
        }
	
	exec { 'disable-selinux':
          command => "setenforce 0",
	  #ejecutar setenforce 0, solo si la salida del comando sestatus no trae nada
	  unless  => "sestatus |egrep '(Current mode:.*permissive)'";
  	}

        file { "/etc/hosts":
                ensure  => present,
                source  => "${source_file}/hosts",
                mode    => 664,
        }

 	file {"/etc/logrotate.conf":
		ensure  => present,
    		source  => "${source_file}/logrotate.conf",
	}

 	file {"/etc/sysconfig/init":
		ensure  => present,
    		source  => "${source_file}/init",
	}

}
