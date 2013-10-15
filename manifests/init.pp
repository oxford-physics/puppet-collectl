# /etc/puppet/manifests/classes/collectl.pp

class collectl inherits collectl::params {

    
    #if  $::enablegraphite  { 
    #     $service = "--export graphite,$graphiteserver\:$graphiteport"
    #}

    package { "collectl":
        ensure => installed
    }

    service { 'collectl':
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }

    file { "/etc/collectl.conf":
        owner => "root",
        group => "root",
        mode => 644,
        content => template('collectl/collectl.conf.erb'),
        notify => Service['collectl']
    }
   
    exec { "graphiteHostnameBodge": 
           command => '/bin/sed -i \'s/  $graphiteMyHost=(!$graphiteFqdnFlag) ? `hostname` : `hostname -f`;/   $graphiteMyHost=(!$graphiteFqdnFlag) ? `hostname -s` : `hostname -f`;/\' /usr/share/collectl/graphite.ph',
           require => Package['collectl']  ,
           notify => Service['collectl'],
    } 
    
    file { "/var/log/collectl":
        owner => "root",
        group => "root", 
        mode => 644,
        ensure => directory,
        recurse => true,
    }

}

