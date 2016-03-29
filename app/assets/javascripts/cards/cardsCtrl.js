yugiohDb.controller("CardsCtrl", ['card', 'cards', '$scope', 'Auth', function (card, cards, $scope, Auth) {
	$scope.card = card;
	Auth.currentUser().then(function (user) {
		$scope.user = user;
	})
	$scope.addComment = function() {
		console.log($scope.user);
		if ($scope.body === "") {
			return;
		}
		else {
			cards.addComment(card.slug, {
				author: $scope.user.username || "Guest",
				body: $scope.body
			}).success(function(data) {
				$scope.card.comments.push(data);
			});
		}
		$scope.body = "";
	};

	$scope.upVote = function(comment) {
		cards.upvoteComment(card.slug, comment);
	};

	$scope.downVote = function(comment) {
		cards.downvoteComment(card.slug, comment);
	};
}]);