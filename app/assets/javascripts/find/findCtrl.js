yugiohDb.controller("FindCtrl", ['$scope', '$http', '$location', 'cards', '$window' ,function ($scope, $http, $location, cards, $window) {

	var page = 0;
	var familyValue = $location.search().family;
	var typeValue = $location.search().type;
	$scope.result = [];
	$scope.busy = false;


	$scope.load = function () {
		
		if (familyValue === undefined && typeValue === undefined) {
			$scope.busy = true;
		}
		else {
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
	};

	$scope.familyFind = function (val) {
		// $location.path('/find?family=' + val);
		var page = 0;
		$window.location.href = '/find?family=' + val;
	};

	$scope.typeFind = function (val) {
		// $location.path('/find?type=' + val);
		var page = 0;
		$window.location.href = '/find?type=' + val;
	};


}]);