//
//  RESTManager.swift
//  Mester
//
//  Created by Ruslan Alikhamov on 17/01/15.
//  Copyright (c) 2015 Ruslan Alikhamov. All rights reserved.
//

import UIKit
import Networking

typealias CompletionBlock = (AnyObject?, XTResponseError?) -> ()

class RESTManager: XTOperationManager {
	
	class func fetchProjects(completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/projects"
		let operation = XTRequestOperation(URL: comps.URL, type: .GET, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			var result: AnyObject? = responseObj?["result"]?
			if !(result is NSArray) {
				error = XTResponseError(errorCode: .InvalidResponseFormat, message: "Invalid response")
				completionBlock(nil, error)
				return;
			} else {
				let status: AnyObject? = responseObj?["status"]?
				let statusStr = status as? NSString
				if statusStr != "ok" {
					error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
				}
			}
			completionBlock(result, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func fetchTestCases(projectID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/project/\(projectID)/testcases"
		let operation = XTRequestOperation(URL: comps.URL, type: .GET, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			var result: AnyObject? = responseObj?["result"]?
			if !(result is NSArray) {
				error = XTResponseError(errorCode: .InvalidResponseFormat, message: "Invalid response")
				completionBlock(nil, error)
				return;
			} else {
				let status: AnyObject? = responseObj?["status"]?
				let statusStr = status as? String
				if statusStr != "ok" {
					error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
				}
			}
			completionBlock(result, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func createProject(project projectDic: [String: AnyObject]!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/project"
		let operation = XTRequestOperation(URL: comps.URL, type: .POST, dataDic: projectDic, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			let status: AnyObject? = responseObj?["status"]?
			let statusStr = status as? String
			if statusStr != "ok" {
				error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
			}
			completionBlock(nil, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func deleteProject(projectID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/project/\(projectID)"
		let operation = XTRequestOperation(URL: comps.URL, type: .DELETE, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			let status: AnyObject? = responseObj?["status"]?
			let statusStr = status as? String
			if statusStr != "ok" {
				error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
			}
			completionBlock(nil, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func createTestCase(testCase testCaseDic: [String: AnyObject]!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/testcase"
		let operation = XTRequestOperation(URL: comps.URL, type: .POST, dataDic: testCaseDic, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			let status: AnyObject? = responseObj?["status"]?
			let statusStr = status as? String
			if statusStr != "ok" {
				error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
			}
			completionBlock(nil, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func deleteTestCase(testCaseID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/testcase/\(testCaseID)"
		let operation = XTRequestOperation(URL: comps.URL, type: .DELETE, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			let status: AnyObject? = responseObj?["status"]?
			let statusStr = status as? String
			if statusStr != "ok" {
				error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
			}
			completionBlock(nil, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func createTestStep(testStep testStepDic: [String: AnyObject]!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/step"
		let operation = XTRequestOperation(URL: comps.URL, type: .POST, dataDic: testStepDic, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			let status: AnyObject? = responseObj?["status"]?
			let statusStr = status as? String
			if statusStr != "ok" {
				error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
			}
			completionBlock(nil, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func deleteTestStep(testStepID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/step/\(testStepID)"
		let operation = XTRequestOperation(URL: comps.URL, type: .DELETE, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			let status: AnyObject? = responseObj?["status"]?
			let statusStr = status as? String
			if statusStr != "ok" {
				error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
			}
			completionBlock(nil, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func fetchTestSteps(testCaseID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/testcase/\(testCaseID)/steps"
		let operation = XTRequestOperation(URL: comps.URL, type: .GET, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			var result: AnyObject? = responseObj?["result"]?
			if !(result is NSArray) {
				error = XTResponseError(errorCode: .InvalidResponseFormat, message: "Invalid response")
				completionBlock(nil, error)
				return;
			} else {
				let status: AnyObject? = responseObj?["status"]?
				let statusStr = status as? String
				if statusStr != "ok" {
					error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
				}
			}
			completionBlock(result, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func fetchTests(projectID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/project/\(projectID)/tests"
		let operation = XTRequestOperation(URL: comps.URL, type: .GET, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			var result: AnyObject? = responseObj?["result"]?
			if !(result is NSArray) {
				error = XTResponseError(errorCode: .InvalidResponseFormat, message: "Invalid response")
				completionBlock(nil, error)
				return;
			} else {
				let status: AnyObject? = responseObj?["status"]?
				let statusStr = status as? String
				if statusStr != "ok" {
					error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
				}
			}
			completionBlock(result, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func createTest(projectID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/project/\(projectID)/test"
		let operation = XTRequestOperation(URL: comps.URL, type: .POST, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			var result: AnyObject? = responseObj?["result"]?
			if !(result is NSDictionary) {
				error = XTResponseError(errorCode: .InvalidResponseFormat, message: "Invalid response")
				completionBlock(nil, error)
				return;
			} else {
				let status: AnyObject? = responseObj?["status"]?
				let statusStr = status as? String
				if statusStr != "ok" {
					error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
				}
			}
			completionBlock(result, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func startTest(testID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/test/\(testID)/start"
		let operation = XTRequestOperation(URL: comps.URL, type: .PUT, dataDic: nil, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			var result: AnyObject? = responseObj?["result"]?
			if !(result is NSDictionary) {
				error = XTResponseError(errorCode: .InvalidResponseFormat, message: "Invalid response")
				completionBlock(nil, error)
				return;
			} else {
				let status: AnyObject? = responseObj?["status"]?
				let statusStr = status as? String
				if statusStr != "ok" {
					error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
				}
			}
			completionBlock(result, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
	class func submitTest(test testDic: [String: AnyObject]!, testID: String!, completionBlock: CompletionBlock!) {
		let comps: NSURLComponents = RESTManager.URLComponents()
		comps.path = "/test/\(testID)/submit"
		let operation = XTRequestOperation(URL: comps.URL, type: .PUT, dataDic: testDic, contentType: "application/json") { responseObj, responseError in
			var error: XTResponseError? = nil;
			if let err = responseError {
				error = XTResponseError(code: err.code, message: err.localizedDescription)
			}
			var result: AnyObject? = responseObj?["result"]?
			if !(result is NSDictionary) {
				error = XTResponseError(errorCode: .InvalidResponseFormat, message: "Invalid response")
				completionBlock(nil, error)
				return;
			} else {
				let status: AnyObject? = responseObj?["status"]?
				let statusStr = status as? String
				if statusStr != "ok" {
					error = XTResponseError(errorCode: .ValidationError, message: "Invalid request format")
				}
			}
			completionBlock(result, error)
		}
		RESTManager.scheduleOperation(operation);
	}
	
}
