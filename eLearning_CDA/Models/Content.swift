import Foundation

struct Content: Identifiable {
    var id = UUID()
    var imageCourse: String
    var title: String
    var description: String
    var likes: String
    var category: Categories
}

// 12 contenus : 3 Lives, 3 Cours, 3 Jeux, 3 Quizz
let contents: [Content] = [
    // Cours
    Content(imageCourse: "php", title: "PHP Zero to Hero", description: "Formation complète PHP", likes: "9K", category: .course),
    Content(imageCourse: "java", title: "Java Fundamentals", description: "Bases solides en Java", likes: "1K", category: .course),
    Content(imageCourse: "html", title: "Python for Beginners", description: "Débuter avec Python", likes: "900", category: .course),

    // Lives
    Content(imageCourse: "live", title: "Live SwiftUI", description: "Créer une interface moderne", likes: "2K", category: .live),
    Content(imageCourse: "live1", title: "Live DevOps", description: "Docker et CI/CD", likes: "4K", category: .live),
    Content(imageCourse: "live3", title: "Live Cyber", description: "Sécurité web OWASP", likes: "3K", category: .live),

    // Jeux
    Content(imageCourse: "game1", title: "Code Challenge", description: "Jeu de logique", likes: "800", category: .game),
    Content(imageCourse: "game2", title: "Bug Hunter", description: "Trouve les erreurs", likes: "1.2K", category: .game),
    Content(imageCourse: "game3", title: "Algo Race", description: "Course algorithmique", likes: "750", category: .game),

    // Quizz
    Content(imageCourse: "quizz1", title: "Quiz Java", description: "Teste tes bases Java", likes: "2.5K", category: .quizz),
    Content(imageCourse: "quizz2", title: "Quiz Web", description: "HTML CSS JS", likes: "1.8K", category: .quizz),
    Content(imageCourse: "quizz3", title: "Quiz Cyber", description: "Sécurité débutant", likes: "3.1K", category: .quizz)
]
