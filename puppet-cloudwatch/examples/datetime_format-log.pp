# Assumes Amazon Linux
include '::ko_cloudwatch'

ko_cloudwatch::log { 'Messages':
  path            => '/var/log/messages',
  datetime_format => '%a %b %d %H:%M:%S.%f',
}
ko_cloudwatch::log { 'Secure':
  path            => '/var/log/secure',
  datetime_format => '%a %b %d %H:%M:%S.%f',
}
