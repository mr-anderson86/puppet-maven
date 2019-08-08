class maven (

  $package_name     = $maven::params::package_name,
  $package_version  = $maven::params::package_version,
  $archive_format   = $maven::params::archive_format,
  $package_file     = $maven::params::package_file,
  $download_url     = $maven::params::download_url,
  $install_path     = $maven::params::install_path,
  $java_binary      = $maven::params::install_path::java_binary,
  $m2_home          = "${install_path}/${package_name}-${package_version}"

) inherits maven::params {

  archive { $package_file :
    path         => "/tmp/${package_file}",
    source       => "${download_url}",
    extract      => true,
    extract_path => $install_path,
    creates      => $m2_home,
    cleanup      => true,
  }

  file { "${install_path}/mvn" :
    ensure      => link,
    target      => $m2_home,
    require     => Archive[$package_file],
  }

}
