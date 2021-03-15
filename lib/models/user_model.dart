import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserModel extends Equatable {
  final String id;
  final String email;
  final String name;

  UserModel({@required this.id, @required this.email, @required this.name});

  @override
  List<Object> get props => [id, email, name];

//TODO: add fields and implement serialization here
}
