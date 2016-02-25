//
//  Protocols.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

public protocol Instant {
  var instant: NSDate { get }
}

extension AbsoluteDateTime : Instant {
  public var instant: NSDate {
    return nsdate
  }
}

extension ZonedDateTime : Instant {
  public var instant: NSDate {
    return absoluteDateTime.nsdate
  }
}

extension OffsetDateTime : Instant {
  public var instant: NSDate {
    return absoluteDateTime.nsdate
  }

}
