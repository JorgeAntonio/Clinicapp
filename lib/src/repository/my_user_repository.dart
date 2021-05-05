import 'dart:io';

import 'package:app_clinica/src/model/user.dart';

abstract class MyUserRepositoryBase {
  Future<MyUser?> getMyUser();

  Future<void> saveMyUer(MyUser user, File? image);
}
