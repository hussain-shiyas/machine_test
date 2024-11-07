import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:test_project/core/endpoints/endpoints.dart';
import 'package:test_project/core/services/location_services.dart';
import 'package:test_project/ui/homescreen/domain/model/home_page_res_model.dart';
import 'package:test_project/ui/homescreen/presentation/provider/home_page_notifier_provider.dart';
import 'package:test_project/ui/homescreen/presentation/widget/carousel.dart';
import 'package:test_project/ui/homescreen/presentation/widget/product_card.dart';
import 'package:test_project/ui/homescreen/presentation/widget/product_detail_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final GlobalKey<State> _locationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homePageNotifierProvider.notifier).getHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeData = ref.watch(homePageNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: FutureBuilder<String>(
            key: _locationKey,
            future: LocationServices.getCurrentLocation(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text("Getting location...");
              } else if (snapshot.hasError) {
                return const Text("Home Screen");
              }
              return Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(Icons.my_location),
                  ),
                  Text(
                    snapshot.data ?? "Home Screen",
                    style: const TextStyle(color: Colors.black),
                  ),
                ],
              );
            }),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              size: 35,
            ),
          )
        ],
      ),
      body: homeData.when(
        loading: () => Skeletonizer(
          enabled: true,
          enableSwitchAnimation: true,
          child: SuccessData(
            successData: HomePageResModel.getDummyData(),
          ),
        ),
        failure: (d) => Column(
          children: [
            Skeletonizer(
              enabled: true,
              enableSwitchAnimation: true,
              child: SuccessData(
                successData: HomePageResModel.getDummyData(),
              ),
            ),
            // Optional: Show error message at bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Failed to load data: $d',
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
        initial: () => const Center(
          child: CircularProgressIndicator(),
        ),
        success: (successData) => SuccessData(
          successData: successData,
        ),
      ),
    );
  }
}

class SuccessData extends StatelessWidget {
  final HomePageResModel successData;

  const SuccessData({
    super.key,
    required this.successData,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselWidget(
            carouselImages: successData.products
                    ?.map((product) =>
                        EndPoints.imagePath + (product.thumb ?? ""))
                    .toList() ??
                [""],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Featured Products",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: successData.products?.length ?? 0,
              itemBuilder: (context, index) {
                final product = successData.products?[index] ?? Product();
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailPage(product: product),
                        ),
                      );
                    },
                    child: ProductCard(product: product));
              },
            ),
          ),
        ],
      ),
    );
  }
}
