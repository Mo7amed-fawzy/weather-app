// بعدل علي السترنج بخلي الحرف الاول كابيتال والباقي سمول

extension Capitalize on String {
  String get capitalize {
    return length > 0 ? '${this[0].toUpperCase()}${substring(1)}' : '';
    // بتشك علي السترنج انو فيه كتابة اصلا
    // فحالة في كتابة باخد الحرف الاول this[0] وبستعمل فنكشن اخليه كبير toUpperCase()
    //باخد باقي السترنج باستخدام substring(1) (ببدا من الحرف الثاني) وبحتفظ بيها زي مهيا.
  }
}

// امثله
// String text = "hello";
// print(text.capitalize);  // هيعرض: "Hello"

// String emptyText = "";
// print(emptyText.capitalize);  // هيعرض: ""
