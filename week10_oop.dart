abstract class Student {

  String name;
  String course;
  double _grade;
  int completedActivities;
  int totalActivities;

  Student(
    this.name,
    this.course,
    this._grade,
    this.completedActivities,
    this.totalActivities,
  );

  double getGrade() {
    return _grade;
  }

  void updateGrade(double newGrade) {

    if (newGrade >= 0 && newGrade <= 100) {
      _grade = newGrade;
    } else {
      print('Invalid grade. Enter a value from 0 to 100.');
    }

  }

  double calculateProgress() {

    if (totalActivities <= 0) {
      return 0;
    }

    return (completedActivities / totalActivities) * 100;

  }

  void displayInformation() {

    print('Student Name: $name');
    print('Course: $course');
    print('Grade: ${getGrade().toStringAsFixed(2)}');
    print('Completed Activities: $completedActivities');
    print('Total Activities: $totalActivities');
    print(
      'Activity Progress: ${calculateProgress().toStringAsFixed(2)}%',
    );

  }

  void checkPerformance();

}

mixin StudentReport {

  void displayReport(String message) {

    print('Student Report: $message');

  }

}

class RegularStudent extends Student {

  RegularStudent(
    String name,
    String course,
    double grade,
    int completedActivities,
    int totalActivities,
  ) : super(
          name,
          course,
          grade,
          completedActivities,
          totalActivities,
        );

  @override
  void checkPerformance() {

    if (getGrade() >= 75) {
      print('Performance: Passed');
    } else {
      print('Performance: Failed');
    }

  }

  @override
  void displayInformation() {

    print('REGULAR STUDENT');

    super.displayInformation();

    checkPerformance();

    print('-----------------------------------');

  }

}

class IrregularStudent extends Student {

  IrregularStudent(
    String name,
    String course,
    double grade,
    int completedActivities,
    int totalActivities,
  ) : super(
          name,
          course,
          grade,
          completedActivities,
          totalActivities,
        );

  @override
  void checkPerformance() {

    if (getGrade() >= 75 && calculateProgress() >= 80) {
      print('Performance: Passed and on track');
    } else if (getGrade() >= 75) {
      print('Performance: Passed with pending activities');
    } else {
      print('Performance: Needs improvement');
    }

  }

  @override
  void displayInformation() {

    print('IRREGULAR STUDENT');

    super.displayInformation();

    checkPerformance();

    print('-----------------------------------');

  }

}

class ActivityReport with StudentReport {

  void generateReport() {

    displayReport('Student activity evaluation completed.');

  }

}

void main() {

  RegularStudent student1 = RegularStudent(
    'Student 1',
    'BSIT',
    91.50,
    10,
    10,
  );

  IrregularStudent student2 = IrregularStudent(
    'Ashanti P. Artista',
    'BSIT',
    89.75,
    8,
    10,
  );

  List<Student> students = [
    student1,
    student2,
  ];

  print('STUDENT ACTIVITY TRACKER');
  print('===================================');

  for (Student student in students) {

    student.displayInformation();

  }

  print('UPDATING STUDENT GRADE');
  print('===================================');

  student2.updateGrade(92.00);

  print(
    'Updated Grade: ${student2.getGrade().toStringAsFixed(2)}',
  );

  student2.checkPerformance();

  print('===================================');

  ActivityReport report = ActivityReport();

  report.generateReport();

  print('===================================');

}