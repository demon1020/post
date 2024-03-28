part of 'application_bloc.dart';

@immutable
abstract class ApplicationEvent {}

class SubmitApplicationEvent extends ApplicationEvent {
  final ApplicationForm form;

  SubmitApplicationEvent(this.form);
}

// Model class for application form
class ApplicationForm {
  late final String incomeDetails;
  late final String panCardNumber;
  late final String workDetails;
  late final String voterIdNumber;
  late final String reasonForApplying;
  late final String opinion;

  ApplicationForm({
    required this.incomeDetails,
    required this.panCardNumber,
    required this.workDetails,
    required this.voterIdNumber,
    required this.reasonForApplying,
    required this.opinion,
  });
}
