//
//  InsuranceResponseModel.swift
//  Tesla_POC
//
//  Created by ANUJ KUMAR on 22/07/22.
//

import Foundation

struct ProductList:Decodable
{
    let id:Int
    let name:String
    let description:String
    let company:String
    let imageUrl:String?
}

