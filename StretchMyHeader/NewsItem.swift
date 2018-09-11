//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Bennett on 2018-09-11.
//  Copyright © 2018 Bennett. All rights reserved.
//

import Foundation

enum NewsItemCategory: String {
  case World = "World"
  case Americas = "Americas"
  case Europe = "Europe"
  case MiddleEast = "Middle East"
  case Africa = "Africa"
  case AsiaPacific = "Asia Pacific"
}

struct NewsItem{
  var category: NewsItemCategory
  var headline: String
}
