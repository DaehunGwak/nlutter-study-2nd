class UserAccount {
  String name;
  String? email;
  String? username;
  DateTime? birthday;

  UserAccount({
    required this.name,
    this.email,
    this.username,
    this.birthday,
  });

  bool isValid() {
    return isNameValid() && isEmailValid() && isBirthdayValid();
  }

  bool isNameValid() {
    return name.isNotEmpty;
  }

  bool isEmailValid() {
    if (email == null || email!.isEmpty) {
      return false;
    }
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return regExp.hasMatch(email!);
  }

  bool isBirthdayValid() {
    return birthday != null;
  }

  @override
  String toString() {
    return 'UserAccount{name: $name, email: $email, username: $username, birthday: $birthday}';
  }
}
