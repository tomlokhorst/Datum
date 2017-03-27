//
//  Converters.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

extension RelativeDateTime {
  public var date: RelativeDate {
    let calendar = Calendar(timeZone: utcTimeZone)
    var components = calendar.dateComponents(in: utcTimeZone, from: nsdate)
    components.hour = 0
    components.minute = 0
    components.second = 0
    components.nanosecond = 0

    return RelativeDate(nsdate: components.date!)
  }

  public var time: RelativeTime {
    let calendar = Calendar(timeZone: utcTimeZone)
    var components = calendar.dateComponents(in: utcTimeZone, from: nsdate)
    components.year = 0
    components.month = 0
    components.day = 0

    return RelativeTime(components: components)
  }

  public func zonedDateTime(for timeZone: TimeZone) -> ZonedDateTime {
    let date = nsdate.addingTimeInterval(-TimeInterval(timeZone.secondsFromGMT(for: nsdate)))
    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return ZonedDateTime(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public var zonedDateTimeForUTC: ZonedDateTime {
    return ZonedDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: nsdate), timeZone: utcTimeZone)
  }

  public func offsetDateTime(for utcOffset: OffsetInSeconds) -> OffsetDateTime {
    let date = nsdate.addingTimeInterval(-TimeInterval(utcOffset))
    let absoluteDateTime = AbsoluteDateTime(nsdate: date)

    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }

  public var offsetDateTimeForUTC: OffsetDateTime {
    return OffsetDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: nsdate), utcOffset: 0)
  }
}

extension RelativeDate {
  public var midnight: RelativeDateTime {
    return RelativeDateTime(nsdate: nsdate)
  }

  public func with(time: RelativeTime) -> RelativeDateTime {
    let resultDate = utcCalendar.date(byAdding: time.components, to: self.nsdate)!

    return RelativeDateTime(nsdate: resultDate)
  }

  public func zonedDate(for timeZone: TimeZone) -> ZonedDate {
    return midnight.zonedDateTime(for: timeZone).date
  }

  public var zonedDateForUTC: ZonedDate {
    return midnight.zonedDateTimeForUTC.date
  }

  public func offsetDate(for utcOffset: OffsetInSeconds) -> OffsetDate {
    return midnight.offsetDateTime(for: utcOffset).date
  }

  public var offsetDateForUTC: OffsetDate {
    return midnight.offsetDateTimeForUTC.date
  }
}

extension ZonedDateTime {
  public var date: ZonedDate {
    let calendar = Calendar(identifier: .gregorian)
    var components = calendar.dateComponents(in: timeZone, from: absoluteDateTime.nsdate)
    components.hour = 0
    components.minute = 0
    components.second = 0
    components.nanosecond = 0

    return ZonedDate(absoluteDateTime: AbsoluteDateTime(nsdate: components.date!), timeZone: timeZone)
  }

  public func with(timeZone: TimeZone) -> ZonedDateTime {
    return ZonedDateTime(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public var offsetDateTime: OffsetDateTime {
    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: timeZone.secondsFromGMT())
  }

  public var relativeDateTimeWithoutTimeZone: RelativeDateTime {
    let date = absoluteDateTime.nsdate.addingTimeInterval(TimeInterval(timeZone.secondsFromGMT()))

    return RelativeDateTime(nsdate: date)
  }
}

extension ZonedDate {
  public var midnight: ZonedDateTime {
    return ZonedDateTime(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public func with(time: RelativeTime) -> ZonedDateTime {
    let resultDate = utcCalendar.date(byAdding: time.components, to: absoluteDateTime.nsdate)!

    return ZonedDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: resultDate), timeZone: timeZone)
  }

  public func zonedDate(for timeZone: TimeZone) -> ZonedDate {
    return ZonedDate(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public var offsetDate: OffsetDate {
    return OffsetDate(absoluteDateTime: absoluteDateTime, utcOffset: timeZone.secondsFromGMT())
  }

  public var relativeDateWithoutTimeZone: RelativeDate {
    let date = absoluteDateTime.nsdate.addingTimeInterval(TimeInterval(timeZone.secondsFromGMT()))

    return RelativeDate(nsdate: date)
  }
}

extension OffsetDateTime {
  public var date: OffsetDate {
    let timeZone = TimeZone(secondsFromGMT: utcOffset)

    let calendar = Calendar(identifier: .gregorian)
    var components = calendar.dateComponents(in: timeZone!, from: absoluteDateTime.nsdate)
    components.hour = 0
    components.minute = 0
    components.second = 0
    components.nanosecond = 0

    return OffsetDate(absoluteDateTime: AbsoluteDateTime(nsdate: components.date!), utcOffset: utcOffset)
  }

  public func with(utcOffset: OffsetInSeconds) -> OffsetDateTime {
    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }

  public func zonedDateTime(for timeZone: TimeZone) -> ZonedDateTime {
    return ZonedDateTime(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public var relativeDateTimeWithoutUTCOffset: RelativeDateTime {
    let date = absoluteDateTime.nsdate.addingTimeInterval(TimeInterval(utcOffset))

    return RelativeDateTime(nsdate: date)
  }
}

extension OffsetDate {
  public var midnight: OffsetDateTime {
    return OffsetDateTime(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }

  public func with(time: RelativeTime) -> OffsetDateTime {
    let resultDate = utcCalendar.date(byAdding: time.components, to: absoluteDateTime.nsdate)!

    return OffsetDateTime(absoluteDateTime: AbsoluteDateTime(nsdate: resultDate), utcOffset: utcOffset)
  }

  public func with(utcOffset: OffsetInSeconds) -> OffsetDate {
    return OffsetDate(absoluteDateTime: absoluteDateTime, utcOffset: utcOffset)
  }

  public func zonedDate(for timeZone: TimeZone) -> ZonedDate {
    return ZonedDate(absoluteDateTime: absoluteDateTime, timeZone: timeZone)
  }

  public var relativeDateWithoutUTCOffset: RelativeDate {
    let date = absoluteDateTime.nsdate.addingTimeInterval(TimeInterval(utcOffset))

    return RelativeDate(nsdate: date)
  }
}
