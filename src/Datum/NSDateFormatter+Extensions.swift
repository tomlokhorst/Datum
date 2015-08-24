//
//  NSDateFormatter+Extensions.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-08-24.
//  Copyright © 2015 nonstrict. All rights reserved.
//

import Foundation

extension NSDateFormatter {
  public func stringFromLocalDateTime(localDateTime: LocalDateTime) -> String {
    let previousTimeZone = self.timeZone
    self.timeZone = localDateTime.local.timeZone

    let str = self.stringFromDate(localDateTime.nsdate)
    self.timeZone = previousTimeZone

    return str
  }
}
