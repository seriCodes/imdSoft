class FormValidators{
  static String heartbeatValidation(String value) {
    print('validator hb');
    int hb;
    try {
      hb = int.parse(value);
    } catch (e) {
      print(e);
      return "Eenter a number";
    }
    if (hb < 200 && hb > -1) {
      return null;
    } else {
      return "Not VALID";
    }
  }
static  String urlValidator(value) {
    print('validator img');
    print(value);
    if (!value.isEmpty && !value.startsWith('http')
        // && !value.startsWith('https')
        ) {
      return "please enter valid url";
    }
    if (!value.endsWith(".png") &&
        !value.endsWith(".jpg") &&
        !value.endsWith(".jpeg")) {
      print('jpg');
      return "please enter png, jpg or jpeg url";
    }
    print("before url null");
    return null;
  }

}