extension DateTimeExtension on DateTime{
  bool isNoMinOrMaxDate(){
    return !(this == DateTime.parse('0000-00-00') || this == DateTime.parse('9999-00-00'));
  }
}