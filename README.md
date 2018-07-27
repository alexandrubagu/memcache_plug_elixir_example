# Sample app with Memcache, Plug, Cowboy in Elixir 

- store "key" into GenServer state
- perform update on "key" each 200ms

## Benchmark

```alexandru.bagu$ wrk -t10 -c10000 --latency http://localhost:8080/get
Running 10s test @ http://localhost:8080/get
  10 threads and 10000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    10.97ms    7.85ms 115.64ms   84.50%
    Req/Sec     2.08k   768.34     5.86k    72.22%
  Latency Distribution
     50%    9.21ms
     75%   13.16ms
     90%   18.82ms
     99%   43.18ms
  206742 requests in 10.10s, 39.86MB read
  Socket errors: connect 9759, read 8799, write 3, timeout 0
Requests/sec:  20476.96
Transfer/sec:      3.95MB```

