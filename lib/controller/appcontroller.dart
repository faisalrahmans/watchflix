import 'package:get/get.dart';
import 'package:watchflix/model/postmodel.dart';
import 'package:watchflix/model/tvModel.dart';
import 'package:watchflix/services/services.dart';
import 'package:watchflix/services/tv_services.dart';

class AppController extends GetxController {
  var getNowPlayingPosts = <Postmodel>[].obs;
  var getTopratedPosts = <Postmodel>[].obs;
  var getTrendingPosts = <Postmodel>[].obs;
  var getTvAiringToday = <Tvmodel>[].obs;
  var getTvOnAir = <Tvmodel>[].obs;
  var getTvPopular = <Tvmodel>[].obs;
  var getTvTopRated = <Tvmodel>[].obs;
  var postloadingNowPlaying = true.obs;
  var postloadingToprated = true.obs;
  var postloadingTrending = true.obs;
  var tvloadingAiringToday = true.obs;
  var tvloadingOnAir = true.obs;
  var tvloadingPopular = true.obs;
  var tvloadingTopRated = true.obs;
  Services services = Services();
  TvServices tvServices = TvServices();

  @override
  void onInit() {
    super.onInit();
    callNowPlayingMethod();
    callTopratedMethod();
    callTrendingMethod();
    callTvAiringTodayMethod();
    callTvOnAirMethod();
    callTvPopularMethod();
    callTvTopRatedMethod();
  }

  void callNowPlayingMethod() async {
    try {
      postloadingNowPlaying.value = true;
      var result = await services.getNowPlayingMovies();
      if (result != null) {
        getNowPlayingPosts.assignAll(result);
      } else {
        print("Result for Now Playing is null");
      }
    } finally {
      postloadingNowPlaying.value = false;
      update();
    }
  }

  void callTopratedMethod() async {
    try {
      postloadingToprated.value = true;
      var result = await services.getTopratedMovies();
      if (result != null) {
        getTopratedPosts.assignAll(result);
      } else {
        print("Result for Top Rated is null");
      }
    } finally {
      postloadingToprated.value = false;
      update();
    }
  }

  void callTrendingMethod() async {
    try {
      postloadingTrending.value = true;
      var result = await services.getTrendingMovies();
      if (result != null) {
        getTrendingPosts.assignAll(result);
      } else {
        print("Result for Trending is null");
      }
    } finally {
      postloadingTrending.value = false;
      update();
    }
  }

  void callTvAiringTodayMethod() async {
    try {
      tvloadingAiringToday.value = true;
      var result = await tvServices.getTvAiringToday();
      if (result != null) {
        getTvAiringToday.assignAll(result);
      } else {
        print("Result for Airing Today is null");
      }
    } finally {
      tvloadingAiringToday.value = false;
      update();
    }
  }

  void callTvOnAirMethod() async {
    try {
      tvloadingOnAir.value = true;
      var result = await tvServices.getTvOnTheAir();
      if (result != null) {
        getTvOnAir.assignAll(result);
      } else {
        print("Result for On Air is null");
      }
    } finally {
      tvloadingOnAir.value = false;
      update();
    }
  }

  void callTvPopularMethod() async {
    try {
      tvloadingPopular.value = true;
      var result = await tvServices.getTvPopular();
      if (result != null) {
        getTvPopular.assignAll(result);
      } else {
        print("Result for TV Popular is null");
      }
    } finally {
      tvloadingPopular.value = false;
      update();
    }
  }
  
  void callTvTopRatedMethod() async {
    try {
      tvloadingTopRated.value = true;
      var result = await tvServices.getTvTopRated();
      if (result != null) {
        getTvTopRated.assignAll(result);
      } else {
        print("Result for TV Top Rated is null");
      }
    } finally {
      tvloadingTopRated.value = false;
      update();
    }
  }
}
