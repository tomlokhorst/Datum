//
//  NSDateFormatter+Extensions.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-08-24.
//  Copyright © 2015 nonstrict. All rights reserved.
//

import Foundation

extension NSDateFormatter {
  public func stringFromZonedDateTime(zonedDateTime: ZonedDateTime) -> String {
    let previousTimeZone = self.timeZone
    self.timeZone = zonedDateTime.timeZone

    let str = self.stringFromDate(zonedDateTime.absoluteDateTime.nsdate)
    self.timeZone = previousTimeZone

    return str
  }

  public func stringFromOffsetDateTime(offsetDateTime: OffsetDateTime) -> String {
    let previousTimeZone = self.timeZone
    self.timeZone = NSTimeZone(forSecondsFromGMT: Int(offsetDateTime.utcOffset))

    let str = self.stringFromDate(offsetDateTime.absoluteDateTime.nsdate)
    self.timeZone = previousTimeZone

    return str
  }
}
