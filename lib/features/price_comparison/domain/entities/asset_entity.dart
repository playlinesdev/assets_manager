import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable {
  final String id;
  final String name;
  const AssetEntity({required this.name, required this.id});

  @override
  List<Object?> get props => [id, name];
}
