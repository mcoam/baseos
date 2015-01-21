class baseos (
	$repo_rpm_forge_r6	= $baseos::params::repo_rpm_forge_r6,
	$repo_rpm_forge_r7	= $baseos::params::repo_rpm_forge_r7,
	$repo_rpm_forge_r5	= $baseos::params::repo_rpm_forge_r5,
    	$repo_rpm_epel_r6	= $baseos::params::repo_rpm_epel_r6,
    	$repo_rpm_epel_r7	= $baseos::params::repo_rpm_epel_r7,
    	$repo_rpm_epel_r5	= $baseos::params::repo_rpm_epel_r5,
    	$repo_name_forge_file	= $baseos::params::repo_name_forge_file,
    	$repo_name_epel_file	= $baseos::params::repo_name_epel_file,
)
inherits baseos::params {
	class {'::baseos::repo':} ->
	class {'::baseos::config':} ->
	class {'::baseos::packages':} ->
	class {'::baseos::service':} ->
	Class['baseos']
}
