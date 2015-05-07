var app = angular.module('gclone', ['ui.bootstrap']);

app.factory('gcloneHomePageService', function ($http) {
	return {		

		gettopNews: function (category, count, skip) {
			return $http.get('/api/topnews/channel?c=' + category + '&l=' + count + '&skip=' + skip).then(function (result) {
				// return result.data.rows;
        return result.data.articles;
			});
		},		
		getUSNews: function (category, count, skip) {
			return $http.get('/api/usnews/channel?c=' + category + '&l=' + count + '&skip=' + skip).then(function (result) {
				return result.data.rows;
			});
		},
    getPoliticsNews: function (category, count, skip) {
      return $http.get('/api/politicsnews/channel?c=' + category + '&l=' + count + '&skip=' + skip).then(function (result) {
        return result.data.rows;
      });
    },
    getUSMarketsNews: function (category, count, skip) {
      return $http.get('/api/usmarkets/channel?c=' + category + '&l=' + count + '&skip=' + skip).then(function (result) {
        return result.data.rows;
      });
    },
    getEntertainmentNews: function (category, count, skip) {
      return $http.get('/api/entertainment/channel?c=' + category + '&l=' + count + '&skip=' + skip).then(function (result) {
        return result.data.rows;
      });
    },
		getVideo: function (category, count, skip) {
			return $http.get('/api/videos/channel?c=' + category + '&l=' + count + '&skip=' + skip).then(function (result) {
				// return result.data.rows;
        return result.data.articles;
			});

		}			
	};
});

app.controller('GcloneHome', function ($scope, gcloneHomePageService) {
  //the clean and simple way
  $scope.latestVideos = gcloneHomePageService.getVideo('by_id_title_desc_thumb_date',3,0);
  $scope.trendingVideos = gcloneHomePageService.getVideo('by_id_title_desc_thumb_date',4,3);
  $scope.topNews      = gcloneHomePageService.gettopNews('Top',4,0);
  $scope.USNews       = gcloneHomePageService.gettopNews('US',6,0);
  $scope.PoliticsNews = gcloneHomePageService.gettopNews('Politics',6,0);
  $scope.popularStories = gcloneHomePageService.gettopNews('PoliticsSkip',4,2);
  $scope.USMarkets    = gcloneHomePageService.gettopNews('Markets',6,0);
  $scope.entertainmentNews = gcloneHomePageService.gettopNews('Entertainment',6,0);    
  
  //for video player
  	var video = "http://video.contentapi.ws/"+$('#video_val').val() 	
 	// start of code for generating cb,pagetit,pageurl
 	// var vastURI = 'http://vast.optimatic.com/vast/getVast.aspx?id=en732n1l1f3&zone=vpaidtag&pageURL=[INSERT_PAGE_URL]&pageTitle=[INSERT_PAGE_TITLE]&cb=[CACHE_BUSTER]';
	// var vastURI = 'http://ad4.liverail.com/?LR_PUBLISHER_ID=44293&LR_SCHEMA=vast2-vpaid';
	
	$scope.loadVideo = function(){
		$(document).ready(function() {			
			jwplayer('trailor').setup({
                  "flashplayer": "http://player.longtailvideo.com/player.swf",
                  "playlist": [
                    {
                      "file": video
                    }
                  ],
                  "width": 638,
                  "height": 330,
                  stretching: "exactfit",
                  skin: "http://content.longtailvideo.com/skins/glow/glow.zip",
                  autostart: true,
                  "controlbar": {
                    "position": "bottom"
                  },
                  "plugins": {
                  	 "autoPlay": true,
                    "ova-jw": {
                      "ads": {                        
                        "schedule": [
                          {
                            "position": "pre-roll",
                            // "tag": updateURL(vastURI)
                            "tag": "http://ad4.liverail.com/?LR_PUBLISHER_ID=44293&LR_SCHEMA=vast2-vpaid"
                          }
                        ]
                      },
                      "debug": {
                        "levels": "none"
                      }
                    }
                  }
                });
		})
	
	};
});