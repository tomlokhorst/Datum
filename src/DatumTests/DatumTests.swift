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

    let rdt = RelativeDateTime.parse("2015-03-06T09:28:42")!
    println("Relative   \(rdt)")
    println("Amsterdam  \(rdt.localDateTimeFor(timezone: amsterdam))")
    println("Sydney     \(rdt.localDateTimeFor(timezone: sydney))")
    println("Brisbane   \(rdt.localDateTimeFor(timezone: brisbane))")
    println("New York   \(rdt.localDateTimeFor(timezone: newyork))")
    println("15mins     \(rdt.localDateTimeFor(utcOffset: NSTimeInterval(15 * 60)))")
    XCTAssert(true, "Pass")
  }

  func testLocal() {

    let ldt = LocalDateTime.parse("2015-03-06T09:28:42+03:00")!
    println("Local   \(ldt)")
    XCTAssert(true, "Pass")
  }

  func testPerformanceParse() {
    self.measureBlock() {
      for (var i = 0; i < 10000; i++) {
        RelativeDateTime.parse("2015-05-06T09:28:42")
      }
    }
  }
}
