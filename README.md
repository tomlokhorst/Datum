Datum
=====

_2015-08-24: This project is in the early concept stage, it is not production ready_

> Datum makes dealing with timezone information explicit.

There are three types of dates that Datum handles:

### Absolute dates: `AbsoluteDateTime`
This date+time is absolute all over the world, no matter what timezone is used for display.
This is often also called "UTC time", because that's the same for everyone all over the world.

Example, the time 10 minutes from now.

```swift
let tenMinutesFromNow = AbsoluteDateTime(dateInUTC: NSDate().dateByAddingTimeInterval(NSTimeInterval(10 * 60)))

print("Ten minutes from now: \(tenMinutesFromNow)")
```


### Relative dates: `RelativeDate` / `RelativeDateTime` / `RelativeTime`

This date (or date+time, or time) is not related to a specific timezone.
It is an abstract concept, rather than related to a specific point in time.

Example, Chrismas 2015 is on December 25th (which is a Friday).
This is December 25th all over the world, rather than in one particular time zone:

```swift
let christmas = RelativeDate.parse("2015-12-25")!
```


### Zoned dates: `ZonedDateTime` / `ZonedDate`

This date+time (or date) is specific to a particular timezone.
Often these are times of events that happen at a particular location.

For example, King Willem-Alexander of The Netherlands was inauguratated April 30th at 14:30 in Amsterdam.
At that sepecific point in time, it already was May 1st in New Zealand.

However when we show that date to someone in New Zealand, we still we often want to show the date of the inauguration as April 30th.
Because that was the date in Amsterdam where the event took place.

```swift
let inauguration = ZonedDateTime.parse("2013-04-30T14:30:00", timeZone: "Europe/Amsterdam")!
```


### Offset dates: `OffsetDateTime` / `OffsetDate`

This date+time (or date) is specific to a particular UTC offset.
It is more useful to known a timezone instead of UTC offset (ZonedDateTime), but sometimes the origin timezone is not known.

In the previous example of the inaugoration of the dutch king, had we not known the Amsterdam timezone, we might have used the UTC offset.

```swift
// Amsterdam was in Daylight Savings Time, with a UTC offset of +2 hours on April 30, 2013
let inauguration = OffsetDateTime.parse("2013-04-30T14:30:00+02:00")!
```


## Parsing API dates

This library is particularly useful for parsing dates from external API's that don't include timezone information in the source string.
For example, an API that produces dates+times without timezone information, but that has documentation which says: _"All times returned by this API are Dutch times"_

```swift
// DateTime from API, without timezone information
let str = "2015-08-24T22:10:05"

// Parse to RelativeDateTime, timezone is left unspecified
let rdt = RelativeDateTime.parse(str)!

// Lookup Amsterdam timezone in OS database
let amsterdam = NSTimeZone(name: "Europe/Amsterdam")!

// Convert unspecific RelativeDateTime to specific ZonedDateTime
let zdt = rdt.zonedDateTimeFor(timezone: amsterdam)

// Now render date in system the system timezone, using format from user preferences
let formatter = NSDateFormatter()
formatter.dateStyle = NSDateFormatterStyle.MediumStyle
formatter.timeStyle = NSDateFormatterStyle.MediumStyle

let displayString = formatter.stringFromDate(zdt.instant)
```

