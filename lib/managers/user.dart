class User {
  final double? sum;
  final int? months;
  final String? firstName;
  final String? lastName;
  final bool? employed;
  final String? jobTitle;
  final double? paycheck;

  User(
      {this.sum,
       this.months,
       this.firstName,
       this.lastName,
      this.employed,
      this.jobTitle,
       this.paycheck});
  

  User copyWith(double? sum, int? months, String? firstName , String? lastName, bool? employed , String? jobTitle , double? paycheck)
  {
    return User(
      sum: sum ?? this.sum,
      months: months ?? this.months,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      employed: employed ?? this.employed,
      jobTitle: jobTitle ?? this.jobTitle,
      paycheck: paycheck ?? this.paycheck
    );
  }
 
}
User localUser = User();