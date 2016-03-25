yugiohDb.controller("BrowseCardsCtrl", ['browseCards','$scope', '$http', function (browseCards, $scope, $http) {
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

}]);