yugiohDb.controller("BrowseCardsCtrl", ['browseCards','$scope', '$http', '$rootScope', '$document', function (browseCards, $scope, $http, $rootScope, $document) {
	$scope.browseCards = browseCards;
	var page = 0;

	$scope.load = function() {
		page += 1;
		$http.get('/cards.json?page=' + page).then(function (response) {
			response.data.map(function (item) {	
				$scope.browseCards.push(item);
			})
		});
		
	};

	$rootScope.$on('$stateChangeSuccess', function() {
   		$document[0].body.scrollTop = $document[0].documentElement.scrollTop = 0;
	});

}]);