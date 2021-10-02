import 'dart:async';
import 'validators.dart';

class Bloc with Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // Add data to stream
  Function(String) get emailChange => _email.sink.add;
  Function(String) get passwordChange => _password.sink.add;
  
  // Change data
  Stream<String> get email => _email.stream.transform(valiadteEmail);
  Stream<String> get password => _password.stream.transform(validatePassword);

  // Clean up controller
  dispose() {
    _email.close();
    _password.close();
  }
}
