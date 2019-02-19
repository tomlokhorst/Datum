//
//  Types+Extensions.swift
//  Datum
//
//  Created by Tom Lokhorst on 2016-02-25.
//  Copyright © 2016 nonstrict. All rights reserved.
//

import Foundation

extension RelativeTime {
  public var hour: Int {
    return components.hour!
  }

  public var minute: Int {
    return components.minute!
  }

  public var second: Int {
    return components.second!
  }
}
