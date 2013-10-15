class collectl::params {
    $enablegraphite = hiera("collectl::params::enablegraphite", true)
    $graphiteserver = hiera("collectl::params::graphiteserver", "pplxconfig2.physics.ox.ac.uk")
    $graphiteport   = hiera("collectl::params::graphiteport", "2003")
}
