abstract class Failure{
  final String message;
  const Failure({required this.message,});

  String getErrorMessage(){
    return message;
  }
}