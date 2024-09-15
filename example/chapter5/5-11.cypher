CALL apoc.dv.catalog.add('metrics-by-device-id', {
  type: 'JDBC',
  url: 'jdbc:postgresql://localhost/metrics_collector?user=bob&password=bobby',
  labels: ['Town', 'PopulatedPlace'],
  query: "SELECT latency, packetloss, packetdupl, jitter, throughput FROM device_perf where device_id = $device_id and timestamp > now() - interval '1 day'",
  desc: 'french towns by department number'
})