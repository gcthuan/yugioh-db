yugiohDb.controller("MainCtrl", ['popularCards', 'popularSets','$scope', '$http', function(popularCards, popularSets,$scope, $http) {
	$scope.popularCards = popularCards;
	$scope.popularSets = popularSets;
}]);