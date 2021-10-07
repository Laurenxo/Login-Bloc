import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 20.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.email,
        builder: (context, snapshot) {
          return TextField(
            onChanged: bloc.emailChange,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: 'you@example.com',
              labelText: 'Email address',
              errorText: snapshot.error?.toString(),
            ),
          );
        });
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) {
          return TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              hintText: 'Password',
              errorText: snapshot.error?.toString(),
            ),
            onChanged: bloc.passwordChange,
          );
        });
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
        stream: bloc.submitValid,
        builder: (content, snapshot) {
          return RaisedButton(
            onPressed: snapshot.hasData ? bloc.submit : null,
            child: Text('Login'),
            color: Colors.blue.shade400,
          );
        });
  }
}
