import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:target_deal_finder/api/TargetAPI.dart';
import 'package:target_deal_finder/screens/screens.dart';

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
          final String code = snapshot.data.rawContent;
          if (code == '') return Material();
          var api = TargetAPI();
          var itemFuture = api.getItemListingByUPC(code);
          if (itemFuture != null) {
            itemFuture.then((value) => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ItemView(item: value)))
                });
          }
          return Material(child: Center(child: Text('Nothing found!')));
        },
      ),
    );
  }
}
