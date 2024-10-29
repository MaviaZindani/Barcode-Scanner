class ScreenStatus {
  static const String notStart = 'not Start';
  static const String inProcess = 'in Process';
  static const String cancelled = 'Cancelled';
  static const String done = 'Done';
  static const String error = 'Error';

  static const String notStartText = 'Plese scan a barcode first';
   static const String cancelledText = 'Your scan has been cancelled';
  static const String inProcessText = 'Scanning...';
  static const String errorText = 'Error to get barcode';
}

class DataConst extends ScreenStatus {
  static var notStart;
  static var inProcess;
  static var done;
  static var error;
}