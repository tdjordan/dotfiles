///  Initially from Example on https://github.com/infuxdata/flux
///

// This line is a comment

// Support for traditional math operators
1 + 1

// Several data types are built-in
true                     // a boolean true value
1                        // an int
1.0                      // a float
"this is a string"       // a string literal
1h5m                     // a duration of time representing 1 hour and 5 minutes
2018-10-10               // a time starting at midnight for the default timezone on Oct 10th 2018
2018-10-10T10:05:00      // a time at 10:05 AM for the default timezone on Oct 10th 2018
[1,1,2]                  // an array of integers
{foo: "str", bar: false} // an object with two keys and their values

// Values can be assigned to identifiers
x = 5.0
x + 3.0 // 8.0

// Import libraries
import "math"

// Call functions always using keyword arguments
math.pow(x: 5.0, y: 3.0) // 5^3 = 125

// Functions are defined by assigning them to identifiers
add = (a, b) => a + b

// Call add using keyword arguments
add(a: 5, b: 3) // 8

// Functions are polymorphic
add(a: 5.5, b: 2.5) // 8.0

// And strongly typed
add(a: 5, b: 2.5) // type error

// Access data from a database and store it as an identifier
// This is only possible within the influxdb repl (at the moment).
import "influxdata/influxdb"
data = influxdb.from(bucket:"telegraf/autogen")

// When running inside of influxdb, the import isn't needed.
data = from(bucket:"telegraf/autogen")

// Chain more transformation functions to further specify the desired data
cpu = data
    // only get the last 5m of data
    |> range(start: -5m)
    // only get the "usage_user" data from the _measurement "cpu"
    |> filter(fn: (r) => r._measurement == "cpu" and r._field == "usage_user")

// Return the data to the client
cpu |> yield()

// Group an aggregate along different dimensions
cpu
    // organize data into groups by host and region
    |> group(columns:["host","region"])
    // compute the mean of each group
    |> mean()
    // yield this result to the client
    |> yield()

// Window an aggregate over time
cpu
    // organize data into groups of 1 minute
    // compute the mean of each group
    |> aggregateWindow(every: 1m, fn: mean)
    // yield this result to the client
    |> yield()

// Gather different data
mem = data
    // only get the last 5m of data
    |> range(start: -5m)
    // only get the "used_percent" data from the _measurement "mem"
    |> filter(fn: (r) => r._measurement == "mem" and r._field == "used_percent")


// Join data to create wider tables and map a function over the result
join(tables: {cpu:cpu, mem:mem}, on:["_time", "host"])
    // compute the ratio of cpu usage to mem used_percent
    |> map(fn:(r) => {_time: r._time, _value: r._value_cpu / r._value_mem)
    // again yield this result to the client
    |> yield()
