import 'package:ancestry_vault/model/person.dart';

class FamilyEvent {
  final String id;
  final DateTime date;
  final String eventType;
  final List<Person> peopleInvolved;

  FamilyEvent(this.id, this.date, this.eventType, this.peopleInvolved);
}
