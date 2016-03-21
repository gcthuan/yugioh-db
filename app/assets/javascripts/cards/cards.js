yugiohDb.factory('cards', ['$http', function($http) {
	var obj = {};
	// get a card by Id
	obj.getOne = function(cardId) {
		return $http.get('/cards/' + cardId + '.json').then(function(response) {
			return response.data;
		});
	};
	// get top view cards
	obj.getPopular = function() {
		return $http.get('/cards/popular').then(function(response) {
			return response.data;
		})
	};
	// get a random card
	obj.getRandom = function() {
		return $http.get('/cards/random').then(function(response) {
			return response.data;
		})
	};

	return obj;
}]);