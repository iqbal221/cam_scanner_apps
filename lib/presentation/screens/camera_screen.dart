import 'dart:io';

import 'package:cam_scanner/presentation/provider/scanner_provider.dart';
import 'package:cam_scanner/presentation/screens/preview_screen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  static const String name = '/camera';

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    controller = CameraController(cameras[0], ResolutionPreset.high);
    await controller!.initialize();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ScannerProvider>();

    if (controller == null || !controller!.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(controller!),

          // bottom controlls
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // thumbnail preview
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.file(provider.scannedImages[i]),
                    ),
                  ),
                ),

                /// Capture Button
                FloatingActionButton(
                  onPressed: () async {
                    final file = await controller!.takePicture();
                    provider.addImage(File(file.path));
                  },
                  child: const Icon(Icons.camera),
                ),

                const SizedBox(height: 10),

                /// Go to Preview
                if (provider.scannedImages.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PreviewScreen.name);
                    },
                    child: const Text("Next"),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
