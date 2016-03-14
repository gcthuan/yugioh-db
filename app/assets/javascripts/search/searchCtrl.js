yugiohDb.controller("SearchCtrl", ['$scope', '$http', '$location', 'cards' ,function($scope, $http, $location, cards) {

	$scope.result = [];

	$scope.getItem = function(name) {
		return $http.get('search.json', {
			params: {
				q: name
			}
		}).then(function(response) {
			return response.data.map(function(item) {
				return item;
			})
		});
	};

	$scope.onItemSelected = function($item, $model, $label) {
		if ($item.itype === 'card') {
			// $window.location.href = "cards/" + $item.slug + ".json";
			$location.path('/cards/' + $item.slug);
		}
		else {
			// $window.location.href = "card_sets/" + $item.slug + ".json";
			$location.path('/card_sets/' + $item.slug);
		}
		$scope.asyncSelected = '';
	};

	$http.get('cards/search', {
			params: {
				q: 'light',
				page: 1
			}
		}).then(function(response) {
			return response.data.map(function(item) {
				// console.log(item);
				
				$scope.result.push(item);

				
			})
		});

}]);