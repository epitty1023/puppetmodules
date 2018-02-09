# Assumes Amazon Linux
include '::ko_cloudwatch'

ko_cloudwatch::log { '/var/log/messages': }
ko_cloudwatch::log { '/var/log/secure': }
