class maven (

  $package_name     = $maven::params::package_name,
  $package_version  = $maven::params::package_version,
  $archive_format   = $maven::params::archive_format,
  $download_url     = $maven::params::download_url,
  $install_path     = $maven::params::install_path,
  $java_binary      = $maven::params::install_path::java_binary,

) inherits maven::params {

}
