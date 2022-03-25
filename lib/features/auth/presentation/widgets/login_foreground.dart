import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginForeground extends StatelessWidget {
  final Widget loginForm;
  const LoginForeground({Key? key, required this.loginForm}) : super(key: key);
  static const double _widthInPercentage = 0.75;
  static const double _heightInPercentage = 0.7;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: 0,
      child: FractionallySizedBox(
        widthFactor: _widthInPercentage,
        heightFactor: _heightInPercentage,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: const Color.fromRGBO(200, 200, 200, 0.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: _loginImage(),
              ),
              Expanded(
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    child: loginForm,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginImage(){
    return Transform.scale(
      scale: 1.3,
      child: Lottie.asset(
        'assets/images/login_image.json',
        fit: BoxFit.fitHeight,
      ),
    );
  }
}