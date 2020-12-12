abstract class NewsUseCase {
  Future<String> getExample();
  Future<String> getTopHeadline(String country, String category, int pageSize, int page);
}