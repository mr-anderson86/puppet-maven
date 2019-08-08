class maven (

  $package_name     = $maven::params::package_name,
  $package_version  = $maven::params::package_version,
  $archive_format   = $maven::params::archive_format,
  $package_file     = $maven::params::package_file,
  $download_url     = $maven::params::download_url,
  $install_path     = $maven::params::install_path,
  $java_binary      = $maven::params::install_path::java_binary,

) inherits maven::params {

  archive { $archive_name:
    path         => "/tmp/${package_file}",
    source       => "${download_url}",
    extract      => true,
    extract_path => $install_path,
    creates      => "${install_path}/${package_name}-${package_version}",
    cleanup      => true,
  }

}
