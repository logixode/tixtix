import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/icon_map.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tixtix/bloc/blocs.dart';
import 'package:tixtix/bloc/theme_bloc.dart';
import 'package:tixtix/models/models.dart';
import 'package:tixtix/services/services.dart';
import 'package:tixtix/shared/shared.dart';
import 'package:tixtix/ui/widgets/widgets.dart';

part 'wrapper.dart';
part 'signIn_page.dart';
part 'signUp_page.dart';
part 'main_page.dart';
part 'splash_page.dart';
part 'movie_page.dart';
part 'preference_page.dart';

Future<File> getImage() async {
  var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  return image;
}
