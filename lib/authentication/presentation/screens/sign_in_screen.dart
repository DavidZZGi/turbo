import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/utils/global/global_vars.dart';
import '../widgets/widgets.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Column(
          children: [
            SvgPicture.asset(turboIconLogIn,
                height: 50,
                width: 50,
                colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 236, 64, 52), BlendMode.srcIn)),
          ],
        )),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Text(loginHeaderText),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/google.jpeg',
                        height: 20,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(googleSignInText)
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text('Or'),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  label: emailText,
                  textInputType: TextInputType.text,
                  textController: email,
                  hint: emailHintFormText),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  label: passwordText,
                  textInputType: TextInputType.visiblePassword,
                  textController: password,
                  hint: passwordHintText),
              const SizedBox(
                height: 10,
              ),
              CustomTextfield(
                  label: nameText,
                  textInputType: TextInputType.text,
                  textController: name,
                  hint: nameHintText),
            ],
          ),
        ));
  }
}
