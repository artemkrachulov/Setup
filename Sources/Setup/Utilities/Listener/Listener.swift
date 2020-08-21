//
//  Listener.swift
//  
//
//  Created by Artem K on 21.08.2020.
//

import Foundation

public enum ListenerLifecycle {
    case keepObserving
    case stopObserving
}

public enum ListenValue<T: Equatable>: Equatable {
	
	case unknown
	case value(T)
	
	public static func == (lhs: ListenValue<T>, rhs: ListenValue<T>) -> Bool {
		switch (lhs, rhs) {
		case (.unknown, .unknown):
			return true
		case (.value(let vLhs), .value(let vRhs)):
			return vLhs == vRhs
		default:
			return false
		}
	}
}

public protocol ListenerStateDelegate: class {
	associatedtype T: Equatable
	func didUpdateValue(_ value: ListenValue<T>)
	func observeUntilKnown(_ callback: @escaping (ListenValue<T>) -> Void)
}

public protocol Listen: ListenerStateDelegate {
	associatedtype T
    func observe(_ callback: @escaping (ListenValue<T>) -> ListenerLifecycle)
}

public class Listener<T: Equatable>: Listen {

	public typealias Closure = (ListenValue<T>) -> ListenerLifecycle
	
	private var callbacks: [Closure?]
    private var lastKnownState: ListenValue<T>
	
	init(initialState: ListenValue<T>) {
		 callbacks = []
		 lastKnownState = initialState
	 }
	
	public func observe(_ callback: @escaping Closure) {
		if callback(lastKnownState) == .keepObserving {
			callbacks.append(callback)
		}
	}
	
	public func observeUntilKnown(_ callback: @escaping (ListenValue<T>) -> Void) {
		observe { state in
			if state == .unknown {
				return .keepObserving
			} else {
				callback(state)
				return .stopObserving
			}
		}
	}
	
	public func didUpdateValue(_ value: ListenValue<T>) {
        lastKnownState = value
		
        var callbacksToKeep: [Closure?] = []
        
        for entry in callbacks {
            if let ee = entry?(lastKnownState), ee == .keepObserving {
                callbacksToKeep.append(entry)
            }
        }

        callbacks = callbacksToKeep
	}
}
