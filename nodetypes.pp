###########################################################################
# Node Type Definitions
#
node basenode {

    if $operatingsystem =~ /Redhat|CentOS/ {
        if $virtual == "virtualbox" {
            class { 'centos_minimal': stage => init }
        }
    }

    if $operatingsystem =~ /Amazon|Linux/ {
        class { 'centos': stage => init }
    }

    package { 'git' : ensure => installed }
    package { 'bash-completion' : ensure => installed }
    package { 'screen' : ensure => installed }
    package { 'tree' : ensure => installed }
    package { 'wget' : ensure => installed }

    class { 'ntp':
        time_zone =>  '/usr/share/zoneinfo/America/Phoenix',
    }

    class { 'puppet': puppet_conf => 'rsmart-common/puppet.conf.erb' }

    @@host { $fqdn:
        ip => $ipaddress,
        host_aliases => [ $hostname ],
    }

    # The localconfig module is found in $environment/modules
    class { 'localconfig': stage => init }
    class { 'localconfig::hosts': stage => init }

    class { 'people': }
    class { 'sudo': }
}

# This should probably be called an academicnode
node oaenode inherits basenode {

    # OAE module configuration
    class { 'oae::params':
        user    => $localconfig::user,
        group   => $localconfig::group,
        basedir => $localconfig::basedir,
    }

    limits::conf { "${localconfig::user}-soft":
        domain => $localconfig::user,
        type => soft,
        item => nofile,
        value => $localconfig::max_open_files ? {
            undef => 20480,
            default => $localconfig::max_open_files,
        },
    }
	
    limits::conf { "root-soft":
        domain => 'root',
        type => soft,
        item => nofile,
        value => $localconfig::max_open_files ? {
            undef => 20480,
            default => $localconfig::max_open_files,
        },
    }
	
    limits::conf { "${localconfig::user}-hard":
        domain => $localconfig::user,
        type => hard,
        item => nofile,
        value => $localconfig::max_open_files ? {
            undef => 20480,
            default => $localconfig::max_open_files,
        },
    }
    
    limits::conf { "root-hard":
        domain => 'root',
        type => hard,
        item => nofile,
        value => $localconfig::max_open_files ? {
            undef => 20480,
            default => $localconfig::max_open_files,
        },
    }
    
}