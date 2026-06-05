import SwiftUI

struct ChatView: View {
    //@State private var  conversation: Meesage
    @State private var messageText: String = ""
    
    @State private var messages: [Messages] = [
        Messages(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry", isMe: false),
        Messages(text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", isMe: true),
        Messages(text: "when an unknown printer took a galley of type and scrambled it to make a type", isMe: false),
        Messages(text: "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s", isMe: true),
        Messages(text: "when an unknown printer took a galley of type and scrambled it to make a type", isMe: false)
    ]
    
    var body: some View {
        NavigationView {
            ZStack {

                VStack {
                    
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(messages) { message in
                                MessageBubble(message: message)
                            }
                        }
                        .padding(.top, 10)
                        .padding(.horizontal)
                    }
                    
                    ChatInputBar(text: $messageText) {
                        sendMessage()
                    }
                }
            }
            .navigationTitle("Nom et prenom")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func sendMessage() {
        guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        messages.append(Messages(text: messageText, isMe: true))
        messageText = ""
    }
}

struct MessageBubble: View {
    let message: Messages
    
    var body: some View {
        HStack {
            if message.isMe { Spacer() }
            
            Text(message.text)
                .padding()
                .background(message.isMe ? Color.green.opacity(0.8) : Color.gray.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .frame(maxWidth: 260, alignment: message.isMe ? .trailing : .leading)
            
            if !message.isMe { Spacer() }
        }
    }
}


struct ChatInputBar: View {
    
    @Binding var text: String
    var onSend: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            
            Button {
                // camera action
            } label: {
                Image(systemName: "camera.fill")
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
            
            HStack {
                TextField("Message ...", text: $text)
                    .padding(8)
                
                Button {
                    // mic action
                } label: {
                    Image(systemName: "mic.fill")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.gray.opacity(0.2))
            .clipShape(Capsule())
            
            Button {
                onSend()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .padding(10)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
