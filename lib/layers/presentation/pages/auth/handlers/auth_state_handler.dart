import 'package:get/get.dart';
import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';

import 'package:adopt_me/core/constants/theme/app_colors.dart';
import 'package:adopt_me/core/constants/router/app_routes.dart';
import 'package:adopt_me/layers/presentation/cubit/auth/auth_state.dart';

class AuthStateHandler {
  static OverlayEntry? _loadingOverlayEntry;
  static OverlayState? _overlayState;

  static dynamic handleAuthState(
    BuildContext context,
    AuthState authState,
  ) {
    switch (authState.runtimeType) {
      case AuthLoading:
        if (_loadingOverlayEntry == null) {
          _overlayState = Overlay.of(context);
          _loadingOverlayEntry = OverlayEntry(
            builder: (context) => Container(
              color: AppColors.blackColor.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          );
          _overlayState!.insert(_loadingOverlayEntry!);
        }
        break;
      case AuthSuccess:
        if (_loadingOverlayEntry != null) {
          _loadingOverlayEntry!.remove();
          _loadingOverlayEntry = null;
          _overlayState = null;
        }
        Get.offAndToNamed(AppRoutes.settingsRoute);
        break;
      case AuthFailure:
        if (_loadingOverlayEntry != null) {
          _loadingOverlayEntry!.remove();
          _loadingOverlayEntry = null;
          _overlayState = null;
        }

        final failureState = authState as AuthFailure;
        final message = failureState.message;

        AsukaSnackbar.alert(message).show();
        break;
    }
  }
}
