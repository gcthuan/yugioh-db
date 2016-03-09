yugiohDb.controller("SearchCtrl", function($scope, $http, $window, $location) {
	$scope.getItem = function(name) {
		return $http.get('search', {
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
	};
});