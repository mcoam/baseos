class baseos::sysdig {

	exec{'install-rpm-sysdig':
		command => 'rpm --import https://s3.amazonaws.com/download.draios.com/DRAIOS-GPG-KEY.public  && curl -s -o /etc/yum.repos.d/draios.repo http://download.draios.com/stable/rpm/draios.repo',
		creates => '/etc/yum.repos.d/draios.repo',
	#	notify  => Exec['yum-sysdig'],
	}
	
	package {'sysdig':
		require => Exec['install-rpm-sysdig'],
		ensure => latest
	}
}
