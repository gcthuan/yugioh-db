yugiohDb.controller("CardsCtrl", ['card', 'cards', '$scope', 'Auth', '$rootScope', '$document', function (card, cards, $scope, Auth, $rootScope, $document) {
	$scope.card = card;
	Auth.currentUser().then(function (user) {
		$scope.user = user;
	})
	$scope.addComment = function() {
		if ($scope.body === "") {
			return;
		}
		else {
			if ($scope.user === undefined) {
				username = "Guest";
			}
			else {
				username = $scope.user.username;
			}
			cards.addComment(card.slug, {
				author: username,
				body: $scope.body
			}).success(function(data) {
				$scope.card.comments.push(data);
			});
		}
		$scope.body = "";
	};

	$scope.upVote = function(comment) {
		if (comment.currentVote === "downvote") {
			comment.currentVote = "";
		}
		else if (comment.currentVote === undefined || comment.currentVote === ""){
			comment.currentVote = "upvote";
		}
		else {
			return;
		}
		cards.upvoteComment(card.slug, comment);
	};

	$scope.downVote = function(comment) {
		if (comment.currentVote === "upvote") {
			comment.currentVote = "";
		}
		else if (comment.currentVote === undefined || comment.currentVote === ""){
			comment.currentVote = "downvote";
		}
		else {
			return;
		}
		cards.downvoteComment(card.slug, comment);
	};

	$rootScope.$on('$stateChangeSuccess', function() {
   		$document[0].body.scrollTop = $document[0].documentElement.scrollTop = 0;
	});

}]);