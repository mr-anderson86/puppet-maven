class maven (

  $package_name     = $maven::params::package_name,
  $package_version  = $maven::params::package_version,
  $archive_format   = $maven::params::archive_format,
  $package_file     = $maven::params::package_file,
  $download_url     = $maven::params::download_url,
  $install_path     = $maven::params::install_path,
  $java_binary      = $maven::params::install_path::java_binary,
  $maven_full_path  = "${install_path}/${package_name}-${package_version}"

) inherits maven::params {

  package { $java_binary : 
    ensure       => present,
  }

  archive { $package_file :
    path         => "/tmp/${package_file}",
    source       => "${download_url}",
    extract      => true,
    extract_path => $install_path,
    creates      => $maven_full_path,
    cleanup      => true,
  }

  file { "${install_path}/maven" :
    ensure      => link,
    target      => $maven_full_path,
    require     => Archive[$package_file],
  }

  file { '/etc/profile.d/maven.sh' :
    ensure      => file,
    source      => "puppet://modules/maven/maven.sh",
    require     => [
      File['/etc/profile.d/maven.sh'],
      Package[$java_binary],
    ],
  }
}
