import 'package:ancestry_vault/model/person.dart';

class FamilyTree {
  final Node root;

  FamilyTree(this.root);

  FamilyTree constructTree(Person child, Node mother, Node father) {
    Node result = Node(child, mother, father);
    FamilyTree tree = FamilyTree(result);
    return tree;
  }
}

class Node<Person> {
  final Person value;
  final Node<Person> mother;
  final Node<Person> father;

  Node(this.value, this.mother, this.father);
}
