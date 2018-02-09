# Assumes Amazon Linux
include '::ko_cloudwatch'

ko_cloudwatch::log { 'Messages':
  path => '/var/log/messages',
}
ko_cloudwatch::log { 'Secure':
  path => '/var/log/secure',
}
