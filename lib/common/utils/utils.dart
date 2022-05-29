import 'package:uuid/uuid.dart';

String genUuid() {
  var uuid = Uuid();
  return uuid.v1();
}
