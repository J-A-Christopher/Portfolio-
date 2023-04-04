import 'package:flutter/material.dart';

class TourItem extends StatelessWidget {
  final String pageTitle;
  final String imgUrl;
  const TourItem({super.key, required this.pageTitle, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: Text(
          pageTitle,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(imgUrl),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () async {
                // final urlImage = imgUrl;
                // final url = Uri.parse(urlImage);
                // final response = await http.get(url);
                // final bytes = response.bodyBytes;
                // final temp = await getTemporaryDirectory();
                // final path = '${temp.path}/image.jpg';
                // File(path).writeAsBytesSync(bytes);
                // await Share.share(
                //   [path] as String,
                // );
              },
              backgroundColor: Colors.orange,
              child: const Icon(
                Icons.share,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
