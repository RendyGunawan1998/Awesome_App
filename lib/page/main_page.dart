import '../core.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImageController imageController = Get.put(ImageController());
  bool gridView = true;

  @override
  void initState() {
    super.initState();
    imageController.fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool isScrolled) {
          return [
            SliverAppBar(
              title: Text('Awesome App'),
              expandedHeight: 100,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://picsum.photos/id/1018/1000/600',
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print('press list');
                      gridView = false;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.grid_on,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      print('press grid');
                      gridView = true;
                    });
                  },
                ),
              ],
            ),
          ];
        },
        body: Obx(() {
          if (imageController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (imageController.images.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/nofile.png',
                  height: 50,
                ),
                Text('Tidak ada gambar'),
              ],
            ));
          } else {
            return gridView
                ? InfiniteScrollGridPaginationBuilder(
                    itemCount: imageController.images.length,
                    itemBuilder: (context, index) {
                      final image = imageController.images[index];
                      return InkWell(
                        onTap: () {
                          Get.to(DetailPage(image: image));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  image.src.original,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Text(
                                image.alt,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    hasMore: imageController.hasNextPage.value,
                    onLoading: imageController.fetchImages)
                : InfiniteScrollPaginationBuilder(
                    itemCount: imageController.images.length,
                    hasMore: imageController.hasNextPage.value,
                    onLoading: imageController.fetchImages,
                    itemBuilder: (context, index) {
                      final image = imageController.images[index];

                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            Get.to(DetailPage(image: image));
                          },
                          child: Column(
                            children: [
                              Image.network(image.src.original),
                              Text(
                                image.alt,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.blue[300],
          onPressed: () {
            imageController.resetImages();
          },
          child: Center(
            child: Icon(Icons.restore),
          ),
        ),
      ),
    );
  }
}
