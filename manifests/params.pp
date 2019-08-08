class maven::params {

  $package_name     = "apache-maven"
  $package_version  = "3.6.0"
  $archive_format   = "tar.gz"
  $download_url     = "https://www-us.apache.org/dist/maven/maven-3/${package_version}/binaries/${package_name}-${package_version}-bin.${archive_format}"
  $install_path     = "/opt"
  $java_binary      = "java-1.8.0-openjdk-devel"
  
}
