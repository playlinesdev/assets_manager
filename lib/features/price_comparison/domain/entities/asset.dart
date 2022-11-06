import 'package:equatable/equatable.dart';

class Asset extends Equatable {
  final String id;
  final String name;
  const Asset({required this.name, required this.id});

  @override
  List<Object?> get props => [id, name];
}
