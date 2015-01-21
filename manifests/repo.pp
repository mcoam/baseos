class baseos::repo inherits baseos {

case $architecture{ 
 'x86_64':{
    case $operatingsystemmajrelease {
    '5':{ 
	file {"/root/${repo_rpm_epel_r5}":
		ensure => present,	
		source => "puppet:///modules/${module_name}/rpm_repo/${repo_rpm_epel_r5}",
		notify  => Exec["install-epel-repo"]
	}

	file {"/root/${repo_rpm_forge_r5}":
		ensure => present,
		source => "puppet:///modules/${module_name}/rpm_repo/${repo_rpm_forge_r5}",
     		notify  => Exec["install-forge-repo"]
	}

	exec{"install-epel-repo":
		cwd => "/root",
		creates => "${repo_name_epel_file}",
	   	command => "rpm -Uvh ${repo_rpm_epel_r5} --force",
                require => File["/root/${repo_rpm_epel_r5}"],
	}
	exec{"install-forge-repo":
		cwd => "/root",
		creates => "${repo_name_forge_file}",
                command => "rpm -Uvh ${repo_rpm_forge_r5} --force",
                require => File["/root/${repo_rpm_forge_r5}"],
        }
#	  notify{"Valor: ${repo_rpm_forge_r5}": }
    }##cierra case rhel 5
    '6':{ 
	file {"/root/${repo_rpm_epel_r6}":
		ensure => present,	
		source => "puppet:///modules/${module_name}/rpm_repo/${repo_rpm_epel_r6}",
		notify  => Exec["install-epel-repo"]
	}

	file {"/root/${repo_rpm_forge_r6}":
		ensure => present,
		source => "puppet:///modules/${module_name}/rpm_repo/${repo_rpm_forge_r6}",
     		notify  => Exec["install-forge-repo"]
	}

	exec{"install-epel-repo":
		cwd => "/root",
		creates => "${repo_name_epel_file}",
	   	command => "rpm -Uvh ${repo_rpm_epel_r6} --force",
                require => File["/root/${repo_rpm_epel_r6}"],
	}
	
	exec{"install-forge-repo":
		cwd => "/root",
		creates => "${repo_name_forge_file}",
                command => "rpm -Uvh ${repo_rpm_forge_r6} --force",
                require => File["/root/${repo_rpm_forge_r6}"],
        }
    }##cierra case rhel 6
    '7':{
		file {"/root/${repo_rpm_epel_r7}":
		ensure => present,	
		source => "puppet:///modules/${module_name}/rpm_repo/${repo_rpm_epel_r7}",
		notify  => Exec["install-epel-repo"]
	}

	file {"/root/${repo_rpm_forge_r7}":
		ensure => present,
		source => "puppet:///modules/${module_name}/rpm_repo/${repo_rpm_forge_r7}",
     		notify  => Exec["install-forge-repo"]
	}

	exec{"install-epel-repo":
		cwd => "/root",
		creates => "${repo_name_epel_file}",
	   	command => "rpm -Uvh ${repo_rpm_epel_r7} --force",
                require => File["/root/${repo_rpm_epel_r7}"],
	}
	
	exec{"install-forge-repo":
		cwd => "/root",
		creates => "${repo_name_forge_file}",
                command => "rpm -Uvh ${repo_rpm_forge_r7} --force",
                require => File["/root/${repo_rpm_forge_r7}"],
        }
  } ###cierra rhel 7
  default:{ 
	notify{"Release no soportado": } 
  } ###cierra default
 } #cierra case release
} #cierra x86_64
  default:{ 
         notify{"Arquitectura no soportada": } 
  } ###cierra default
} #cierra case architecture
}#cierra clase

