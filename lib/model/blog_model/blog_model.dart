class Blog {
  final String title;
  final String description;
  final String date;
  final String link;
  final String logo;

  Blog(this.title, this.description, this.date, this.link, this.logo);
}

List<Blog> blogList = [
  Blog('Mavi Arge', 'Flutter state management nedir?', '07/23',
      'https://medium.com/@ibedirhantong', 'assets/images/maviarge.png'),
  Blog('Mavi Arge', 'Flutterda Map view nasıl kullanılır?', '07/23',
      'https://medium.com/@ibedirhantong', 'assets/images/maviarge.png'),
  Blog(
      'Mavi Arge',
      'Flutter ile Birden Fazla Ekran Yönetimi: Navigator Kullanımı',
      '07/23',
      'https://medium.com/@ibedirhantong',
      'assets/images/maviarge.png'),
  Blog(
      'Mavi Arge',
      'Flutter ve Firebase: Mobil Uygulamalarınızı Güçlendirmek İçin Birleştirme Rehberi',
      '07/23',
      'https://medium.com/@ibedirhantong',
      'assets/images/maviarge.png'),
  Blog('Mavi Arge', 'Flutter ile Veri Getirme ve API Entegrasyonu', '07/23',
      'https://medium.com/@ibedirhantong', 'assets/images/maviarge.png'),
  Blog('Mavi Arge', 'Flutter Uygulamanızı Yayınlama ve Dağıtma Rehberi',
      '07/23', '', 'assets/images/maviarge.png'),
  Blog('Mavi Arge', 'Flutter Web: Web Uygulamaları Oluşturma Rehberi', '07/23',
      'https://medium.com/@ibedirhantong', 'assets/images/maviarge.png'),
  Blog('Mavi Arge', 'Flutter ile Özel Animasyonlar Oluşturma', '07/23',
      'https://medium.com/@ibedirhantong', 'assets/images/maviarge.png'),
];
