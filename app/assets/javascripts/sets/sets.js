yugiohDb.factory('sets', ['$http', function ($http) {
	obj = {};

	obj.getOne = function(setId) {
		return $http.get('/card_sets/' + setId + '.json').then(function(response) {
			return response.data;
		});
	};

	// obj.convertCardNameToUrl = function(name) {
	// 	return '/cards/' + name.toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/(^-|-$)/g,'');
	// };

	return obj;
}]);