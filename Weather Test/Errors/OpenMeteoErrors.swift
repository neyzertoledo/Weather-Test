//
//  OpenMeteoErrors.swift
//  Weather Test
//
//  Created by Neyzer Toledo on 28/07/26.
//
import Foundation

enum OpenMeteoError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case invalidDecoding
}
