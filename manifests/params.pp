class collectl::params {
    $enablegraphite = hiera("collectl::params::enablegraphite", true)
    $graphiteserver = hiera("collectl::params::graphiteserver", "pplxconfig2.physics.ox.ac.uk")
    $graphiteport   = hiera("collectl::params::graphiteport", "2003")
    
    #Note this is the hostgroup as you wish to appear in graphite/ganglia.  Often these are called clusters.
    #Lets default to unassigned since not everyone will be using hte facter for hostgroup already
    $monitoring_hostgroup      =  hiera("collectl::params::monitoring_hostgroup", "unassigned")

}
