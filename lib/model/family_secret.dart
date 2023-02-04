import 'package:ancestry_vault/model/person.dart';

class FamilySecret {
  final String id;
  final String title;
  final DateTime date;
  final String description;
  final List<Person> peopleInvolved;

  FamilySecret(
      this.id, this.title, this.date, this.description, this.peopleInvolved);
}
