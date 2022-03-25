import 'package:flutter/material.dart';
import 'package:untitled1/core/extension_methods/string_extension_methods.dart';
import '../../../../config/app_locale/l10n/gen_l10n/app_localizations.dart';

class LoginForm extends StatefulWidget {
  final Function(Map<String, dynamic> data,) onSubmit;
  final VoidCallback onRegisterClicked;
  const LoginForm({Key? key, required this.onSubmit, required this.onRegisterClicked,}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  static const double _inputGap = 20.0;
  late String _username;
  late String _password;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.sign_in, style: Theme.of(context).textTheme.headline5,),
          const SizedBox(height: _inputGap,),
          TextFormField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Username',
              prefixIcon: Icon(Icons.person),
              label: Text('Username'),
            ),
            initialValue: 'admin@gmail.com',
            onSaved: (String? value) {
              _username = value!;
            },
            validator: (String? value) {
              if(value!.isEmpty){
                return 'email must be valid.';
              }
              if (!value.isEmail()) {
                return 'please enter email format.';
              }
              return null;
            },
          ),
          const SizedBox(height: _inputGap,),
          TextFormField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              label: const Text('Password'),
              suffixIcon: IconButton(
                onPressed: () => setState(() {
                  _obscureText = !_obscureText;
                }),
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,),
              ),
            ),
            obscureText: _obscureText,
            initialValue: '@Password168',
            onSaved: (String? value) {
              _password = value!;
            },
            validator: (String? value) {
              if(value!.isEmpty){
                return 'password must be valid.';
              }
              else if (!value.isPassword()) {
                return 'min 8, at least 1 Upper, Lower, Number, Special Char';
              }
              return null;
            },
          ),
          const SizedBox(height: _inputGap,),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: (){
                final FormState? _form = _formKey.currentState;

                if(_form!.validate()){
                  _form.save();
                  widget.onSubmit({
                    'username': _username,
                    'password': _password,
                  });
                }
              },
              child: Text(AppLocalizations.of(context)!.sign_in,),
            ),
          ),
          const SizedBox(height: _inputGap,),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: widget.onRegisterClicked,
              child: Text(AppLocalizations.of(context)!.register,),
            ),
          ),
        ],
      ),
    );
  }
}