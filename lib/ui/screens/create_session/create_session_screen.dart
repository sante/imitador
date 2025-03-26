import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imitador/core/common/extension/context_extensions.dart';
import 'package:imitador/ui/theme/app_text_field.dart';
import 'package:imitador/ui/theme/components/buttons.dart';
import 'package:imitador/ui/theme/components/scaffold.dart';

@RoutePage()
class CreateSessionScreen extends StatefulWidget {
  const CreateSessionScreen({super.key});

  @override
  State<CreateSessionScreen> createState() => _CreateSessionScreenState();
}

class _CreateSessionScreenState extends State<CreateSessionScreen> {
  final TextEditingController _sessionNameController = TextEditingController();

  @override
  void dispose() {
    _sessionNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MotionScaffold(
      message: "Crear sesión de juego",
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: _sessionNameController,
              label: "Nombre de la sesión",
              hint: "Ej: Clase 101",
              onChanged: (_) {},
            ),
            SizedBox(height: 36.h),
            PrimaryButton(
              onPressed: () {
                // TODO: Implement session creation logic
                final sessionName = _sessionNameController.text;
                if (sessionName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text("Por favor ingrese un nombre para la sesión"),
                    ),
                  );
                  return;
                }

                // Create session
                // Navigate back or to session details
                context.router.pop();
              },
              label: "Crear sesión",
            ),
          ],
        ),
      ),
    );
  }
}
