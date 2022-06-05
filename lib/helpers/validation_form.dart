class FormValid {
  static String? dropDownEmpty(String? value) {
    if (value == null) {
      return "Tidak Boleh Kosong";
    }
    return null;
  }

  static String? emptyValue(String? value) {
    if (value!.isEmpty) {
      return "Tidak Boleh Kosong";
    }
    return null;
  }

  static String? matchValue(String? value, String? data, String title) {
    if (value!.isEmpty) {
      return "Tidak Boleh Kosong";
    }
    if (value != data) {
      return "$title Tidak Sesuai";
    }
    return null;
  }
}
