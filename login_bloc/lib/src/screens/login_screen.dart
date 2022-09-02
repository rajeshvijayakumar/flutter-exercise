import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            emailField(bloc),
            passwordField(bloc),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(bloc),
          ],
        ),
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: ((context, snapshot) {
        return TextFormField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            errorText: snapshot.error?.toString(),
          ),
        );
      }),
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: ((context, snapshot) {
        return TextFormField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Password',
            errorText: snapshot.error?.toString(),
          ),
        );
      }),
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text('Login'),
          color: Colors.blue,
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
