yugiohDb.factory('cards', ['$http', function($http) {
	var obj = {};
	var page = 0;

	obj.getOne = function(cardId) {
		return $http.get('/cards/' + cardId + '.json').then(function(response) {
			return response.data;
		});
	};
	
	obj.getPopular = function() {
		return $http.get('/cards/popular').then(function(response) {
			return response.data;
		});
	};
	
	obj.getRandom = function() {
		return $http.get('/cards/random').then(function(response) {
			return response.data;
		});
	};

	obj.getAll = function() {
		return $http.get('/cards.json?page=' + page).then(function(response) {
			return response.data;
		});
		page += 1;
	};

	return obj;
}]);