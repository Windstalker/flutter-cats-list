import 'package:faker/faker.dart';

class Cat {
  String id;
  String name;

  Cat(this.id, this.name);

  String get avatarUrl {
    return 'https://cataas.com/cat?type=sq&width=100&id=$id';
  }

  String get photoUrl {
    return 'https://cataas.com/cat?width=640&id=$id';
  }

  factory Cat.random() {
    return Cat(faker.guid.guid(), faker.person.firstName());
  }
}
