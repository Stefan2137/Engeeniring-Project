//
//  fitappUITests.swift
//  fitappUITests
//
//  Created by Kuba Stefański on 23/09/2023.
//

import XCTest

final class fitappUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }
    
    func testLoginVIew() throws
    {
        
       let app = XCUIApplication()
       let collectionViewsQuery = app.collectionViews
       let emailfield = collectionViewsQuery.textFields["Email Address"]
        XCTAssertTrue(emailfield.exists) //Testing if email field exist
        emailfield.tap()
        emailfield.typeText("kubazab1@wp.pl")
        
        let password = collectionViewsQuery/*@START_MENU_TOKEN@*/.secureTextFields["Password"]/*[[".cells.secureTextFields[\"Password\"]",".secureTextFields[\"Password\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(password.exists) //Testing if password field exist
        password.tap()
        password.typeText("password")
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
    
        let button = app.buttons["Login in"]
        XCTAssertTrue(button.exists) //Testing if Login in button exist
        button.tap()
        sleep(5)
       let homeButton = XCUIApplication().tabBars["Tab Bar"].buttons["Home"]
        XCTAssertTrue(homeButton.exists)//After correct work of login in view testing if main view of application is presented.
                                        
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
