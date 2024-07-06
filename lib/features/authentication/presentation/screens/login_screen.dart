import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/authentication/presentation/providers/auth_providers.dart';
import 'package:flutter_project/features/authentication/presentation/providers/state/auth_state.dart';
import 'package:flutter_project/features/authentication/presentation/widgets/auth_field.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/app_route.dart';

@RoutePage()
class LoginScreen extends ConsumerWidget {
  static const routeName = '/loginScreen';

  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController usernameController =
      TextEditingController(text: 'jash32@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'jashan@123');
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);
    ref.listen(
      authStateNotifierProvider.select((value) => value),
      ((previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.message.toString())));
        } else if (next is Success) {
          AutoRouter.of(context)
              .pushAndPopUntil(const DashboardRoute(), predicate: (_) => false);
        }
      }),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 200,
              width: 180,
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AuthField(
              hintText: 'Username',
              controller: usernameController,
            ),
            AuthField(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            state.maybeMap(
              loading: (_) => const Center(child: CircularProgressIndicator()),
              orElse: () => loginButton(ref),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account yet? ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor, // Background color
                    onPrimary: Colors.white, // Text color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    textStyle: Theme.of(context).textTheme.bodyLarge,
                  ),
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  child: const Text("SignUp"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget loginButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () {
        // validate email and password
        ref.read(authStateNotifierProvider.notifier).loginUser(
              usernameController.text,
              passwordController.text,
            );
      },
      child: const Text('Login'),
    );
  }
}
