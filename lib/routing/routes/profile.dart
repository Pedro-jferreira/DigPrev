import 'package:digprev_flutter/ui/home/widgets/dummy.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class ProfileRoute extends GoRoute {
  ProfileRoute()
      : super(
    path: '/profile',
    pageBuilder: (context, state) => const MaterialPage(
      child:Dummy (title: 'profile'),
    ),
  );
}