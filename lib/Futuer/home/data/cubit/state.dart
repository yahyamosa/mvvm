import '../model/searchuser/searchuser.dart';

abstract class state {}

class init extends state {}
class lod extends state {}
class secess extends state {}
class fail extends state {}



class secesslang extends state {}
class secessthem extends state {}



class secessid extends state {
  List<Searchuser> data ;
  secessid(this.data);
}
class failid extends state {}