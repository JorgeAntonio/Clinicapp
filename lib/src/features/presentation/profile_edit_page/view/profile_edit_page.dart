import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_clinica/src/bloc/auth_cubit.dart';
import 'package:app_clinica/src/bloc/my_user_cubit.dart';
import 'package:app_clinica/src/model/user.dart';
import 'package:app_clinica/src/repository/implementation/my_user_repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app_clinica/src/colors/colors.dart';

class ProfileEditPage extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => MyUserCubit(MyUserRepository())..getMyUser(),
      child: ProfileEditPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGreyPage,
      appBar: AppBar(
        backgroundColor: myWhiteColor,
        title: Text(
          'Editar Perfil',
          style: TextStyle(color: myTextColor),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: BlocBuilder<MyUserCubit, MyUserState>(
        builder: (_, state) {
          if (state is MyUserReadyState) {
            return _MyUserSection(
              user: state.user,
              pickedImage: state.pickedImage,
              isSaving: state.isSaving,
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _MyUserSection extends StatefulWidget {
  final MyUser? user;
  final File? pickedImage;
  final bool isSaving;

  const _MyUserSection({this.user, this.pickedImage, this.isSaving = false});

  @override
  _MyUserSectionState createState() => _MyUserSectionState();
}

class _MyUserSectionState extends State<_MyUserSection> {
  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  final picker = ImagePicker();

  @override
  void initState() {
    _nameController.text = widget.user?.name ?? '';
    _lastNameController.text = widget.user?.lastName ?? '';
    _ageController.text = widget.user?.age.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget image = Image.asset(
      'images/doctor.png',
      fit: BoxFit.fill,
    );

    if (widget.pickedImage != null) {
      image = Image.file(
        widget.pickedImage!,
        fit: BoxFit.fill,
      );
    } else if (widget.user?.image != null && widget.user!.image!.isNotEmpty) {
      image = CachedNetworkImage(
        imageUrl: widget.user!.image!,
        progressIndicatorBuilder: (_, __, progress) =>
            CircularProgressIndicator(value: progress.progress),
        errorWidget: (_, __, ___) => Icon(Icons.error),
        fit: BoxFit.fill,
      );
    }

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                final pickedImage =
                    await picker.getImage(source: ImageSource.gallery);
                if (pickedImage != null) {
                  context.read<MyUserCubit>().setImage(File(pickedImage.path));
                }
              },
              child: Center(
                child: ClipOval(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: image,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            BlocBuilder<AuthCubit, AuthState>(
              buildWhen: (_, current) => current is AuthSignedIn,
              builder: (_, state) {
                return Center(
                  child: Text('UID: ${(state as AuthSignedIn).user.uid}'),
                );
              },
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombres'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Apellidos'),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Edad'),
            ),
            SizedBox(height: 8),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: myPrimaryColor),
                    child: Text('Guardar'),
                    onPressed: widget.isSaving
                        ? null
                        : () {
                            context.read<MyUserCubit>().saveMyUser(
                                  (context.read<AuthCubit>().state
                                          as AuthSignedIn)
                                      .user
                                      .uid,
                                  _nameController.text,
                                  _lastNameController.text,
                                  int.tryParse(_ageController.text) ?? 0,
                                );
                          },
                  ),
                ),
                if (widget.isSaving) CircularProgressIndicator(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
