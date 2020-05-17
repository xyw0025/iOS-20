//
//  Movie.swift
//  Lab08
//
//  Created by Wen Hsin-Yu on 2020/5/6.
//  Copyright © 2020 Wen Hsin-Yu. All rights reserved.
//

import Foundation
struct Movie {
    let title: String
    let language: String
    let date: String
    let id = UUID()
}

extension Movie: Identifiable {}
let movieData = [
    Movie(title: "刺激1995", language: "英文", date: "上映日期：2020/03/13"),
    Movie(title: "壞教育", language: "英文", date: "上映日期：2020/03/13"),
    Movie(title: "海上鋼琴師", language: "英文", date: "上映日期：2020/03/16"),
    Movie(title: "寄生上流", language: "韓文", date: "上映日期：2019/05/08"),
    Movie(title: "小丑", language: "英文", date: "上映日期：2019/10/03")
]
