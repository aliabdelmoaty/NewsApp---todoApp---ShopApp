abstract class NewsStates{}
class NewsInitialState extends NewsStates{}
class NewsBottomNavState extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}
class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates
{
final String e;
NewsGetBusinessErrorState(this.e);
}
class NewsGetSportLoadingState extends NewsStates{}
class NewsGetSportSuccessState extends NewsStates{}
class NewsGetSportErrorState extends NewsStates
{
  final String e;
  NewsGetSportErrorState(this.e);
}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetSciencesErrorState extends NewsStates
{
  final String e;
  NewsGetSciencesErrorState(this.e);
}
class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates
{
  final String e;
  NewsGetSearchErrorState(this.e);
}