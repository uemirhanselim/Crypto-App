part of 'package:crypto_app/view/market/market_view.dart';

class _NewsCarousel extends StatelessWidget {
  const _NewsCarousel({required this.marketViewModel});
  final MarketViewModel marketViewModel;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(height: 220.0),
      items: [0, 1, 2, 3, 4].map((i) {
        return Builder(
          builder: (context) {
            return InkWell(
              onTap: () {
                marketViewModel.goToWebsite(url: DummyNewsData.newsUrls[i]);
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: DummyNewsData.news[i], fit: BoxFit.cover),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black,
                              Colors.black87,
                              Colors.black54,
                              Colors.black38,
                              Colors.transparent,
                            ]),
                      ),
                      height: 100,
                      width: double.maxFinite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Spacer(),
                            Text(
                              DummyNewsData.newsTitles[i],
                              style: const TextStyle(
                                  fontSize: 18.0, color: Colors.white),
                            ),
                            Expanded(
                              child: Text(
                                textAlign: TextAlign.start,
                                DummyNewsData.newsDescription[i],
                                maxLines: 2,
                                style: const TextStyle(
                                    fontSize: 13.0, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
            );
          },
        );
      }).toList(),
    );
  }
}
