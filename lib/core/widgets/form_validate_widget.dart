class FormValidate {
  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Please Enter Email';

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern.toString());

    if (value.contains('@') != true) {
      return 'Please Enter Valid Email';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) return 'Please Enter Name';
    if (value.length < 3) {
      return 'Please write more than 3 Character';
    }

    // Pattern pattern = r'^[a-zA-Z\. ]+$';
    //
    // RegExp regex = RegExp(pattern.toString());
    //
    // if (!regex.hasMatch(value)) {
    //   return 'Please Enter Valid Name';
    // }

    return null;
  }

  static String? validatePhone(String value) {
    if (value.isEmpty) return 'Please Enter Phone';
    // if (value.length < 9) {
    //   return 'Please Pone Number can\'t be less than 9 number';
    // }
    //   print(value.startsWith('5', 5));
    if(value.startsWith('5', 5) != true) {
      return 'Phone Number Must start with 5 and cant be less than 9 number';
    }
    // Pattern pattern =
    //     r'^(?:(?:\+|0{0,2})91(\s*[\ -]\s*)?|[0]?)?[789]\d{9}|(\d[ -]?){9}\d$';
    Pattern pattern = r'^(?:[5])?[0-8]{8}$';
// //    Pattern pattern =
// //        r'\+(9[976]\d|8[987530]\d|6[987]\d|5[90]\d|42\d|3[875]\d|2[98654321]\d|9[8543210]|8[6421]|6[6543210]|5[87654321]|4[987654310]|3[9643210]|2[70]|7|1)\d{1,14}$';
// //
    RegExp regex = RegExp(pattern.toString());
//    print(regex);
// // //
    if (!regex.hasMatch(value)) {
      return 'Phone Number Must start with 5 and cant be less than 9 number';
    }

    if (value.contains("/") || value.contains(".") || value.contains(",")) {
      return 'Please Enter Valid Phone';
    }

    return null;
  }



  static String? validatePassword(String value) {
    // Pattern  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    // RegExp regex = RegExp(pattern.toString());
    if (value.isEmpty) return 'Please Enter Password';
    // if(!regex.hasMatch(value)) {
    //   return 'Password should have Minimum 1 Upper case\nMinimum 1 lowercase Minimum 1 Numeric Number\nMinimum 1 Special Character Common Allow\nCharacter ( ! @ # \$ & * ~ )';
    // }
    return null;
  }

  static String? validateAge(String value) {
    if (value.isEmpty) return 'Please Enter Age';
    if (value.length > 2) {
      return 'Please write less or equal 2 Character';
    }
    return null;
  }

}