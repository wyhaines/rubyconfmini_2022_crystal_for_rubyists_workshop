require "benchmark"

def fib(n)
    if n < 2
        n
    else
        fib(n - 2) + fib(n - 1)
    end
end

Benchmark.bm do |bm|
  bm.report {puts fib(42_u64)}
end
