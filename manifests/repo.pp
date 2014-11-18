class baseos::repo {

 $source = "puppet:///modules/${module_name}"
 Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }
 $epelrpm  = "epel-release-6-8.noarch.rpm"
 $forgerpm = "rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm"

	file {"/root/$epelrpm":
		ensure => present,	
		source => "$source/$epelrpm",
		notify  => Exec["install-epel-repo"]
	}

  file {"/root/$forgerpm":
		 ensure => present,
     source => "$source/$forgerpm",
     notify  => Exec["install-forge-repo"]
   }

	exec{"install-epel-repo":
		#onlyif solo se ejecutara si se cumple con la condicion o esta es verdadera
		#onlyif  => "/tmp/rpm", si solo esta el archivo se ejecuta
		#refreshonly => true,
		creates => "/etc/yum.repos.d/epel.repo",
	   	command => "rpm -Uvh /root/$epelrpm --force",
                require => File["/root/$epelrpm"],
	}
	
	exec{"install-forge-repo":
		creates => "/etc/yum.repos.d/rpmforge.repo",
                command => "rpm -Uvh /root/$forgerpm --force && yum-config-manager --enable rpmforge-testing",
                require => File["/root/$forgerpm"],
        }
}
