import 'package:faker/faker.dart';

class Cat {
  String id;
  String name;
  String description;

  Cat(this.id, this.name, this.description);

  String get avatarUrl {
    return 'https://cataas.com/cat?type=sq&width=128&id=$id';
  }

  factory Cat.random() {
    return Cat(
      faker.guid.guid(),
      faker.person.firstName(),
      faker.lorem.sentences(4).join(' '),
    );
  }
}
