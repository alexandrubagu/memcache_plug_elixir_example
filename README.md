# Sample app with Memcache, Plug, Cowboy in Elixir 

- store "key" into GenServer state
- perform update on "key" each 200ms

## Benchmark

```
alexandru.bagu$ wrk -c 10000 -t 4 --latency http://localhost:8080/get
Running 10s test @ http://localhost:8080/get
  4 threads and 10000 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency     9.38ms    5.62ms 109.09ms   83.57%
    Req/Sec     6.05k     1.43k   11.32k    67.25%
  Latency Distribution
     50%    8.48ms
     75%   11.17ms
     90%   14.67ms
     99%   30.66ms
  241099 requests in 10.04s, 46.49MB read
  Socket errors: connect 9753, read 13447, write 0, timeout 0
Requests/sec:  24002.74
Transfer/sec:      4.63MB
```
