abstract class SearchEvent  {
  const SearchEvent();


}


class GetSearchSurahEvent extends SearchEvent {
  final String name;
  GetSearchSurahEvent({required this.name});
}
