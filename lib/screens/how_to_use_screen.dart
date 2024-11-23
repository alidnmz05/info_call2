import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class HowToUseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Nasıl Kullanılır?'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildStepCard(
            context,
            stepNumber: 1,
            title: 'Fotoğraf çek veya yükle',
            description:
                'Uygulama üzerinden yeni bir fotoğraf çekebilir veya galerinizden bir fotoğraf yükleyebilirsiniz.',
            imagePath: 'assets/step1.png',
          ),
          _buildStepCard(
            context,
            stepNumber: 2,
            title: 'Fotoğraf üstünde noktaları belirle',
            description:
                'Fotoğraf üzerinde iki noktaya dokunarak arasındaki mesafeyi görebilirsiniz.',
            imagePath: 'assets/step2.png',
          ),
          _buildStepCard(
            context,
            stepNumber: 3,
            title: 'Noktaları hassas konumlandır',
            description:
                'Noktaları daha hassas bir şekilde konumlandırmak için oklarla oynatabilir ve diğer noktaya geçiş yapabilirsiniz.',
            imagePath: 'assets/step3.png',
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard(BuildContext context,
      {required int stepNumber,
      required String title,
      required String description,
      required String imagePath}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adım $stepNumber',
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          FullScreenImageViewer(imagePath: imagePath),
                    ),
                  );
                },
                child: Image.asset(
                  imagePath,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FullScreenImageViewer extends StatelessWidget {
  final String imagePath;

  FullScreenImageViewer({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Resmi Görüntüle', style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          imageProvider: AssetImage(imagePath),
        ),
      ),
    );
  }
}
