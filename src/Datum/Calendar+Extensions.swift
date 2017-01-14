//
//  Calendar+Extensions.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-24.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

extension Calendar {
  public func dateComponents(from zonedDateTime: ZonedDateTime) -> DateComponents {
    return self.dateComponents(in: timeZone, from: zonedDateTime.absoluteDateTime.nsdate)
  }
}
