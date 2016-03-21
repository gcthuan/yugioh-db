yugiohDb.controller("FindCtrl", ['$scope', '$http', '$location', 'cards' ,function($scope, $http, $location,cards) {

	var page = 0;
	var familyValue = $location.search().family;
	var typeValue = $location.search().type;


	$scope.result = [];


	$scope.load = function() {
		if (familyValue !== undefined || typeValue !== undefined) {
			page += 1;
			$http.get('/find.json', {
				params: {
					family: familyValue,
					type: typeValue,
					page: page
				}
			}).then(function(response) {
				response.data.map(function(item) {	
					$scope.result.push(item);
				})
			});
		}
	}

}]);