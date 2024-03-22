import 'package:hive/hive.dart';
part 'precipitations.g.dart';

@HiveType(typeId: 2)
class Precipitations {
  const Precipitations(this.percentage);

  @HiveField(0)
  final int? percentage;
}
