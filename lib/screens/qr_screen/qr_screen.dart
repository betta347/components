import 'dart:io' show Platform;
import 'package:components/fire_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:torch_light/torch_light.dart';

import 'qr_code_scanner.dart';

class QrGenerationScreen extends StatefulWidget {
  const QrGenerationScreen({
    super.key,
    required this.topLogo,
    required this.onSuccess,
    this.qrBorderColor,
    this.torchIcon,
    this.cancelIcon,
  });

  final Widget topLogo;
  final ValueChanged<String?> onSuccess;
  final Color? qrBorderColor;
  final Widget? torchIcon;
  final Widget? cancelIcon;

  @override
  State<QrGenerationScreen> createState() => _QrGenerationScreenState();
}

class _QrGenerationScreenState extends State<QrGenerationScreen> with TickerProviderStateMixin {
  bool isGeneration = true;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? qrController;

  late AnimationController animationController;

  bool onFlash = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );
    super.initState();
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      qrController!.pauseCamera();
    } else if (Platform.isIOS) {}
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  Future<void> _turnOnFlash(BuildContext context) async {
    try {
      await TorchLight.enableTorch();
      setState(() {
        onFlash = true;
      });
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }

  Future<void> _turnOffFlash(BuildContext context) async {
    try {
      await TorchLight.disableTorch();
      setState(() {
        onFlash = false;
      });
    } on Exception catch (_) {
      _showErrorMes('Could not enable Flashlight', context);
    }
  }

  void _showErrorMes(String mes, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mes)));
  }

  @override
  Widget build(BuildContext context) {
    final scanArea = MediaQuery.of(context).size.width - 110;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              formatsAllowed: const [BarcodeFormat.qrcode],
              overlay: QrScannerOverlayShape(
                borderColor: widget.qrBorderColor ?? Theme.of(context).primaryColor,
                borderRadius: 16,
                borderLength: 32,
                overlayColor: const Color(0xff111014).withOpacity(.8),
                borderWidth: 12,
                cutOutBottomOffset: 50,
                cutOutSize: scanArea,
              ),
              onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top,
              right: 12,
              child: WScaleAnimation(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: widget.cancelIcon ?? const Icon(Icons.cancel_outlined),
                ),
                onTap: () => Navigator.pop(context),
              ),
            ),
            Positioned(
                left: MediaQuery.of(context).size.width * 0.25,
                top: MediaQuery.of(context).size.height * 0.17,
                child: widget.topLogo),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.42,
              bottom: MediaQuery.of(context).size.height * 0.16,
              child: WScaleAnimation(
                onTap: () {
                  onFlash ? _turnOffFlash(context) : _turnOnFlash(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25),
                    color: onFlash ? Theme.of(context).primaryColor : Colors.grey,
                  ),
                  child: widget.torchIcon ?? const Icon(Icons.light_mode),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController c) {
    setState(() {
      qrController = c;
    });
    String? id;
    qrController!.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        final code = scanData.code;
        print('result scann: $code');
        qrController?.pauseCamera();
        widget.onSuccess.call(code);
      }
    });
    qrController!.pauseCamera();
    qrController!.resumeCamera();
  }
}
