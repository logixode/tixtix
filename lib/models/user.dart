part of 'models.dart';

class User extends Equatable {
  String id;
  String email;
  String name;
  String profilePicture;
  List<String> selectedGenres;
  String selectedLanguage;
  int balance;

  User(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.balance,
      this.selectedGenres,
      this.selectedLanguage});

  @override
  String toString() {
    return '[$id] - $name, $email';
  }

  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedGenres,
        balance
      ];
}
