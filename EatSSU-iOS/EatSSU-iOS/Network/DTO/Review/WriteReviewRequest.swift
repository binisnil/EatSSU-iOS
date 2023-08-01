//
//  WriteReviewRequest.swift
//  EatSSU-iOS
//
//  Created by 박윤빈 on 2023/05/24.
//

import UIKit

struct WriteReviewRequest: Codable {
    let mainGrade: Int
    let amountGrade: Int
    let tasteGrade: Int
    let content: String

    init(mainGrade: Int, amountGrade: Int, tasteGrade: Int, content: String) {
        self.mainGrade = mainGrade
        self.amountGrade = amountGrade
        self.tasteGrade = tasteGrade
        self.content = content
    }
}
