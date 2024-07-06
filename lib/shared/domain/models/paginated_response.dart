const int PER_PAGE_LIMIT = 20;

class PaginatedResponse<T> {
  final int totalDocs;
  final int limit;
  final int totalPages;
  final int page;
  final int pagingCounter;
  final bool hasPrevPage;
  final bool hasNextPage;
  final int? prevPage;
  final int? nextPage;
  final List<T> docs;

  PaginatedResponse({
    required this.totalDocs,
    required this.limit,
    required this.totalPages,
    required this.page,
    required this.pagingCounter,
    required this.hasPrevPage,
    required this.hasNextPage,
    this.prevPage,
    this.nextPage,
    required this.docs,
  });

  factory PaginatedResponse.fromJson(dynamic json, List<T> docs,
      {Function(dynamic json)? fixture}) {
    return PaginatedResponse(
      totalDocs: json['totalDocs'] ?? 0,
      limit: json['limit'] ?? PER_PAGE_LIMIT,
      totalPages: json['totalPages'] ?? 0,
      page: json['page'] ?? 0,
      pagingCounter: json['pagingCounter'] ?? 0,
      hasPrevPage: json['hasPrevPage'] ?? false,
      hasNextPage: json['hasNextPage'] ?? false,
      prevPage: json['prevPage'],
      nextPage: json['nextPage'],
      docs: docs,
    );
  }

  @override
  String toString() {
    return 'PaginatedResponse(totalDocs:$totalDocs, limit:$limit, totalPages:$totalPages, page:$page, pagingCounter:$pagingCounter, hasPrevPage:$hasPrevPage, hasNextPage:$hasNextPage, prevPage:$prevPage, nextPage:$nextPage, docs:${docs.length})';
  }
}
