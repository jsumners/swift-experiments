# json-rfc3339

This experiment is for learning how to parse
[RFC 3339](https://www.rfc-editor.org/rfc/rfc3339) strings. In particular,
it targets `date-time` strings.

This experiment is a combination of learnings from:

+ https://stackoverflow.com/questions/65974707/how-do-i-decode-date-json-into-swift-model
+ https://stackoverflow.com/questions/28016578/how-can-i-parse-create-a-date-time-stamp-formatted-with-fractional-seconds-utc
+ https://stackoverflow.com/questions/46161848/swift-dates-are-equivalent-under-30-nanoseconds

## Summary

In short, date/time strings are parsed by `DateFormatter` instances. But
Internet time strings have been a bit cumbersome in Swift. In particular,
the possible fractional seconds are not very well supported.

The result is that we need to extend the `JSONDecoder.DateDecodingStrategy`
object with a new strategy that utilizes a configured formatter
to decode such strings. Second, we must configure the `JSONDecoder`
instance used for decoding to utilize the new strategy. With these in place,
any JSON field mapped as a `Date` will be decoded correctly.
