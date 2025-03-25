
import 'package:digprev_flutter/domain/models/user/credentialsModel.dart';
import 'package:digprev_flutter/ui/start_auth/logout/widgets/logoutWidget.dart';
import 'package:digprev_flutter/ui/users/users/view_models/usersViewModel.dart';
import 'package:digprev_flutter/ui/users/users/widgets/editCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/informationCardWidget.dart';
import 'package:digprev_flutter/ui/users/users/widgets/titleAndActionWidget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  final UsersViewModel usersViewModel;
  const UserScreen({required this.usersViewModel, super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<UsersViewModel>().loadCurrentUser());
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<UsersViewModel>(
      builder: (BuildContext context, UsersViewModel users, Widget? child){
        final CredentialsModel? user = users.user;
        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }
        return SizedBox(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          TitleActionWidget(
                              withAction: false,
                              title: 'Dados Cadastrais',
                            usersViewModel: widget.usersViewModel,
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
                  const SizedBox(height: 10),
                  EditCardWidget(user: user,
                    usersViewModel: widget.usersViewModel),
                  const SizedBox(height: 10),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    child: InkWell(
                      onTap: () {
                        context.go('/profile/privacy');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Privacidade',
                              style: Theme.of(context).textTheme
                                  .titleMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            const Icon(
                              size: 30,
                              Icons.chevron_right,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: LogoutWidget(
                      logoutViewModel: context.read(),
                      isExtended: true,
                      centerText: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
