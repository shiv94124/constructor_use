import 'construct.dart';

class ConstList {
  int rollNo;
  String name;

  listName(int tileNo) {
    return student[tileNo].name;
  }

  listRollNo(int tileNo) {
    return student[tileNo].rollNo;
  }

  List student = [
    Constructor("SAUMYA RAJAURA", 01),
    Constructor("KUNAL RAJAURA", 02),
    Constructor("SHIVAM SHARMA", 03),
    Constructor("SATYAM SHARMA", 04),
    Constructor("JAGRITI SHARMA", 05),
    Constructor("PRIYA SHARMA", 06),
  ];
}
