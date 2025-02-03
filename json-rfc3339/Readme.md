# json-rfc3339

This experiment is for learning how to parse
[RFC 3339](https://www.rfc-editor.org/rfc/rfc3339) strings. In particular,
it targets `date-time` and `full-date` strings.

This experiment is a combination of learnings from:

+ https://stackoverflow.com/questions/65974707/how-do-i-decode-date-json-into-swift-model
+ https://stackoverflow.com/questions/28016578/how-can-i-parse-create-a-date-time-stamp-formatted-with-fractional-seconds-utc
+ https://stackoverflow.com/questions/46161848/swift-dates-are-equivalent-under-30-nanoseconds

As of 2025-02-01, this experiment has been updated to reflect new learnings
and recommendations. The original version is available at
https://github.com/jsumners/swift-experiments/tree/3ac30c6422d9596849436dad360f9b3a8d4a0be7/json-rfc3339.

## Summary

In short, Internet time strings have been a bit cumbersome in Swift.
In particular, the possible fractional seconds are not very well supported.
To parse them, we need to define `ParseStrategy`s for the date/time strings.
Subsequently, we need to extend the `JSONDecoder.DateDecodingStrategy` with
a new method that attempts to decode the strings in the formats we are
expecting. finally, we must configure the `JSONDecoder`
instance used for decoding to utilize the new strategy. With these in place,
any JSON field mapped as a `Date` will be decoded correctly.
