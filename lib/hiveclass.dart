import 'package:hive/hive.dart';
part 'hiveclass.g.dart';
@ HiveType(typeId: 1)
class myhive extends HiveObject{
  @HiveField(0)
  String name ;
  @HiveField(1)
  int age ;

  myhive({required this.name ,required this.age});

}