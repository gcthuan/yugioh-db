yugiohDb.factory('sets', ['$http', function ($http) {
	obj = {};
	var page = 0;
	
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

	obj.getAll = function() {
		page += 1;
		return $http.get('/card_sets.json?page=' + page).then(function(response) {
			return response.data;
		});
		
	};

	return obj;
}]);