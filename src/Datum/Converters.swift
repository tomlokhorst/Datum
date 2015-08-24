//
//  Converters.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

extension RelativeDateTime {
  public var localDateTimeForUTC: LocalDateTime {
    return LocalDateTime(nsdate: nsdate, local: Local.UTCOffset(0))
  }

  public func localDateTimeFor(timezone timezone: NSTimeZone) -> LocalDateTime {
    var date = nsdate
    date = date.dateByAddingTimeInterval(-NSTimeInterval(timezone.secondsFromGMTForDate(date)))
    return LocalDateTime(nsdate: date, local: Local.TimeZone(timezone))
  }

  public func localDateTimeFor(utcOffset utcOffset: NSTimeInterval) -> LocalDateTime {
    var date = nsdate
    date = date.dateByAddingTimeInterval(-utcOffset)
    return LocalDateTime(nsdate: date, local: Local.UTCOffset(utcOffset))
  }
}
