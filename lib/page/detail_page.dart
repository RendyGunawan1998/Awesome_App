import '../core.dart';

class DetailPage extends StatelessWidget {
  final Photo image;

  const DetailPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Gambar')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Image.network(image.src.original),
              Text('Photographer: ${image.photographer}'),
              Text(image.alt),
              Text(
                image.url,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
