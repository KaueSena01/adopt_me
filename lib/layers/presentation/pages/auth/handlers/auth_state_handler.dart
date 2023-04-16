import 'package:adopt_me/layers/presentation/cubit/auth/auth_state.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';

class AuthStateHandler {
  static dynamic handleAuthState(
    BuildContext context,
    AuthState authState,
  ) {
    switch (authState.runtimeType) {
      case AuthFailure:
        final failureState = authState as AuthFailure;
        final message = failureState.message;

        AsukaSnackbar.alert(message).show();

        break;
      case AuthLoading:
        Asuka.showCupertinoDialog(builder: (context) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        });
        break;
    }
  }
}
