yugiohDb.controller("MainCtrl", ['popularCards', 'popularSets', 'randomCard','$scope', '$http', function (popularCards, popularSets, randomCard, $scope, $http) {
	$scope.popularCards = popularCards;
	$scope.popularSets = popularSets;
	$scope.randomCard = randomCard;
}]);