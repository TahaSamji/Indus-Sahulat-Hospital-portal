class PatientAdmitRequest {
  final String patientFirstName;
  final String patientLastName;
  final String patientPhone;
  final String ambulanceProviderName;
  final String driverFirstName;
  final String driverLastName;
  final String pickupLocation;

  PatientAdmitRequest({
    required this.patientFirstName,
    required this.patientLastName,
    required this.patientPhone,
    required this.ambulanceProviderName,
    required this.driverFirstName,
    required this.driverLastName,
    required this.pickupLocation,
  });

  factory PatientAdmitRequest.fromJson(Map<String, dynamic> json) {
    final event = json['event'];
    final patient = event['patient'];
    final company = event['ambulanceProvider']['company'];
    final ambulanceAssignment = event['eventAmbulanceAssignment']['ambulanceAssignment'];
    final driver = ambulanceAssignment['ambulanceDriver'];


    return PatientAdmitRequest(
      patientFirstName: patient['firstName'] ?? 'Unknown',
      patientLastName: patient['lastName'] ?? 'Unknown',
      patientPhone: patient['phone'] ?? 'Unknown',
      ambulanceProviderName: company['name'] ?? 'Unknown',
      driverFirstName: driver['firstName'] ?? 'Unknown',
      driverLastName: driver['lastName'] ?? 'Unknown',
      pickupLocation:  event['pickupAddress']?? 'Unknown',
    );
  }
}