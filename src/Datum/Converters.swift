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
    return LocalDateTime(timeinterval: timeinterval, local: Local.UTCOffset(0))
  }

  public func localDateTimeFor(# timezone: NSTimeZone) -> LocalDateTime {
    return LocalDateTime(timeinterval: timeinterval, local: Local.TimeZone(timezone))
  }

  public func localDateTimeFor(# utcOffset: NSTimeInterval) -> LocalDateTime {
    return LocalDateTime(timeinterval: timeinterval, local: Local.UTCOffset(utcOffset))
  }
}
