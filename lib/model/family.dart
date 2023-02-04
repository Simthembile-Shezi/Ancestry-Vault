import 'package:ancestry_vault/model/family_event.dart';
import 'package:ancestry_vault/model/family_fact.dart';
import 'package:ancestry_vault/model/family_location.dart';
import 'package:ancestry_vault/model/family_secret.dart';
import 'package:ancestry_vault/model/family_tree.dart';

class Family {
  final String id;
  final List<FamilyFact> facts;
  final List<FamilySecret> secrets;
  final List<FamilyEvent> events;
  final FamilyTree members;
  final FamilyLocation location;

  Family(this.id, this.facts, this.secrets, this.events, this.members,
      this.location);
}
