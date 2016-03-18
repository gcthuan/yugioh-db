yugiohDb.factory('sets', ['$http', function ($http) {
	obj = {};

	obj.getOne = function(setId) {
		return $http.get('/card_sets/' + setId + '.json').then(function(response) {
			return response.data;
		});
	};

	obj.getPopular = function() {
		return $http.get('/sets/popular').then(function(response) {
			return response.data;
		})
	};

	return obj;
}]);