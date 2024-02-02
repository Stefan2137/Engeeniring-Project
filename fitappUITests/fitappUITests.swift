//
//  fitappUITests.swift
//  fitappUITests
//
//  Created by Kuba Stefański on 23/09/2023.
//

import XCTest

final class fitappUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    
    func testLoginVIew() throws
    {
        
       let app = XCUIApplication()
       let collectionViewsQuery = app.collectionViews
       let usernamefield = collectionViewsQuery/*@START_MENU_TOKEN@*/.textFields["Email Address"]/*[[".cells.textFields[\"Email Address\"]",".textFields[\"Email Address\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(usernamefield.exists)
        usernamefield.tap()
        usernamefield.typeText("kubazab1@wp.pl")
        
        let password = collectionViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".cells.secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(password.exists)
        password.tap()
        password.typeText("password")
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    
        
        
        let button = app.buttons["Login in"]
        XCTAssertTrue(button.exists)
        button.tap()
        sleep(5)
       let homeButton = XCUIApplication().tabBars["Tab Bar"].buttons["Home"]
        XCTAssertTrue(homeButton.exists)
                                        
    }
  
        func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
