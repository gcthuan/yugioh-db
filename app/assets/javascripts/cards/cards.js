yugiohDb.factory('cards', ['$http', function($http) {
	var obj = {};
	obj.getOne = function(cardId) {
		return $http.get('/cards/' + cardId + '.json').then(function(response) {
			return response.data;
		});
	};

	obj.getPopular = function() {
		return $http.get('/cards/popular').then(function(response) {
			return response.data;
		})
	};

	return obj;
}]);