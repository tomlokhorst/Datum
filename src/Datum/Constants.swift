//
//  Constants.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

internal let utcTimeZone = TimeZone(identifier: "UTC")!
internal let utcCalendar = Calendar(timeZone: utcTimeZone)

extension Calendar {
  internal init(timeZone: TimeZone) {
    self.init(identifier: .gregorian)
    self.timeZone = timeZone
  }
}

extension DateComponents {
  internal init(timeZone: TimeZone) {
    self.init()
    self.timeZone = timeZone
  }
}
