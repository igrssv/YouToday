//
//  Hero.swift
//  YouToday
//
//  Created by Игорь Сысоев on 26.09.2021.
//


struct Biography: Decodable {
    let alignment: String
}

struct Appearance: Decodable {
    let gender: String
    let race: String
}

struct Image: Decodable {
    let url: String
}

struct Hero: Decodable {
    let image: Image
    let name: String
    let appearance: Appearance
    let biography: Biography
}

