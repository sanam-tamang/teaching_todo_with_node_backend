import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:todo_with_node/logics/auth_cubit/auth_cubit.dart';
import 'package:todo_with_node/pages/home_page.dart';
import 'package:todo_with_node/utils/app_toast.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 36),
                    TextFormField(
                      controller: _nameController,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.alphabetical(),
                        FormBuilderValidators.minLength(4),
                      ]),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your name",
                        labelText: "Name",
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      validator: FormBuilderValidators.email(),
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your email",
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(height: 12),

                    TextFormField(
                      obscureText: true,
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(),
                        FormBuilderValidators.minLength(6),

                        // FormBuilderValidators.password(
                        //   errorText: "Invalid password",
                        // ),
                      ]),
                      controller: _passwordController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter your password",
                        labelText: "Password",
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width: double.maxFinite,
                      child: BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthLoaded) {
                            FlutterToast.showToast(context, msg: state.msg);

                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          } else if (state is AuthFailure) {
                            FlutterToast.showToast(context, msg: state.msg);
                          }
                        },
                        builder: (context, state) {
                          return FilledButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() == true) {
                                context.read<AuthCubit>().signUp(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                            child:
                                state is AuthLoading
                                    ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    : Text("Sign up"),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
