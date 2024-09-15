SELECT
    latency,
    packetloss,
    packetdupl,
    jitter,
    throughput
FROM
    device_perf
WHERE
    device_id = $ device_id
    AND timestamp > now() - interval '1 day';