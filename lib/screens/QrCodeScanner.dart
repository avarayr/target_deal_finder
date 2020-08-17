import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class QrCodeScanner extends StatefulWidget {
  const QrCodeScanner({Key key}) : super(key: key);

  @override
  _QrCodeScannerState createState() => _QrCodeScannerState();
}

class _QrCodeScannerState extends State<QrCodeScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: BarcodeScanner.scan(),
        initialData: ScanResult(rawContent: ""),
        builder: (context, AsyncSnapshot<ScanResult> snapshot) {
          return Text(snapshot.data.rawContent);
        },
      ),
    );
  }
}
