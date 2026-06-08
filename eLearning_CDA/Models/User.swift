import Foundation

struct User: Identifiable {
    var id = UUID()
    var lastName: String
    var firstName: String
    var profilPicture: String
    var year: Int
    var userBio: String
    var typeProfil: Bool
    var job: String

    // Relation One To Many :
    // Un User possède plusieurs Content
    var content: [Content] = []
}

// 5 utilisateurs avec relation vers plusieurs contenus
let users: [User] = [
    User(
        lastName: "Assabbour",
        firstName: "Jaouad",
        profilPicture: "jaouad",
        year: 8,
        userBio: "Formateur DevSecOps, Java, Angular et Cloud.",
        typeProfil: true,
        job: "Expert Java",
        content: [
            contents[0],
            contents[1],
            contents[2],
            contents[4]
        ]
    ),

    User(
        lastName: "Martin",
        firstName: "Claire",
        profilPicture: "karima",
        year: 5,
        userBio: "Développeuse web spécialisée en frontend.",
        typeProfil: false,
        job: "Expert SwiftUI",
        content: [
            contents[3],
            contents[6],
            contents[10]
        ]
    ),

    User(
        lastName: "Benali",
        firstName: "awatif",
        profilPicture: "louise",
        year: 6,
        userBio: "Consultant cybersécurité et réseau.",
        typeProfil: true,
        job: "Expert Cybersecurity",
        content: [
            contents[5],
            contents[8],
            contents[11]
        ]
    ),

    User(
        lastName: "seriac",
        firstName: "Emma",
        profilPicture: "profil4",
        year: 3,
        userBio: "Créatrice de contenus pédagogiques en programmation.",
        typeProfil: false,
        job: "Coach Web",
        content: [
            contents[7],
            contents[9],
            contents[1]
        ]
    ),

    User(
        lastName: "Nguyen",
        firstName: "Lucas",
        profilPicture: "profil5",
        year: 4,
        userBio: "Ingénieur data et formateur Python.",
        typeProfil: true,
        job: "Expert Data",
        content: [
            contents[2],
            contents[3],
            contents[10]
        ]
    )
]
