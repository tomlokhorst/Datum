//
//  Types.swift
//  Datum
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import Foundation

enum Local {
  case TimeZone(NSTimeZone)
  case UTCOffset(NSTimeInterval)
}

public struct LocalDateTime {
  internal let timeinterval: NSTimeInterval
  internal let local: Local
}

public struct LocalDate {
  internal let timeinterval: NSTimeInterval
  internal let local: Local
}

public struct LocalTime {
  internal let timeinterval: NSTimeInterval
  internal let local: Local
}

public struct RelativeDateTime {
  internal let timeinterval: NSTimeInterval
}

public struct RelativeDate {
  internal let timeinterval: NSTimeInterval
}

public struct RelativeTime {
  internal let timeinterval: NSTimeInterval
}

public enum HammerTime {
  /* Can't touch this */
}
