//
//  DatumTests.swift
//  DatumTests
//
//  Created by Tom Lokhorst on 2015-06-05.
//  Copyright (c) 2015 nonstrict. All rights reserved.
//

import UIKit
import XCTest
import Datum

class DatumTests: XCTestCase {

  func testRelative() {
    //    println(NSTimeZone.knownTimeZoneNames())
    let amsterdam = NSTimeZone(name: "Europe/Amsterdam")!
    let sydney = NSTimeZone(name: "Australia/Sydney")!
    let brisbane = NSTimeZone(name: "Australia/Brisbane")!
    let newyork = NSTimeZone(name: "America/New_York")!
    let hawaii = NSTimeZone(name: "US/Hawaii")!

    let rdt = RelativeDateTime.parse("2015-03-06T09:28:42")!
    print("Relative   \(rdt)")
    print("Date       \(rdt.date)")
    print("UTC        \(rdt.localDateTimeForUTC)")
    print("Amsterdam  \(rdt.localDateTimeFor(timezone: amsterdam))")
    print("Sydney     \(rdt.localDateTimeFor(timezone: sydney))")
    print("Brisbane   \(rdt.localDateTimeFor(timezone: brisbane))")
    print("New York   \(rdt.localDateTimeFor(timezone: newyork))")
    print("Hawaii     \(rdt.localDateTimeFor(timezone: hawaii))")
    print("15mins     \(rdt.localDateTimeFor(utcOffset: NSTimeInterval(15 * 60)))")
    XCTAssert(true, "Pass")
  }

  func testLocal() {

    let ldt = LocalDateTime.parse("2015-03-06T09:28:42+03:00")!
    print("Local   \(ldt)")
    XCTAssert(true, "Pass")
  }

  func testPerformanceParse() {
    self.measureBlock() {
      let count = 1 // 10000
      for (var i = 0; i < count; i++) {
        RelativeDateTime.parse("2015-05-06T09:28:42")
      }
    }
  }
}
