import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/blog_model/blog_model.dart';
import '../../../res/constants.dart';
import '../../../viewmodel/getx_controller/experience_controller.dart';
import '../../../viewmodel/responsive.dart';
import 'blog_info.dart';

class BlogGrid extends StatefulWidget {
  const BlogGrid(
      {super.key, required int crossAxisCount, required double ratio});

  @override
  State<BlogGrid> createState() => _BlogGridState();
}

class _BlogGridState extends State<BlogGrid> {
  final controller = Get.put(BlogController());
  final PageController _pageController = PageController();
  final TextEditingController searchController = TextEditingController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final int itemsPerPage = Responsive.isMobile(context)
        ? 4
        : 4; // Her sayfada kaç öğe görüneceğini belirtin
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search for a blog',
              prefixIcon: const Icon(Icons.search, color: Colors.white),
              // Arama simgesi rengi
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.deepPurpleAccent, // Odaklandığında border rengi
                ),
                borderRadius: BorderRadius.circular(
                    10), // Odaklandığında border yuvarlaklığı
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.white54, // Normal durumda border rengi
                ),
                borderRadius: BorderRadius.circular(
                    10), // Normal durumda border yuvarlaklığı
              ),
              filled: true,
              fillColor: Colors.black.withOpacity(0.4),
              // Arka plan rengi ve opaklık
              labelStyle: const TextStyle(color: Colors.white), // Etiket rengi
            ),
            style: const TextStyle(color: Colors.white54),
            onChanged: (value) {
              setState(
                () {
                  // Filtreleme işlemini burada gerçekleştirin.
                  // Örneğin, visibleBlogs listesini güncellemek için
                  // bu değeri kullanabilirsiniz.
                },
              );
            },
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: (blogList.length / itemsPerPage).ceil(),
            onPageChanged: (int page) {
              setState(() {
                currentPage = page;
              });
            },
            itemBuilder: (context, page) {
              final startIndex = page * itemsPerPage;
              final endIndex = startIndex + itemsPerPage;
              final visibleBlogs = blogList.sublist(startIndex,
                  endIndex < blogList.length ? endIndex : blogList.length);

              return ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: visibleBlogs.length,
                itemBuilder: (context, index) {
                  final blog = visibleBlogs[index];
                  if (!blog.description
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())) {
                    // Arama terimine uyan bir blog değilse boş bir konteynır döndürün
                    return Container();
                  }
                  return Obx(
                    () => AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      margin: const EdgeInsets.symmetric(
                          vertical: defaultPadding, horizontal: defaultPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: const LinearGradient(
                          colors: [Colors.black, Colors.black],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurpleAccent,
                            offset: const Offset(-2, 0),
                            blurRadius: controller.hovers[index] ? 20 : 10,
                          ),
                          BoxShadow(
                            color: Colors.cyanAccent,
                            offset: const Offset(2, 0),
                            blurRadius: controller.hovers[index] ? 20 : 10,
                          ),
                        ],
                      ),
                      child: BlogStack(index: index),
                    ),
                  );
                },
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 65.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              (blogList.length / itemsPerPage).ceil(),
              (pageIndex) => GestureDetector(
                onTap: () {
                  _pageController.animateToPage(
                    pageIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: currentPage == pageIndex
                        ? Colors.deepPurpleAccent // Aktif sayfa rengi
                        : Colors.grey, // Pasif sayfa rengi
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
