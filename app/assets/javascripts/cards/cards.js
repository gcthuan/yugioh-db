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
		page += 1;
		return $http.get('/cards.json?page=' + page).then(function(response) {
			return response.data;
		});
		
	};

	obj.addComment = function(cardSlug, comment) {
    return $http.post('/cards/' + cardSlug + '/comments.json', comment);
  	};

	obj.upvoteComment = function(cardSlug, comment) {
		return $http.put('/cards/' + cardSlug + '/comments/' + comment.id + '/upvote.json').success(function(data) {
		  comment.votes += 1;
		});
	};

	obj.downvoteComment = function(cardSlug, comment) {
		return $http.put('/cards/' + cardSlug + '/comments/' + comment.id + '/downvote.json').success(function(data) {
		  comment.votes -= 1;
		});
	};

	return obj;
}]);