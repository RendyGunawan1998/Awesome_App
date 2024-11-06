import 'package:http/http.dart' as http;

import '../core.dart';

class ImageController extends GetxController {
  var isLoading = false.obs;
  var images = <Photo>[].obs;
  var currentPage = 1.obs;
  var hasNextPage = true.obs;

  Future<void> fetchImages() async {
    print('call fetch images');
    if (!hasNextPage.value) return;
    isLoading.value = true;
    try {
      final url = Uri.parse(
          'https://api.pexels.com/v1/curated/?page=${currentPage.value}&per_page=15');
      final response = await http.get(url, headers: {
        'Authorization':
            'SRECKXNU482HecJrgTt4o6x76dw3coAw9ntofPxK21OW9JrOMmTbBvIF',
      });
      print('RES CODE :: ${response.statusCode}');
      // print('RES HEADER :: ${response.headers}');
      // print('RES BODY :: ${response.body}');
      final data = jsonDecode(response.body);
      final imageModel = ImageModel.fromJson(data);
      images.addAll(imageModel.photos);
      currentPage.value++;
      hasNextPage.value = imageModel.nextPage != '';
      print('sukses');
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void resetImages() {
    images.clear();
    currentPage.value = 1;
    hasNextPage.value = true;
    fetchImages();
  }
}
