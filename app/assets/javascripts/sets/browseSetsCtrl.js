yugiohDb.controller("BrowseSetsCtrl", ['browseSets','$scope', '$http', function(browseSets, $scope, $http) {
	$scope.browseSets = browseSets;
	var page = 0;

	$scope.load = function() {
		page += 1;
		$http.get('/card_sets.json?page=' + page).then(function(response) {
			response.data.map(function(item) {	
				$scope.browseSets.push(item);
			})
		});
		
	};

}]);