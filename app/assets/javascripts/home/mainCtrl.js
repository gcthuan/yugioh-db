yugiohDb.controller("MainCtrl", ['popularCards', '$scope', '$http', function(popularCards, $scope, $http) {
	$scope.popularCards = popularCards;
	var n = 1;
	var getItemByFamily = function(value, page) {
		$http.get('search', {
			params: {
				q: value,
				page: page
			}
		}).then(function(response) {
			return response.data.map(function(item) {
				// console.log(item);
				return item;
			})
		});
	};

	$scope.array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20];
	$scope.test = function() {
		console.log(getItemByFamily("light", n));
		// $scope.array.push();
		n += 1;
	};
}]);