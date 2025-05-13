bool isValidateEmail(String str){
  RegExp exp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return exp.hasMatch(str);
}

bool isValidatePassword(String password) {
  RegExp exp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
  return exp.hasMatch(password);
}

bool isValidateName(String name) {
  RegExp exp = RegExp(r'^[A-Za-z]+(?:[ -][A-Za-z]+)*$');
  return exp.hasMatch(name);
}