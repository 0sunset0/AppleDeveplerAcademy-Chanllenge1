//
//  Level.swift
//  challenge1
//
//  Created by 노을 on 4/21/26.
//

import Foundation

enum Level: CaseIterable {
    case egg
    case baby
    case teen
    case adult
    case master
    
    static func from(completedCount: Int) -> Level {
        switch completedCount {
        case 0..<5:   return .egg
        case 5..<10:  return .baby
        case 10..<15: return .teen
        case 15..<20: return .adult
        default:      return .master
        }
    }

    // 현재 레벨 내 진행도 (0.0 ~ 1.0)
    static func progressRatio(completedCount: Int) -> Double {
        switch completedCount {
        case 0..<5:   return Double(completedCount) / 5.0
        case 5..<10:  return Double(completedCount - 5) / 5.0
        case 10..<15: return Double(completedCount - 10) / 5.0
        case 15..<20: return Double(completedCount - 15) / 5.0
        default:      return 1.0
        }
    }
}
