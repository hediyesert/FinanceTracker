import SwiftUI

struct ProfileView: View {
    @State private var name: String = "Mr. Banks O."
    @State private var email: String = "banks@example.com"
    @State private var phone: String = "+234 800 123 4567"
    @State private var isEditing: Bool = false
    
    var body: some View {
        ZStack {
            // 🔹 Arka plan (mor degrade + blur)
            LinearGradient(
                colors: [Color.purple.opacity(0.8), Color.black],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 25) {
                // Başlık
                HStack {
                    Text("Profile")
                        .font(.title.bold())
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        withAnimation { isEditing.toggle() }
                    } label: {
                        Label(isEditing ? "Cancel" : "Edit", systemImage: "pencil")
                            .font(.subheadline.bold())
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                .padding(.top, 40)
                .padding(.horizontal)
                
                // Kullanıcı avatar
                ZStack {
                    Circle()
                        .fill(.ultraThinMaterial)
                        .frame(width: 130, height: 130)
                        .overlay(
                            Circle()
                                .stroke(Color.white.opacity(0.2), lineWidth: 1)
                        )
                    Image(systemName: "person.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.white.opacity(0.9))
                }
                .padding(.top, 20)
                
                // Ad soyad
                Text(name)
                    .font(.title3.bold())
                    .foregroundColor(.white)
                Text("Premium Account")
                    .font(.caption)
                    .foregroundColor(.white.opacity(0.7))
                
                Spacer()
                
                // 🔹 Bilgi alanları
                VStack(spacing: 16) {
                    ProfileField(title: "Full Name", text: $name, icon: "person.text.rectangle", isEditing: isEditing)
                    ProfileField(title: "Email Address", text: $email, icon: "envelope.fill", isEditing: isEditing)
                    ProfileField(title: "Phone Number", text: $phone, icon: "phone.fill", isEditing: isEditing)
                }
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
                .padding(.horizontal)
                
                // 🔹 Kaydet butonu
                if isEditing {
                    Button(action: {
                        withAnimation { isEditing = false }
                    }) {
                        Text("Save Changes")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                LinearGradient(colors: [Color.purple, Color.indigo],
                                               startPoint: .topLeading,
                                               endPoint: .bottomTrailing)
                                    .cornerRadius(15)
                            )
                            .foregroundColor(.white)
                            .shadow(color: Color.purple.opacity(0.3), radius: 8, x: 0, y: 4)
                            .padding(.horizontal)
                    }
                    .transition(.opacity.combined(with: .slide))
                }
                
                Spacer()
            }
        }
    }
}

// MARK: - ProfileField Component
struct ProfileField: View {
    var title: String
    @Binding var text: String
    var icon: String
    var isEditing: Bool
    
    var body: some View {
        HStack(spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(.white.opacity(0.9))
                .frame(width: 30)
            
            if isEditing {
                TextField(title, text: $text)
                    .textInputAutocapitalization(.words)
                    .disableAutocorrection(true)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
            } else {
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.caption2)
                        .foregroundColor(.white.opacity(0.6))
                    Text(text)
                        .font(.body)
                        .foregroundColor(.white.opacity(0.9))
                }
            }
            Spacer()
        }
        .padding(.horizontal)
        .background(Color.white.opacity(0.05))
        .cornerRadius(12)
    }
}

