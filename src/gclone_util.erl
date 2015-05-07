-module(gclone_util).
-include("includes.hrl").

-export([newsdb_url/0,
		 videosdb_url/0,		 		  
		 video_count/3,
		 more_data/1,
		 video_data/1,
		 thumb_title_count/3,
		 thumb_title_video_count/3,
		 top_news_thumb_title_count/3,
		 us_news_thumb_title_count/3,
		 politics_news_thumb_title_count/3,
		 usmarkets_news_thumb_title_count/3,
		 more_news/3,
		 more_usnews/3,
		 more_worldnews/3,
		 more_politics/3,
		 more_usmarkets/3,
		 more_entertainment/3,
		 more_money/3,
		 more_videos/3,
		 news_count/1,
		 world_news_count/1,
		 usnews_count/1,
		 worldnews_count/1,
		 topnews_count/1,
		 politics_count/1,
		 usmarkets_count/1,
		 entertainment_count/1,
		 money_count/1,
		 videos_count/1,
		 news_item_url/1
		]).

newsdb_url() ->
	string:concat(?COUCHDB_URL, ?COUCHDB_TEXT_GRAPHICS)
.
videosdb_url() ->
	string:concat(?COUCHDB_URL, ?COUCHDB_TEXT_GRAPHICS_VIDEOS)
.

thumb_title_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/entertainment_design/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
thumb_title_video_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	Url1 = string:concat(?MODULE:videosdb_url(),"_design/video_movies/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.

top_news_thumb_title_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/text_us_top/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
us_news_thumb_title_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/text_us_domestic/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
usmarkets_news_thumb_title_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/text_us_markets/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
politics_news_thumb_title_count(Category, Limit, Skip) ->
	%http://couchdb.speakglobally.net/wildridge_latest/_design/slideshow/_view/us_nba?descending=true&limit=2
	Url1 = string:concat(?MODULE:newsdb_url(),"_design/text_us_politics/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.

news_item_url(Id) ->
	string:concat(?MODULE:newsdb_url(),Id)
.

more_data(Doc_id) ->
	string:concat(?MODULE:newsdb_url(), Doc_id)
.

more_news(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:newsdb_url(), "_design/text_us_world/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).
more_usnews(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:newsdb_url(), "_design/text_us_domestic/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).
more_worldnews(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:newsdb_url(), "_design/text_us_world/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).
more_politics(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:newsdb_url(), "_design/text_us_politics/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).

more_usmarkets(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:newsdb_url(), "_design/text_us_markets/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).
more_entertainment(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:newsdb_url(), "_design/text_us_entertainment/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).
more_money(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:newsdb_url(), "_design/text_us_money/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).

more_videos(Category, Limit, Skip) ->
	Url  = string:concat(?MODULE:videosdb_url(), "_design/video_world_news/_view/"), 
	Url1 = string:concat(Url,Category ),	
	Url3 = string:concat(Url1, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip).

news_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/entertainment_design/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
world_news_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_top/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
usnews_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_domestic/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
worldnews_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_world/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
topnews_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_top/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
politics_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_politics/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
usmarkets_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_markets/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
entertainment_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_entertainment/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.
money_count(Category) ->
	Url1 = string:concat(?MODULE:newsdb_url(), "_design/text_us_money/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.

videos_count(Category) ->
	Url1 = string:concat(?MODULE:videosdb_url(), "_design/video_world_news/_view/"),
	Url2 = string:concat(Url1, Category),	
	string:concat(Url2, "?descending=true&limit=1")
.

video_count(Category, Limit, Skip) ->
	Url1 = string:concat(?MODULE:videosdb_url(),"_design/video_world_news/_view/"),
	Url2 = string:concat(Url1, Category),
	Url3 = string:concat(Url2, "?descending=true&limit="),
	Url4 = string:concat(Url3, Limit),
	Url5 = string:concat(Url4, "&skip="),
	string:concat(Url5, Skip)
.
video_data(Doc_id) ->
	string:concat(?MODULE:videosdb_url(), Doc_id)
.

