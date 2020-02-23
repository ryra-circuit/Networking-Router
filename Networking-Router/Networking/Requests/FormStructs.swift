import Foundation

struct RegisterUserForm {
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var password: String
    var confirmPassword: String
}

struct LoginUserForm {
    var email: String
    var password: String
}

struct UpdateProfileForm {
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var countryCode: String
    var phone: String
}

struct ChangePasswordForm {
    var currentPassword: String
    var newPassword: String
    var confirmNewPassword: String
}
