import SwiftUI
// Vue qui représente l'écran de discussion
struct ChatView: View {
    @State private var messageText: String = ""
    let conversation: Message
    @State private var messages: [Conversation] = [
        Conversation(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", isMe: false),
        Conversation(text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", isMe: true),
        Conversation(text: "when an unknown printer took a galley of type and scrambled it to make a type", isMe: false),
        Conversation(text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", isMe: true),
        Conversation(text: "when an unknown printer took a galley of type and scrambled it to make a type", isMe: false)
    ]
var body: some View {
            NavigationStack {

                VStack {

                    ScrollView {       // Zone scrollable pour afficher les messages
                        VStack(spacing: 12) {
                            ForEach(messages) { message in    // Parcourt le tableau messages
                                MessageBubble(message: message) // Affiche une bulle pour chaque message
                            }
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                    }
                    // Barre de saisie du message
                    ChatInputBar(text: $messageText) {
                        sendMessage()
                    }
                }
                .navigationTitle(conversation.name) // Nom du contact
                .navigationBarTitleDisplayMode(.inline) // Titre affiché en petit au centre
            }
        }
//ajoute un message
// Fonction appelée lorsqu'on clique sur le bouton envoyer
        private func sendMessage() {
            guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
            // Vérifie que le message n'est pas vide
            // Ajoute un nouveau message dans le tableau
            messages.append(Conversation(text: messageText, isMe: true))
            messageText = ""  // Vide le champ de saisie après l'envoi
        }
    }


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(
            conversation: Message(
                name: "Colette",
                lastMessage: "Bonjour",
                image: "colette"
            )
        )
    }
}
