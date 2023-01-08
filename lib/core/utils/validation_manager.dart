String? passwordValidator({String? value, int minimumLength = 8}) {
  if (value == "") {
    return null;
  } else if (value != null && value.length < minimumLength) {
    return "Password should have min $minimumLength characters";
  } else if (value != null &&
      !value.contains(RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%&\><*~])'))) {
    return "Password should be alphanumeric and contain at least 1 uppercase, 1 lowercase and one of !@#\$%&";
  }
  return null;
}

String? confirmPasswordValidator(
    {String? value, String? newPasswordValue, int minimumLength = 8}) {
  if (value == "") {
    return null;
  } else if (value != null && value.length < minimumLength) {
    return "Password should have min $minimumLength characters";
  } else if (value != null &&
      !value.contains(RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%&\><*~&])'))) {
    return "Password should be alphanumeric and contain at least 1 uppercase, 1 lowercase and one of !@#\$%&";
  } else if (value != null && newPasswordValue != value) {
    return "Passwords did not match";
  }
  return null;
}

String? currentPasswordValidator({String? value, dynamic globalPassword}) {
  if (value == "") {
    return null;
  } else if (value != globalPassword) {
    return "Incorrect current password";
  }
  return null;
}

String? emailAddressValidator({
  String? value,
}) {
  if (value == "") {
    return null;
  } else if (!value!.contains(RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'))) {
    return "Invalid email address";
  }
  return null;
}

String? ipAddressValidator({
  String? value,
}) {
  if (value == "") {
    return null;
  } else if (!value!.contains(RegExp(
      r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$'))) {
    return "Invalid IP address";
  }
  return null;
}

String? serverIdValidator({String? value, int minimumLength = 36}) {
  if (value == "") {
    return null;
  } else if (value != null && value.length != minimumLength) {
    return "Invalid server ID, must be $minimumLength characters";
  }
  return null;
}

String? serverNameValidator({String? value, int minimumLength = 6}) {
  if (value == "") {
    return null;
  } else if (value != null && !value.endsWith(".com")) {
    return "Invalid server name, must end with '.com'";
  }
  return null;
}

String? toolNameValidator({String? value, int minimumLength = 2}) {
  if (value == "") {
    return null;
  } else if (value != null && value.length < minimumLength) {
    return "Invalid input, must have at least two character";
  }
  return null;
}
