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
  internal let nsdate: NSDate
  internal let local: Local
}

public struct LocalDate {
  internal let nsdate: NSDate
  internal let local: Local
}

public struct LocalTime {
  internal let nsdate: NSDate
  internal let local: Local
}

public struct RelativeDateTime {
  internal let nsdate: NSDate
}

public struct RelativeDate {
  internal let nsdate: NSDate
}

public struct RelativeTime {
  internal let nsdate: NSDate
}

public enum HammerTime {
  /* Can't touch this */
}
