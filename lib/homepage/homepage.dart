import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_demo/utils/app_color.dart';
import 'package:riverpod_demo/utils/app_string.dart';
import 'package:riverpod_demo/utils/common_textstyle.dart';
import 'homepage_controller.dart';

final home1Provider = FutureProvider((ref) {
  return ref.read(homeProvider).getCoinListFromApi();
});

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(home1Provider);

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: AppColor.darkBlue,
          title: CommonTextStyle.label(
              text: AppString.coinApp,
              size: 18.0,
              color: AppColor.white,
              fontWeight: FontWeight.w600),
          centerTitle: true,
        ),
        body: provider.when(
          data: (data) {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                itemCount: data!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: index % 5 == 0 ? AppColor.yellow : index % 5 == 1 ? AppColor.orange : index % 5 == 2 ? AppColor.lightBlue : index % 5 == 3 ? AppColor.lightPink : AppColor.lightGreen,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 5),
                          blurRadius: 5,
                          color: const Color(0xFFD3D3D3).withOpacity(.84),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: const Color(0xffECECEC),
                              borderRadius: BorderRadius.circular(5)),
                          child: CachedNetworkImage(
                            imageUrl: data[index].image.toString(),
                            width: 35,
                            height: 35,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            placeholder: (context, url) => Image.network(
                              AppString.staticImage,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                            errorWidget: (context, url, error) => Image.network(
                              AppString.staticImage,
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              child: CommonTextStyle.label(
                                  text: data[index].name.toString(),
                                  color: AppColor.black,
                                  fontWeight: FontWeight.w600,
                                  size: 15),
                            ),
                            CommonTextStyle.label(
                                text: data[index].dataStart.toString(),
                                size: 10.0,
                                fontWeight: FontWeight.w400,
                                color: AppColor.grey)
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 5),
                              child: CommonTextStyle.label(
                                  text: '${data[index].volume1HrsUsd!.toDouble().toStringAsFixed(2)} ₹',
                                  size: 12.0,
                                  color: AppColor.lightSky,
                                  fontWeight: FontWeight.w500),
                            ),
                            CommonTextStyle.label(
                                text: '${data[index].volume1DayUsd!.toDouble().toStringAsFixed(2)} ₹',
                                size: 12.0,
                                color: AppColor.lightSky,
                                fontWeight: FontWeight.w500),
                          ],
                        )
                      ],
                    ),
                  );
                });
          },
          error: (err, s) {
            return const Text('some thing went wrong');
          },
          loading: () => const Center(child: CircularProgressIndicator()),
        ));
  }
}
