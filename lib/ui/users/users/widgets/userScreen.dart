
import 'package:digprev_flutter/ui/users/users/view_models/usersViewModel.dart';
import 'package:digprev_flutter/ui/users/users/widgets/editCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/informationCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/titleAndActionWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();

    final User? user = FirebaseAuth.instance.currentUser;

    Future.microtask(() {
      final authViewModel = context.read<UsersViewModel>();
      authViewModel.findUserById(user!.uid);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewModel>(
      builder: (context, users, child){
        final user = users.user;

        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                      margin: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const TitleActionWidget(
                              withAction: false,
                              title: 'Dados Cadastrais'
                          ),
                          InformationCardWidget(
                              iconType: 'nome',
                              text: user.nome,
                              textType: 'Nome'
                          ),
                          InformationCardWidget(
                              iconType: 'birthday',
                              text: user.dataNascimento.toString(),
                              textType: 'Data de Nascimento'
                          ),
                          InformationCardWidget(
                              iconType: 'cpf',
                              text: user.cpf,
                              textType: 'CPF'
                          ),
                        ],
                      ),
                  ),
                  EditCardWidget(user: user),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
