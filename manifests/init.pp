class baseos {
	$source = "puppet:///modules/${module_name}"
	class {'::baseos::repo':} ->
	class {'::baseos::packages':} ->
	class {'::baseos::config':} ->
	Class['baseos']
}
