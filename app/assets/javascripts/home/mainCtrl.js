yugiohDb.controller("MainCtrl", ['popularCards', '$scope', function(popularCards, $scope) {
	$scope.popularCards = popularCards;
}]);