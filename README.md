# Events Consolidator [![Build Status](https://travis-ci.org/mariusbutuc/events-consolidator.svg?branch=proposed-solution)](https://travis-ci.org/mariusbutuc/events-consolidator)

Reduce date-based events

## Problem description

Here is an example of an array of date-based events:

```ruby
input = [
  {date: '2014-01-01', a: 5, b:1},
  {date: '2014-01-01', xyz: 11},
  {date: '2014-10-10', qbz: 5},
  {date: '2014-10-10', v: 4, q: 1, strpm: -99},
  # …
]
```

Consume events and produce an array of hashes:

```ruby
output = [
  {date: 2014-01-01, a: 5, b:1, xyz: 11 },
  {date: 2014-10-10, qbz: 5, v: 4, q: 1, strpm: -99},
  # …
]
```

When writing your solution please expect that the input data above is just an example. Your class and tests should handle a variety of scenarios and input data. Quality is important, so please keep that in mind when solving the problem.

## Lesson ([re-](https://twitter.com/mariusbutuc/status/768793133790273537))learnt

> First, solve the problem. Then, write the code.
