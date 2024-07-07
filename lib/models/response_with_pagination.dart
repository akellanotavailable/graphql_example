class ResponseWithPagination<T> {
  ResponseWithPagination({
    required this.results,
    required this.cursor,
    required this.hasNextPage,
  });
  final List<T> results;
  final String cursor;
  final bool hasNextPage;
}
