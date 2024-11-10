import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Column(
          children: [
            SvgPicture.asset('assets/images/Turbo Marca 7.svg',
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
                child: Text('Registrate para conocer personas de tu nicho'),
              ),
              SizedBox(
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
                      SizedBox(
                        width: 10,
                      ),
                      Text(' Registrate con google')
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Text('Or'),
              Row(
                children: [
                  Divider(
                    height: 2,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
