//
//  Movie.swift
//  Cinetopia
//
//  Created by Douglas Gomes on 29/09/25.
//

import Foundation

struct Movie {
    let id: Int
    let title: String
    let image: String
    let synopsis: String
    let rate: Double
    let releaseData: String
}

let movies : [Movie] = [
    Movie(
        id: 1,
        title: "Avatar",
        image: "avatar",
        synopsis: "Descreve a história de Jake Sully, um ex-fuzileiro naval paraplégico que vai ao planeta Pandora. Lá, ele participa do programa Avatar, que permite que humanos controlem corpos de seres nativos, os Na'vi, para interagir com o ambiente alienígena. Sully se apaixona por uma Na'vi e se envolve na luta pela sobrevivência do povo e do planeta contra a exploração humana por minerais valiosos.",
        rate: 9.4,
        releaseData: "18/12/2009"
    ),
    Movie(
        id: 2,
        title: "Harry Potter e a Pedra Filosofal",
        image: "harry potter",
        synopsis: "Conta a história de Harry, um órfão que descobre ser um bruxo e recebe um convite para estudar na Escola de Magia e Bruxaria de Hogwarts, onde vive suas primeiras aventuras com Rony e Hermione",
        rate: 9.3,
        releaseData: "17/11/2001"
    ),
    Movie(
        id: 3,
        title: "Vingadores: Guerra infinita",
        image: "vingadores",
        synopsis: "Descreve a formação da equipa de super-heróis para combater a ameaça de Loki, que procura dominar a Terra através do Cubo Mágico, unindo o Capitão América, Homem de Ferro, Thor, Hulk, Viúva Negra e Gavião Arqueiro",
        rate: 8.9,
        releaseData: "17/11/2019"
    ),
    
]
