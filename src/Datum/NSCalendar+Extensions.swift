//
//  NSCalendar+Extensions.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-24.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

extension NSCalendar {
  public func componentsFrom(zonedDateTime zonedDateTime: ZonedDateTime) -> NSDateComponents {
    return self.componentsInTimeZone(timeZone, fromDate: zonedDateTime.absoluteDateTime.nsdate)
  }
}
