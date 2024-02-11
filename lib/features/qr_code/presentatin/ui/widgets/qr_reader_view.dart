
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrReaderView extends StatefulWidget {
  const QrReaderView({super.key});

  @override
  State<QrReaderView> createState() => _QrReaderViewState();
}

class _QrReaderViewState extends State<QrReaderView> {
  final MobileScannerController cameraController = MobileScannerController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

           MobileScanner(
            

            controller: cameraController,
            onDetect: (capture) async {
             // String? cap = capture.barcodes[0].rawValue;

            
            }
      ),
    );
  }
}
